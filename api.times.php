<?php
require_once("api.interface.php");

//A Time is either the starttime of a race, or an endtime of a racer
class Times extends APIInterface
{	
	
	//Constructor - make sure db gets connected
	public function __construct()
	{
		parent::__construct();
	}
	
	public function racetimes()
	{
		try
		{
			$sql = "SELECT r.ID, r.Description, r.CapHex, t.StartTime ".
				"FROM Races r ".
				"LEFT JOIN TimeRace t ON r.ID = t.RaceID ".
				"AND t.Status = 1";
			$query = mysql_query($sql, $this->db);
			if (mysql_num_rows($query) > 0)
			{
				$result = array();
				while ($rlt = mysql_fetch_array($query, MYSQL_ASSOC))
				{
					$result[] = $rlt;
				}
				$this->response($this->json($result), 200);
			}
			$this->response('',204);				
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}	
	
	public function startrace()
	{
		try
		{
			//Expected format: {"RaceID":1, "StartTime":"09-12-2014 12:15:20"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$race = (int)$postjson['RaceID'];
			$status = 1;
			$starttime = new DateTime($postjson['StartTime']);
			$mysqldate = $starttime->format("Y-m-d H:i:s");
			
			$updatesql = "UPDATE TimeRace SET Status = 0 WHERE RaceID = $race";
			mysql_query($updatesql, $this->db);
			
			$sql = "INSERT INTO TimeRace (RaceID, StartTime, Status) ".
			"VALUES ($race, '$mysqldate', $status)";
			
			$retval = mysql_query($sql, $this->db);
			$sqlid = mysql_insert_id();	
			$resp = array('ID' => $sqlid);
		
			$this->response(json_encode($resp), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":-1}',400);
		}		
	}	
	
	public function swimmerfinish()
	{
		try
		{
			//Expected format: {"RacerNumber":1, "FinishTime":"09-12-2014 12:15:20"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$racernum = (int)$postjson['RacerNumber'];
			$status = 1;
			$finishtime = new DateTime($postjson['FinishTime']);
			$mysqldate = $finishtime->format("Y-m-d H:i:s");
						
			$swimmersql = "SELECT ID From RaceSwimmers WHERE RacerNumber = $racernum limit 1";
			$swimmerresult = mysql_query($swimmersql, $this->db);
			$swimmerid = mysql_fetch_row($swimmerresult);
			
			$sql = "INSERT INTO TimeSwimmer (RaceSwimmerID, FinishTime, Status) ".
			"VALUES ($swimmerid[0], '$mysqldate', $status)";
			
			$retval = mysql_query($sql, $this->db);
			$sqlid = mysql_insert_id();	
			$resp = array('ID' => $sqlid);
		
			$this->response(json_encode($status), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":-1}',400);
		}		
	}	
	
}

?>

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
	
	//Function to get Race Times
	public function racetimes()
	{
		try
		{
			$result = $this->get_sproc("GET_RACETIMES");
			$this->response($this->json($result), 200);
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
			$starttime = new DateTime();
			$mysqldate = $starttime->format("Y-m-d H:i:s");
			
			$result = $this->call_sproc("SP_RESETTIMERACE($race)");
			$result = $this->call_sproc("INSERT_TIMERACE($race, '$mysqldate', $status)");
			$this->response($this->json($result), 200);

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
			$result = array();
			//$finishtime = new DateTime($postjson['FinishTime']);
			$finishtime = new DateTime();
			//$finishtime->setTimezone(new DateTimeZone('America/St_Thomas'));
			$mysqldate = $finishtime->format("Y-m-d H:i:s");
			
			$sql = "SELECT ID From RaceSwimmers WHERE RacerNumber = $racernum limit 1";
			$idResult = mysql_query($sql, $this->db);
			$swimmerid = mysql_fetch_row($idResult);
			
			$sql = "INSERT INTO TimeSwimmer (RaceSwimmerID, FinishTime, Status) ".
				"VALUES ($swimmerid[0], '$mysqldate', $status)";			
			$retval = mysql_query($sql, $this->db);
			$sqlid = mysql_insert_id();	

			$sql = "SELECT rs.ID, ts.ID as TimeID, \n"
				. "ts.FinishTime, \n"
				. "tr.StartTime,\n"
				. "rs.RacerNumber, s.firstname, s.lastname, r.Description, r.CapHex\n"
				. "FROM RaceSwimmers rs, Swimmers s, Races r, TimeSwimmer ts, TimeRace tr\n"
				. "WHERE rs.RacerNumber = $racernum\n"
				. "AND rs.SwimmerID = s.ID\n"
				. "AND rs.RaceID = r.ID\n"
				. "AND rs.RaceID = tr.RaceID\n"
				. "AND ts.ID = $sqlid\n"
				. "	 limit 1";

			$query = mysql_query($sql, $this->db);
			$result = array();
			if (mysql_num_rows($query) > 0)
			{				
				while ($rlt = mysql_fetch_array($query, MYSQL_ASSOC))
				{
					$result[] = $rlt;
				}
			}		
			
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":-1}',400);
		}		
	}	
	
}

?>

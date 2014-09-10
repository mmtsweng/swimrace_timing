<?php
	require_once("api.interface.php");

//A Racer is a Swimmer that has been assigned to a race
class Racers extends APIInterface
{
	
	//Constructor - make sure db gets connected
	public function __construct()
	{
		parent::__construct();
	}		

	//API Method to GET Swimmers
	public function racers()
	{
		$sql = "SELECT s.FirstName, s.LastName, r.Description, r.Cap ".
			"FROM RaceSwimmers rs, Races r, Swimmers s ".
			"WHERE rs.SwimmerID = s.ID ".
			"AND rs.RaceID = r.ID ".
			"ORDER BY rs.RaceID";
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
	
	//API Method to add a racer
	public function addracer()
	{
		try
		{
			//Expected format: {"SwimmerID":1, "RaceID":1}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$swimmer = (int)$postjson['SwimmerID'];
			$race = (int)$postjson['RaceID'];
			
			$sql = "INSERT into RaceSwimmers (SwimmerID, RaceID) ".
			"VALUES ($swimmer, $race)";
			
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
	
	//API Method to update a swimmer
	public function editracer()
	{
		try
		{
			//Expected format: {"ID":"5","SwimmerID":1, "RaceID":1}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$id = (int)$postjson['ID'];
			$swimmer = (int)$postjson['SwimmerID'];
			$race = (int)$postjson['RaceID'];
			
			$sql = "UPDATE RaceSwimmers ".
			"SET SwimmerID='$swimmer', ".
			"RaceID='$race' ".
			"WHERE ID=$id";
			
			$retval = mysql_query($sql, $this->db);
			$resp = array('ID' => $id);
		
			$this->response(json_encode($resp), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}		
	}
}
?>

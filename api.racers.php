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
		$sql = "SELECT rs.RacerNumber, s.FirstName, s.LastName, r.Description, r.Cap, rs.HasFins ".
			"FROM RaceSwimmers rs, Races r, Swimmers s ".
			"WHERE rs.SwimmerID = s.ID ".
			"AND rs.RaceID = r.ID ".
			"ORDER BY rs.RaceID, rs.RacerNumber";
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
			//Expected format: {"RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$swimmer = (int)$postjson['SwimmerID'];
			$race = (int)$postjson['RaceID'];
			$racernumber = (int)$postjson['RacerNumber'];
			$hasfins = (int)$postjson['HasFins'];
			
			$sql = "INSERT into RaceSwimmers (SwimmerID, RaceID, RacerNumber, HasFins) ".
			"VALUES ($swimmer, $race, $racernumber, $hasfins)";
			
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
			//Expected format: {"ID":"5","RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$id = (int)$postjson['ID'];
			$swimmer = (int)$postjson['SwimmerID'];
			$race = (int)$postjson['RaceID'];
			$racernumber = (int)$postjson['RacerNumber'];
			$hasfins = (int)$postjson['HasFins'];
			
			$sql = "UPDATE RaceSwimmers ".
			"SET SwimmerID='$swimmer', ".
			"RaceID='$race', ".
			"RacerNumber='$racernumber', ".
			"HasFins='$hasfins' ".
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

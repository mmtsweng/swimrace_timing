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
	
	//API Method to GET Swimmers not assigned to a race
	public function nonracers()
	{
		$sql = "SELECT s.ID, s.FirstName, s.LastName \n".
		"FROM Swimmers s \n".
		"WHERE s.ID NOT IN (\n".
		"SELECT SwimmerID FROM RaceSwimmers) LIMIT 0, 30 ";
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

	//API Method to GET Count of Racers by RaceID
	public function racerCount()
	{
		$sql = "SELECT r.ID, r.Description, COUNT(rs.ID) as Swimmers\n"
			. "FROM RaceSwimmers AS rs, Races r\n"
			. "WHERE rs.RaceID = r.ID\n"
			. "GROUP BY r.ID\n";
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


	//API Method to GET Swimmers assigned to a race
	public function racers()
	{
		$sql = "SELECT rs.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, " .
			"s.Gender, s.Birthdate, s.City, s.State, s.Country, ".
			" r.Description, r.Cap, rs.HasFins ".
			"FROM RaceSwimmers rs, Races r, Swimmers s ".
			"WHERE rs.SwimmerID = s.ID ".
			"AND rs.RaceID = r.ID ".
			"ORDER BY s.LastName, s.FirstName";
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
	
	//API Method to GET the list of racers that have finished, in order of finish
	public function finishorder()
	{
		$sql = $sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "r.Description, r.Cap, r.CapHex, rs.HasFins, FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS averageDate, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY averageDate";
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
	
	
	//API Method to GET the list of racers that have finished, in order, by race
	public function racefinishers()
	{
		$sql = $sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName,"
	. "s.City, s.State, s.Country, r.Description, r.Cap, r.CapHex, rs.HasFins, FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS averageDate, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY rs.RaceID, averageDate";
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
	
	public function racefinishercount()
	{		
		$sql = "SELECT COUNT(DISTINCT rs.SwimmerID) as Swimmers,\n"
			. "COUNT(DISTINCT ts.RaceSwimmerID) as Finishers,\n"
			. "r.Description, r.CapHex\n"
			. "FROM RaceSwimmers rs\n"
			. "LEFT JOIN TimeSwimmer ts ON ts.RaceSwimmerID = rs.ID\n"
			. "JOIN Races r on rs.RaceID = r.ID\n"
			. "GROUP BY rs.RaceID";
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
			$gender = $postjson['Gender'];
			$birthdate = $postjson['Birthdate'];
			$city = $postjson['City'];
			$country = $postjson['Country'];
			$hasfins = (int)$postjson['HasFins'];
			
			$sql = "UPDATE RaceSwimmers ".
			"SET SwimmerID='$swimmer', ".
			"RaceID='$race', ".
			"RacerNumber='$racernumber', ".
			"HasFins='$hasfins' ".
			"WHERE ID=$id";
			
			$retval = mysql_query($sql, $this->db);
			$resp = array('ID' => $id);
			
			$sql = "UPDATE Swimmers SET " .
			"Gender='$gender', ".
			"Birthdate='$birthdate', " .
			"City='$city', " .
			"Country='$country' " .
			"WHERE ID=$swimmer";
			$retval = mysql_query($sql, $this->db);
			$resp = array('ID' => $id);
		
			$this->response(json_encode($resp), 200);
			//$this->response($sql, 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}		
	}
}
?>

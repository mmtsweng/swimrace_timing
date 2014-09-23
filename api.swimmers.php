<?php
	require_once("api.interface.php");

class Swimmers extends APIInterface
{
	
	//Constructor - make sure db gets connected
	public function __construct()
	{
		parent::__construct();
	}		

	//API Method to GET Swimmers
	public function swimmers()
	{
		$sql = mysql_query("SELECT ID, FirstName, LastName, Gender, Birthdate FROM Swimmers", $this->db);
		if (mysql_num_rows($sql) > 0)
		{
			$result = array();
			while ($rlt = mysql_fetch_array($sql, MYSQL_ASSOC))
			{
				$result[] = $rlt;
			}
			$this->response($this->json($result), 200);
		}
		$this->response('',204);
	}
	
	//API Method to add a swimmer
	public function addswimmer()
	{
		try
		{
			//Expected format: {"FirstName":"Taylor","LastName":"Brown","Gender":"F","Birthdate":"2005-09-14"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$firstname = $postjson['FirstName'];
			$lastname = $postjson['LastName'];
			$gender = $postjson['Gender'];
			$birthdate = $postjson['Birthdate'];
			
			$sql = "INSERT into Swimmers (FirstName, LastName, Gender, Birthdate) ".
			"VALUES ('$firstname', '$lastname', '$gender', '$birthdate')";
			
			$retval = mysql_query($sql, $this->db);
			$sqlid = mysql_insert_id();	
			$resp = array('ID' => $sqlid);
		
			$this->response(json_encode($resp), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}		
	}
	
	//API Method to update a swimmer
	public function editswimmer()
	{
		try
		{
			//Expected format: {"ID":"5","FirstName":"Taylor","LastName":"Brown","Gender":"F","Birthdate":"2005-09-14"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$id = (int)$postjson['ID'];
			$firstname = $postjson['FirstName'];
			$lastname = $postjson['LastName'];
			$gender = $postjson['Gender'];
			$birthdate = $postjson['Birthdate'];
			
			$sql = "UPDATE Swimmers ".
			"SET FirstName='$firstname', ".
			"LastName='$lastname', ".
			"Gender='$gender', ".
			"Birthdate='$birthdate' ".
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

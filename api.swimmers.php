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
		try
		{
			$result = $this->get_sproc("GET_SWIMMERS");
			$this->response($this->json($result), 200);
		}
		catch (Exception $e)
		{
			error_log($e);
			$this->response('{"ID":"-1"}',400);
		}	
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
			$city = $postjson['City'];
			$country = $postjson['Country'];
			
			$result = $this->call_sproc("INSERT_SWIMMER('$firstname', '$lastname', '$city', '$country', '$birthdate', '$gender')");
			$this->response($this->json($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}		
	}
	
	public function getswimmer()
	{
		//Expected format: {"ID":"5"}
		$postjson = json_decode(file_get_contents("php://input"),true);
		$id = (int)$postjson['ID'];
		$result = $this->get_sproc("GET_SWIMMER($id)");
		$this->response($this->json($result), 200);
		
	}
	
	//API Method to update a swimmer
	public function editswimmer()
	{
		try
		{
			//Expected format: {"FirstName":"Taylor","LastName":"Brown","Gender":"F","Birthdate":"2005-09-14"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$id = $postjson['ID'];
			$firstname = $postjson['FirstName'];
			$lastname = $postjson['LastName'];
			$gender = $postjson['Gender'];
			$birthdate = $postjson['Birthdate'];
			$city = $postjson['City'];
			$country = $postjson['Country'];
			
			$result = $this->call_sproc("UPDATE_SWIMMER($id,'$city', '$country', '$birthdate', '$firstname', '$lastname', '$gender')");
			$this->response($this->json($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}
	}
}
?>

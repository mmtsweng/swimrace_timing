<?php
require_once("api.interface.php");

//A Time is either the starttime of a race, or an endtime of a racer
class Races extends APIInterface
{	
	
	//Constructor - make sure db gets connected
	public function __construct()
	{
		parent::__construct();
	}
	
	public function races()
	{
		try
		{
			$result = $this->get_sproc("GET_RACES");
			$this->response($this->json($result), 200);
		}
		catch (Exception $e)
		{
			error_log($e);
			$this->response('{"ID":"-1"}',400);
		}	
	}		
}

?>

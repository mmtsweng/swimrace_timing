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
	
	//Function to get Overall Order of Finish
	public function finishOrder()
	{
		try
		{
			$result = $this->get_sproc("GET_FINISHORDER");
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
			$starttime = new DateTime($postjson['StartTime']);
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
			//Expected format: {"RaceID":1, "StartTime":"09-12-2014 12:15:20"}
			//Expected format: {"RacerNumber":1, "FinishTime":"09-12-2014 12:15:20"}
			$postjson = json_decode(file_get_contents("php://input"),true);
			$racernum = (int)$postjson['RacerNumber'];
			$status = 1;
			$result = array();
			$finishtime = $postjson['FinishTime'];
			
			$result = $this->call_sproc("SP_FINISHRACER($racernum, '$finishtime')");
			
			//$resp = $this->get_sproc("GET_FINISHORDER");
			
			$this->response(json_encode($resp), 200);
		}
		catch (Exception $e)
		{
			error_log($e);
			$this->response('{"ID":-1}',400);
		}		
	}	
	
	
	public function bulkUpload()
	{
	}
	
	//Overall Finishers
	public function reportOverall()
	{
		try
		{
			$postjson = json_decode(file_get_contents("php://input"),true);
			$raceid = $postjson['raceID'];
			$result = $this->get_sproc("REPORT_OVERALL ($raceid)");
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}
	
	//Overall Finishers
	public function reportOverallU19()
	{
		try
		{
			$postjson = json_decode(file_get_contents("php://input"),true);
			$gender = $postjson['gender'];
			$raceid = $postjson['raceID'];
			$result = $this->get_sproc("REPORT_OVERALL_UNDER19 ($raceid, '$gender')");
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}
	
	//Overall Finishers
	public function reportOverall19OVER()
	{
		try
		{
			$postjson = json_decode(file_get_contents("php://input"),true);
			$raceid = $postjson['raceID'];
			$gender = $postjson['gender'];

			$result = $this->get_sproc("REPORT_OVERALL_19OVER($raceid, '$gender')");
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}

	//FINS
	public function reportOverallFin()
	{
		try
		{
			$postjson = json_decode(file_get_contents("php://input"),true);
			$raceid = $postjson['raceID'];
			$result = $this->get_sproc("REPORT_OVERALL_FIN($raceid)");
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}

	
	//Race Winners by age category
	public function reportRacesByAge()
	{
		try
		{
			$postjson = json_decode(file_get_contents("php://input"),true);
			$raceid = $postjson['raceID'];
			$minAge = $postjson['minAge'];
			$maxAge = $postjson['maxAge'];
			$gender = $postjson['gender'];
			
			$result = $this->get_sproc("REPORT_WINNERS_BY_RACE_AGE($raceid, $minAge, $maxAge, '$gender')");
			$this->response(json_encode($result), 200);
		}
		catch (Exception $e)
		{
			$this->response('{"ID":"-1"}',400);
		}	
	}
	
}

?>

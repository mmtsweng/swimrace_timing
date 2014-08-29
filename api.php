<?php
	require_once("api.swimmers.php");
	
	class API extends APIInterface
	{
			
		//Public method to access the API
		public function processAPI()
		{
			$swimmers = new Swimmers();
			
			$func = strtolower(trim(str_replace("/", "", $_REQUEST['r'])));
			if ((int)method_exists($this, $func) > 0)
			{
				$this->$funct();
			}
			else if ((int)method_exists($swimmers, $func)>0)
			{
				$swimmers->$func();
			}
			else
			{
				$this->response('', 404);
			}
		}
			
	}
	
	//Initiate Library
	$api = new API;
	$api->processAPI();
	
?>

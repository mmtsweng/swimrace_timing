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
				"LEFT JOIN TimeRace t ON r.ID = t.RaceID";
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
}

?>

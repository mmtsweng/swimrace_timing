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
		$sql = mysql_query("SELECT ID, FirstName, LastName, Gender FROM Swimmers", $this->db);
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
}
?>

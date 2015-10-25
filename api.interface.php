<?php
	require_once("rest.inc.php");
	
class APIInterface extends REST
{
	public $data = "";
	const DB_SERVER="localhost";
	const DB_USER = "root";
	const DB_PASSWORD = "swimvast";
	const DB = "Swimrace";
	
	public $db = NULL;
	
	
	//Constructor
	public function __construct()
	{
		parent::__construct();
		$this->dbConnect();
	}
	
	//Connect to Database
	private function dbConnect()
	{
		$this->db = mysql_connect(self::DB_SERVER, self::DB_USER, self::DB_PASSWORD);
		if ($this->db)
		{
			mysql_select_db(self::DB, $this->db);
		}
	}
	
	//Encode an Array into JSON
	public function json($data)
	{
		if (is_array($data))
		{
			return json_encode($data);
		}
	}			
}
?>

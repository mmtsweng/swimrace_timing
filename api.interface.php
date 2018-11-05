<?php
    require_once("rest.inc.php");

class APIInterface extends REST
{
    public $data = "";

    //Constructor
    public function __construct()
    {
        parent::__construct();
    }

    //Connect to Database
    private function dbConnect()
    {
        $mysqli  = mysqli_connect("localhost", "swimrace", "swimvast", "Swimrace");
        if ($mysqli->connect_errno){
            error_log($mysqli->connect_error);
        }
        return $mysqli;
    }

    private function dbDisconnect($mysqli)
    {
        mysqli_close($mysqli);
    }


    // Method to get a JSON response to a stored procedure
    public function get_sproc($sprocname)
    {
        error_log("Calling :" . $sprocname);
        $mysqli = $this->dbConnect();
        $result = mysqli_query($mysqli,"CALL " . $sprocname)
            or die("Query Fail: " . mysqli_error($mysqli));

        $data = array();
        while ($row = mysqli_fetch_assoc($result))
        {
            $data[] = $row;
        }

        $this->dbDisconnect($mysqli);

        return $data;
    }

    public function call_sproc($sprocname)
    {
        error_log("Calling :" . $sprocname);
        $mysqli = $this->dbConnect();
        $result = mysqli_query($mysqli,"CALL " . $sprocname)
            or die("Query Fail: " . mysqli_error($mysqli));

        $this->dbDisconnect($mysqli);
        return $result;
    }
}
?>

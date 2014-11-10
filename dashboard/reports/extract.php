
<?php
	const DB_SERVER="localhost";
	const DB_USER = "root";
	const DB_PASSWORD = "asdfasdf";
	const DB = "Swimrace";
	


	//require_once("/apiurl.php");	
	$param = $_GET["type"];
	$byRace = false;
	$filename = "registration_alphabetical_" . date('Ymd') . ".csv";
	if ($param == "race")
	{
		$filename = "registration_race_" . date('Ymd') . ".csv";
		$byRace = true;
	}

	// Create connection
	$conn = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB);
	if ($conn->connect_error) {
		print "Database Connection Error: " . $conn->connect_error;
		die("Connection failed: " . $conn->connect_error);
	} 

	//Query Database
	$sql = "SELECT rc.Description as Race,\n"
		. "s.LastName, s.FirstName, s.Gender, s.Birthdate, s.City, s.Country,\n"
		. "r.RacerNumber, \n"
		. "IF(r.HasFins=1, \"true\", \"\") as HasFins\n"
		. "FROM Swimmers s, RaceSwimmers r, Races rc\n"
		. "WHERE s.ID = r.SwimmerID\n"
		. "AND r.RaceID = rc.ID\n";
	if ($byRace)
	{
		$sql = $sql . "ORDER BY rc.Description, s.LastName, s.FirstName";
	}
	else
	{
		$sql =  $sql . "ORDER BY s.LastName, s.FirstName";
	}
	$result = $conn->query($sql);
		
	//Create CSV File
	header("Content-Disposition: attachment; filename=\"$filename\"");
	header("Content-Type: application/vnd.ms-excel");

	$firstRow = true;
    while($row = $result->fetch_assoc()) 
	{
		if ($firstRow)
		{
			//display column names
			echo implode(",", array_keys($row)) . "\r\n";
			$firstRow = false;
		}
		array_walk($row, 'cleanData');
		echo implode(",", array_values($row)) . "\r\n";
	}	
	exit;
?>

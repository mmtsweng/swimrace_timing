<?php
include_once("dbConnections.php");
include_once("printResults.php");



/* Base SQL

SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,
s.City, s.State, s.Country,
FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID 
AND rs.RaceID = r.ID
AND tr.RaceID = r.ID
AND ts.RaceSwimmerID = rs.ID
AND r.ID = 3
GROUP BY ts.RaceSwimmerID
ORDER BY EndTime
Limit 

*/

// Create connection
$conn = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB);
if ($conn->connect_error) {
	print "Database Connection Error: " . $conn->connect_error;
    die("Connection failed: " . $conn->connect_error);
} 
$race = "Overall";

//Overall
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
//printResultTables($result, $race);

//5 mile
$race = '5 Mile';
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race);


//2 mile
$race = '2 Mile';
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race);


//1 mile
$race = '1 Mile';
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race);


$conn->close();
?>

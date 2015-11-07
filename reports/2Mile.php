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
AND r.ID = 1
GROUP BY ts.RaceSwimmerID
ORDER BY EndTime
Limit 5

*/

// Create connection
$conn = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB);
if ($conn->connect_error) {
	print "Database Connection Error: " . $conn->connect_error;
    die("Connection failed: " . $conn->connect_error);
} 
$race = "2 Mile";

//Overall
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - Overall");
 

//18 and under
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 0 AND 18 \n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 18 and Under Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 0 AND 18 \n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 18 and Under Female");
 

//19 and over
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 19 and Over Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 19 and Over Female");
 

//19-29
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 29 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 19 to 29 Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 29 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 19 to 29 Female");
 
//30-39
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 30 AND 39 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 30 to 39 Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 30 AND 39 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 30 to 39 Female");
 
//40-49
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 40 AND 49 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 40 to 49 Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 40 AND 49 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 40 to 49 Female");
 
//50-59
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 50 AND 59 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 50 to 59 Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 50 AND 59 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 50 to 59 Female");
 

//60-69
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"    
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 60 AND 69 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 60 to 69 Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"    
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 60 AND 69 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 60 to 69 Female");
 

//70 and over
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"   
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 70 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 70 and Over Male");
 
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 0\n"   
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 70 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";
$result = $conn->query($sql);
printResultTables($result, $race . " - 70 and Over Female");
 


//Top Fin
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 2\n"
    . "AND rs.HasFins = 1\n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 100";
$result = $conn->query($sql);
printResultTables($result, $race . " - Fin");
 

$conn->close();
?>

<?php
const DB_SERVER="localhost";
const DB_USER = "root";
const DB_PASSWORD = "asdfasdf";
const DB = "Swimrace";

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

//Overall
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 5";
$result = $conn->query($sql);
print "<div><h2>1 Mile - Overall</h2>";
include "printResults.php";
print "</div>";

//18 and under
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 18 YEAR) \n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 18 and Under</h2>";
include "printResults.php";
print "</div>";

//19 and over
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 18 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 19 and Over</h2>";
include "printResults.php";
print "</div>";


//19-29
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 29 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 18 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 19 to 29</h2>";
include "printResults.php";
print "</div>";

//30-39
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 39 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 30 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 30 to 39</h2>";
include "printResults.php";
print "</div>";

//40-49
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 49 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 40 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 40 to 49</h2>";
include "printResults.php";
print "</div>";

//50-59
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 59 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 50 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 50 to 59</h2>";
include "printResults.php";
print "</div>";

//60-69
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 69 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 60 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 60 to 69</h2>";
include "printResults.php";
print "</div>";

//70 and over
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Birthdate > DATE_SUB(CURDATE(), INTERVAL 100 YEAR) \n"
	. "AND s.Birthdate < DATE_SUB(CURDATE(), INTERVAL 70 YEAR) \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>1 Mile - 70 and Over</h2>";
include "printResults.php";
print "</div>";


//Top Fin
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 3\n"
    . "AND rs.HasFins = 1\n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 1";
$result = $conn->query($sql);
print "<div><h2>1 Mile - Top Fin</h2>";
include "printResults.php";
print "</div>";

$conn->close();
?>

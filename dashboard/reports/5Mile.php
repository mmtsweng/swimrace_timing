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
$race = "5 Mile";

//Overall
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 5";
$result = $conn->query($sql);
print "<div><h2>". $race . " - Overall</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 0 AND 18 \n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 18 and Under Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 0 AND 18 \n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 18 and Under Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 19 and Over Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 19 and Over Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 29 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 19 to 29 Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 19 AND 29 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . "- 19 to 29 Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 30 AND 39 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 30 to 39 Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 30 AND 39 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 30 to 39 Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 40 AND 49 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 40 to 49 Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 40 AND 49 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 40 to 49 Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 50 AND 59 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 50 to 59 Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 50 AND 59 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 50 to 59 Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"    
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 60 AND 69 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 60 to 69 Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"    
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 60 AND 69 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 60 to 69 Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"   
    . "AND s.Gender = 'M'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 70 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 70 and Over Male</h2>";
include "printResults.php";
print "</div>";
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country," 
	. "FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 0\n"   
    . "AND s.Gender = 'F'\n"
    . "AND TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) BETWEEN 70 AND 199 \n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 3";
$result = $conn->query($sql);
print "<div><h2>". $race . " - 70 and Over Female</h2>";
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
    . "AND r.ID = 1\n"
    . "AND rs.HasFins = 1\n"
	. "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 1";
$result = $conn->query($sql);
print "<div><h2>". $race . " - Top Fin</h2>";
include "printResults.php";
print "</div>";

$conn->close();
?>

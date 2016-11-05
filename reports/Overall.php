<?php
include_once("dbConnections.php");

function printSwimmers($result, $heading)
{
	if(!isset($showPagination))
	{
		$showPagination = true;
	}
	
	if ($result && $result->num_rows > 0) {
		printTableHead($heading, false);
		
		// output data of each row
		$position = 1;
		while($row = $result->fetch_assoc()) {
		if ($showPagination && ($position % 10 == 0))
			{
				printTableHead($heading, true);
			}
			print "<tr><td>".$position."</td>";
			print  "<td class='cap ".$row["cap"]."'></td><td>"
				.timerFormat($row["StartTime"],$row["EndTime"])."</td><td>"
				.$row["LastName"].", ".$row["FirstName"]."</td><td>"
				.$row["Age"]."</td><td>"
				.$row["City"]. ",".$row["State"]." ".$row["Country"]
				."</td>";
			if ($row["HasFins"] == 1)
			{
				print "<td class='hasfins'>&nbsp;</td>";
			}
			else
			{
				print "<td>&nbsp;</td>";
			}
			print "</tr>";
			$position++;
		}
		print "</table></tbody></div>";
	}
	else
	{
		print "<div><h2>" . $heading . "</h2>";
		print "<p>No Results</p>";
		print "</div>";
	}
}

function printTableHead($heading, $closeTable=false)
{
	if ($closeTable)
	{
		print "</table></tbody></div>";
	}
	print "<div><h2>" . $heading . "</h2>";
	print "<table  class='finisherTable'><thead>"
		. "<tr><td>Position</td>"
		. "<td>Race</td>"
		. "<td>Time</td>"
		. "<td>Name</td>"
		. "<td>Age</td>"
		. "<td>Location</td>"
		. "<td>Fins</td>"
		. "</tr></thead><tbody>";
}


function timerFormat($start_time, $end_time, $hms = true)
{       
	$total_time = strtotime($end_time) - strtotime($start_time);
	$hours      = floor($total_time /3600);     
	$minutes    = intval(($total_time/60) % 60);        
	$seconds    = intval($total_time % 60);     
	if ($hms)
	{
		return sprintf("%01d:%02d:%02d",$hours,$minutes,$seconds);
	}
	else
	{
		return sprintf("%01d:%02d",$hours,$minutes);
	}
}

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
$sql = "SELECT r.ID, r.cap, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age, rs.HasFins, " 
	. "FROM_UNIXTIME(MAX(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
    . "FROM Races r, RaceSwimmers rs, Swimmers s, TimeSwimmer ts, TimeRace tr\n"
    . "WHERE rs.SwimmerID = s.ID \n"
    . "AND rs.RaceID = r.ID \n"
    . "AND tr.RaceID = r.ID\n"
    . "AND ts.RaceSwimmerID = rs.ID\n"
    . "GROUP BY ts.RaceSwimmerID\n"
    . "ORDER BY EndTime\n"
    . "Limit 500";    
$result = $conn->query($sql);
printSwimmers($result, $race);


/*
//5 mile
$race = '5 Mile';
$sql = "SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName, s.Gender, s.Birthdate,"
	. "s.City, s.State, s.Country, TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age," 
	. "FROM_UNIXTIME(MAX(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
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
	. "FROM_UNIXTIME(MAX(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
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
	. "FROM_UNIXTIME(MAX(UNIX_TIMESTAMP(ts.FinishTime))) AS EndTime, tr.StartTime\n"
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

*/
$conn->close();
?>

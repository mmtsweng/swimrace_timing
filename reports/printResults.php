<?php

function printResultTables($result, $heading)
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
			print "<tr><td>".$position."</td><td>"
				.timerFormat($row["StartTime"],$row["EndTime"])."</td><td>"
				.$row["LastName"].", ".$row["FirstName"]."</td><td>"
				.$row["Age"]."</td><td>"
				.$row["City"]. ",".$row["State"]." ".$row["Country"]
				."</td></tr>";
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
		. "<td>Time</td>"
		. "<td>Name</td>"
		. "<td>Age</td>"
		. "<td>Location</td>"
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
?>

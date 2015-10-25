<?php

if ($result->num_rows > 0) {
    print "<table  class='finisherTable'><thead>"
		. "<tr><td>Position</td>"
		. "<td>Time</td>"
		. "<td>Name</td>"
		. "<td>Age</td>"
		. "<td>Location</td>"
		. "</tr></thead><tbody>";
    // output data of each row
    $position = 1;
    while($row = $result->fetch_assoc()) {
        print "<tr><td>".$position."</td><td>"
			.timerFormat($row["StartTime"],$row["EndTime"])."</td><td>"
			.$row["LastName"].", ".$row["FirstName"]."</td><td>"
			.$row["Age"]."</td><td>"
			.$row["City"]. ",".$row["State"]." ".$row["Country"]
			."</td></tr>";
        $position++;
    }
    print "</table></tbody>";
}
else
{
    print "<p>No Results</p>";
}

/*
function timerFormat($start_time, $end_time)
{       
	$interval = date_diff(new DateTime($start_time), new DateTime($end_time));
	return $interval->format('%h:%I:%S');
	/*
	
	$total_time = $end_time - $start_time;
	$hours      = floor($total_time /3600);     
	$minutes    = intval(($total_time/60) % 60);        
	$seconds    = intval($total_time % 60);     
	return sprintf("%01d:%02d:%02d",$hours,$minutes,$seconds);  
}*/
?>

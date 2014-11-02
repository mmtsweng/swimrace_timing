<?php

if ($result->num_rows > 0) {
    print "<table  class='finisherTable'><thead>"
		. "<tr><td>Position</td>"
		. "<td>Time</td>"
		. "<td>Name</td>"
		. "<td>Location</td>"
		. "</tr></thead><tbody>";
    // output data of each row
    $position = 1;
    while($row = $result->fetch_assoc()) {
        print "<tr><td>".$position."</td><td>"
			.timerFormat($row["StartTime"],$row["EndTime"])."</td><td>"
			.$row["LastName"].", ".$row["FirstName"]."</td><td>"
			.$row["City"]. ",".$row["State"]." ".$row["Country"]
			."</td></tr>";
        $position++;
    }
    print "</table></tbody>";
}
else
{
    print "&nbsp;";
}
?>

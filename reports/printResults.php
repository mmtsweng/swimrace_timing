<?php


function printResultTables($result, $heading)
{
    if ($result && count($result) > 0) {
        $position = 1;
        printTableHead($heading, false);

        foreach($result as $row)
        {
            print "<tr><td style='width:30px'>".$position."</td><td>"
                .timerFormat($row["StartTime"], $row["EndTime"], true)."</td><td>"
                .$row["LastName"].", ".$row["FirstName"]."</td><td>"
                .$row["City"]. "," .$row["Country"]
                ."</td></tr>";
            $position++;
        }
        print "</table></tbody></div>";

    }else{
        print "<div><h2>" . $heading . "</h2>";
        print "<p>No Results</p>";
        print "</div>";
    }

}


function printResultTablesPaged($result, $heading)
{
    if ($result && count($result) > 0) {
        $position = 1;
        $pagePosition = 1;
        printTableHead("", false);


        foreach($result as $row)
        {
            print "<tr><td>".$position."</td><td>"
                .timerFormat($row["StartTime"], $row["averageDate"], true)."</td><td>"
                .$row["LastName"].", ".$row["FirstName"]."</td><td>"
                .$row["City"]. "," .$row["Country"]
                ."</td></tr>";
            $position++;
            $pagePosition++;

            if ($pagePosition > 15)
            {
                printTableHead('', true);
                $pagePosition = 1;
            }

        }
        print "</table></tbody></div>";

    }else{
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
    print "<div class='finisherTableSpace'><h2>" . $heading . "</h2>";
    print "<table class='finisherTableSpace'><thead>"
        . "<tr><td>Pos</td>"
        . "<td>Time</td>"
        . "<td>Name</td>"
        . "<td>Location</td>"
        . "</tr></thead><tbody>";
}

function timerFormat($start_time, $end_time, $hms = true)
{
    $dateStart = new DateTime($start_time);
    $dateEnd = new DateTime($end_time);
    //$dateDiff = date_diff($end_time, $start_time);
    $dateDiff = $dateEnd->diff($dateStart);
    return sprintf('%02d:%02d:%02d', $dateDiff->h, $dateDiff->m, $dateDiff->s);
}

function callAPI($api, $data){
    $json = json_encode($data);

    //Post Changes
    $ch = curl_init($api);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Content-Length: ' . strlen($json))
    );
    return json_decode(curl_exec($ch), true);;
}

?>

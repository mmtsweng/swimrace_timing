<?php

 function RestartRaces($raceid, $startTime)
    {
        //{"RaceID":1, "StartTime":"09-12-2014 12:15:20"}

        $data = array(
            'RaceID'        => $raceid,
            'StartTime'     => $startTime
        );
        $json = json_encode($data);

        print($json);

        //Post Changes
        $ch = curl_init('http://localhost/api.php?r=startrace');
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($json))
        );
        $result = curl_exec($ch);
        print ($ch);
        print ("<br>");
        //header("Location:" . $_SERVER["PHP_SELF"]);

    }

    $date = new DateTime(); // current time
    RestartRaces(1, $date->format('Y-m-d') . " 07:01:10");
    RestartRaces(2, $date->format('Y-m-d') . " 08:55:15");
    RestartRaces(3, $date->format('Y-m-d') . " 09:03:25");

?>

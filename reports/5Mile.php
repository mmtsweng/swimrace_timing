<?php
include_once("printResults.php");

/* CHANGE LIMITS */
if ($limits) {
    $limitValue = 5;
}else{
    $limitValue = 99;
}

// Overall
$data = array('raceID'  => 1, 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverall', $data);
printResultTables($result, '5 Mile Overall');

// 18 and Under
$data = array('raceID'  => 1, 'gender'  => 'M', 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverallU19', $data);
printResultTables($result, '5 Mile 18 & Under Male');
$data = array('raceID'  => 1, 'gender'  => 'F', 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverallU19', $data);
printResultTables($result, '5 Mile 18 & Under Female');

//19 and Over
$data = array('raceID'  => 1, 'gender'  => 'M', 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverall19Over', $data);
printResultTables($result, '5 Mile 19 & Over Male');
$data = array('raceID'  => 1, 'gender'  => 'F', 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverall19Over', $data);
printResultTables($result, '5 Mile 19 & Over Female');

/* CHANGE LIMITS */
if ($limits) {
    $limitValue = 3;
}else{
    $limitValue = 99;
}

//Fins
$data = array('raceID'  => 1, 'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportOverallFin', $data);
printResultTables($result, '5 Mile Fins');


//AGE CATEGORIES
print "<div class='pagebreak'></div>";

// Under 18
$data = array(
        'raceID'    => 1,
        'minAge'    => 0,
        'maxAge'    => 18,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 18 & Under Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 0,
        'maxAge'    => 18,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 18 & Under Female');


// 19-29
$data = array(
        'raceID'    => 1,
        'minAge'    => 19,
        'maxAge'    => 29,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 19 to 29 Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 19,
        'maxAge'    => 29,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 19 to 29 Female');

// 30-39
$data = array(
        'raceID'    => 1,
        'minAge'    => 30,
        'maxAge'    => 39,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 30 to 39 Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 30,
        'maxAge'    => 39,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 30 to 39 Female');

// 40-49
$data = array(
        'raceID'    => 1,
        'minAge'    => 40,
        'maxAge'    => 49,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 40 to 49 Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 40,
        'maxAge'    => 49,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 40 to 49 Female');

// 50-59
$data = array(
        'raceID'    => 1,
        'minAge'    => 50,
        'maxAge'    => 59,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 50 to 59 Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 50,
        'maxAge'    => 59,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 50 to 59 Female');

// 60-69
$data = array(
        'raceID'    => 1,
        'minAge'    => 60,
        'maxAge'    => 69,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 60 to 69 Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 60,
        'maxAge'    => 69,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 60 to 69 Female');

// 70+
$data = array(
        'raceID'    => 1,
        'minAge'    => 70,
        'maxAge'    => 999,
        'gender'    => 'M'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 70 and Over Male');
$data = array(
        'raceID'    => 1,
        'minAge'    => 70,
        'maxAge'    => 999,
        'gender'    => 'F'
        ,'limit' => $limitValue);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '5 Mile 70 and Over Female');

?>

<?php
include_once("printResults.php");

print "<h1>5 Mile Awards</h1>";


//Overall


// Under 18
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 0,
		'maxAge'	=> 18);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '18 & Under');


// 19-29
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 19,
		'maxAge'	=> 29);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '19 to 29');

// 30-39
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 30,
		'maxAge'	=> 39);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '30 to 39');

// 40-49
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 40,
		'maxAge'	=> 49);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '40 to 49');

// 50-59
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 50,
		'maxAge'	=> 59);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '50 to 59');

// 60-69
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 60,
		'maxAge'	=> 69);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '60 to 69');

// 70+
$data = array(
		'raceID'	=> 1,
		'minAge'	=> 70,
		'maxAge'	=> 999);
$result = callAPI('http://localhost/api.php?r=reportRacesByAge', $data);
printResultTables($result, '70 and Over');

?>

<?php
include_once("printResults.php");


$api = '';
$race = "MAJOR AWARDS";

// Overall
$data = array('raceID'	=> 1);
$result = callAPI('http://localhost/api.php?r=reportOverall', $data);
printResultTables($result, 'Overall');

// 18 and Under
$result = callAPI('http://localhost/api.php?r=reportOverallU19', $data);
printResultTables($result, '18 & Under');

//19 and Over
$result = callAPI('http://localhost/api.php?r=reportOverall19Over', $data);
printResultTables($result, '19 & Over');

//Fins
$result = callAPI('http://localhost/api.php?r=reportOverallFin', $data);
printResultTables($result, 'Fins');

?>


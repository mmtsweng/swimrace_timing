<?php
include_once("printResults.php");


$api = '';
$race = "MAJOR AWARDS";

// Overall
$data = array('raceID'	=> 1);
$result = callAPI('http://localhost/api.php?r=finishOrder', $data);
printResultTablesPaged($result, 'Unofficial Results');

?>


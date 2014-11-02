<?php
function timerFormat($start_time, $end_time)
{       
	$interval = date_diff(new DateTime($start_time), new DateTime($end_time));
	return $interval->format('%h:%I:%S');
	/*
	
	$total_time = $end_time - $start_time;
	$hours      = floor($total_time /3600);     
	$minutes    = intval(($total_time/60) % 60);        
	$seconds    = intval($total_time % 60);     
	return sprintf("%01d:%02d:%02d",$hours,$minutes,$seconds);*/
}
?>

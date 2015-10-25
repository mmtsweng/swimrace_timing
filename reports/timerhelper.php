<?php
function timerFormat($start_time, $end_time, $hms = false)
{       
	$total_time = $end_time - $start_time;
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

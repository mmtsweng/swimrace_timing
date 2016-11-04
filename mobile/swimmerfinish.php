<?php 
	require_once("apiurl.php");	
	
	$response = file_get_contents($api . 'racetimes');
	
	try
	{		
		$races = json_decode($response, true);
	}
	catch (Exception $e)
	{
		
	}
?>

<html>
<head>
	<title>Swimmers Finishing</title>
	<?php include 'layouthead.php' ?>
	<script type="text/javascript" src="assets/swimmer_async.js"></script>	
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Swimmer Finish</H1>
	
	<table><tr>
	<td><ul id='SwimmerList' class='SwimmerFinish'></ul></td>
	<td><ul style='margin-left: 30px' id='SwimmerLocal'></ul></td>
	</tr></table>
	
	<table>
	<tr>
		<td>Racer Number</td>
		<td><input type='number' name='RacerText' id='RacerText' value='' /></td>
		<td><input type='button' id='RacerGo' value='Save' /></td>
	</tr>	
	<tr>
		<td colspan='2'  style="height:50px; vertical-align:bottom; text-align:right">Complete Upload</td>
		<td style="vertical-align: bottom"><input type='button' id='LocalRefresh' value='Refresh' /></td>
	</tr>
	</table>

</body>
</html>
	




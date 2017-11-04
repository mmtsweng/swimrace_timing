<?php 
	require_once("apiurl.php");	
	
	$response = file_get_contents($api . 'racetimes');
	
	try
	{		
		$races = json_decode($response, true);
	}
	catch (Exception $e)
	{
		error_log($e);
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
	
	<ul id='SwimmerList' class='SwimmerFinish'>
	</ul>
	
	<table>
	<tr>
		<td>Racer Number</td>
		<td><input type='number' name='RacerText' id='RacerText' value='' /></td>
		<td><input type='button' id='RacerGo' value='Save' /?</td>
	</tr>	
	</table>

</body>
</html>
	




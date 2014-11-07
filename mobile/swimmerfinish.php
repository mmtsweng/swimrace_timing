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
	<script type="text/javascript" src="assets/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="assets/swimmer_async.js"></script>	
	<?php include 'layouthead.php' ?>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Swimmer Finish</H1>
	
	<ul id='SwimmerList' class='SwimmerFinish'>
	</ul>
	
	<table>
	<tr>
		<td>Racer Number</td>
		<td><input type='text' name='RacerText' id='RacerText' value='' /></td>
	</tr>	
	</table>

</body>
</html>
	




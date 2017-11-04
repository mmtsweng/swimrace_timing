<?php
	require_once("apiurl.php");	
	
	$response = file_get_contents($api . 'racefinishercount');
	
	try
	{		
		$swimmers = json_decode($response, true);
	}
	catch (Exception $e)
	{
		
	}
	
?>

<html>
<head>
	<title>Dashboard</title>
	<?php include 'layouthead.php' ?>
	<link href="assets/jquery.circliful.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="assets/jquery.circliful.min.js"></script>
	<script type="text/javascript">
		<?php
			print "var times = jQuery.parseJSON('" . $response . "');";
		?>
		
		//OnReady, initiate the gauges
		$(function()
		{
			$('#gauge3').circliful();		
			$('#gauge0').circliful();		
			$('#gauge1').circliful();		
			$('#gauge2').circliful();		
		});
	</script>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Swimmer / Finisher counts</H1>
	<table>
	<?php
	$idx = 0;
	foreach($swimmers as $item)
	{	
		$pct = sprintf("%.2f", ($item['Finishers'] / $item['Swimmers']) * 100);
		print "<div id='gauge" . $idx . "' " 
			. "data-info='" . $item['Description'] . "' " 
			. "data-percent= '" . $pct .  "' "
			. "data-fgcolor='" . $item['CapHex'] . "' " 
			. "data-text='" . $item['Finishers'] . " of " . $item['Swimmers'] . "' " 
			. "data-startdegree='100' data-type='half'></div>\n";
		$idx++;
	}
	?>
	</table>
	
</body>
</html>



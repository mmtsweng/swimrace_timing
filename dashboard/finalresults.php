<?php
	require_once("apiurl.php");	
	require_once("timerhelper.php");
	
	$response = file_get_contents($api . 'racefinishers');
	$raceresponse = file_get_contents($api . 'races');
	
	try
	{		
		$finishers = json_decode($response, true);
		$races = json_decode($raceresponse, true);
	}
	catch (Exception $e)
	{
		
	}
?>

<html>
<head>
	<title>Dashboard</title>
	<script type="text/javascript" src="assets/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="assets/results_async.js"></script>
	<script type="text/javascript">
		<?php
			print "var finishers = jQuery.parseJSON('" . $response . "');";
			print "var races = jQuery.parseJSON('" . $raceresponse . "');";
		?>	
	</script>
</head>
<body>
	<H1>Results</H1>	
	<?php
	foreach($races as $race)
	{
		print "<table id='resultTable" . $race['ID'] . "' >";
		print "<thead><tr><td colspan='4'><H2>" . $race['Description'] ."</H2></td></tr></thead>";
		foreach($finishers as $item)
		{
			if ($item['ID'] == $race['ID'])
			{
				if ($item['HasFins'] == '1')
				{
					print "<tr class='fins'>";
				}
				else
				{
					print "<tr>";
				}
				print "<tr>";
				print "<td style='background-color:" . $item['CapHex'] . "'>";
				print $item['RacerNumber'];
				print "</td>";
				print "<td>";
				print timerFormat(strtotime($item['StartTime']), strtotime($item['averageDate']), true);
				print "</td>";
				print "<td>";
				print $item['LastName'] . ", " . $item['FirstName'];
				print "</td>";
				if ($item['HasFins'] == '1')
				{
					print "<td>FINS</td>";
				}
				else
				{
					print "<td>&nbsp;</td>";
				}
				
				print "</tr>\n";
			}
		}	
		print "</table>\n";
	}
	?>
	
</body>
</html>
	



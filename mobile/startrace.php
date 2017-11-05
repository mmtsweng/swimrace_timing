<?php 
	require_once("apiurl.php");	


if (!empty($_POST)):
    
    //{"RaceID":1, "StartTime":"09-12-2014 12:15:20"}
    
    $data = array(
		'RaceID'		=> $_POST['ID'],
		'StartTime'		=> $_POST['StartTime']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init($api . 'startrace');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = curl_exec($ch);
    print ($ch);
    header("Location:" . $_SERVER["PHP_SELF"]);
    
	?>

<?php else: ?>

<?php
	
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
	<title>Start Races</title>
	<?php include 'layouthead.php' ?>
	<script type="text/javascript">
		
		//OnReady, start the timer
		function startRace(raceid)
		{
			$('#StartTime' + raceid).val(JSONLocalTime());
			$('#frm' + raceid).submit();
		}

		//OnReady, start the timer
		function startManualRace()
		{
			var raceid = $('#ManualRaceID').val(); 
			$('ID').val(raceid);
			$('#StartTime' + raceid).val($('#ManualStartTime').val());
			$('#frm' + raceid).submit();
		}

	</script>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Start Races</H1>
	<table>
	<?php
	foreach($races as $item)
	{
		print "<tr  style='background-color:" . $item['CapHex'] . "'>";
		print "<form id='frm" . $item['ID'] . "' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
		print "<input type='hidden' name='ID' id='ID' value='". $item['ID'] ."' />";
		print "<input type='hidden' name='StartTime' id='StartTime". $item['ID'] ."' value='0' />";
		print "</form>";
		print "<td>";
		print $item['Description'];
		print "</td>";
		if ($item['StartTime'] == null)
		{
			print "<td>";
			print "<b>PENDING";
			print "</td>";
			print "<td>";
			print "<input type='button' onclick='startRace(". $item['ID'] . ");' name='button' value='Start' id='submit' />";
		
		
			print "</td>";
		}
		else
		{
			print "<td>";
			print "<b>STARTED @ " . $item['StartTime'] . "</b>";
			print "</td>";
			print "<td>";
			print "<input type='button' onclick='startRace(". $item['ID'] . ");' name='button' value='Restart' id='submit' />";
			print "</td>";
		}
		print "</tr>\r\n";
	}
	?>
	</table>
	
	<hr style="margin-top: 30px; margin-bottom: 30px"/>
	
	<?php 
	print "<form id='frm4' action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";

	?>
	<h3>Manual Start</h3>
	<table>
		<tr>
			<td><input type='text' id='ManualRaceID' size='4' value='id'></td>
			<td><input type='text' id='ManualStartTime'size='20' value='2017-11-04 07:00:00'></td>
			<td><input type='button' value='Set Time' id='manualsubmit' onclick='startManualRace();' ></td>
		</tr>
	</table>
	</form>
</body>
</html>
	
<?php endif; ?>



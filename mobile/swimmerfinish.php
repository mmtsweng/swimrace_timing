<?php 
	require_once("apiurl.php");	


if (!empty($_POST)):
    
    //{"RacerNumber":1, "FinishTime":"09-12-2014 12:15:20"}
    
    $data = array(
		'RacerNumber'	=> $_POST['RacerNumber'],
		'FinishTime'	=> $_POST['FinishTime']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init('http://localhost:8080/swimrace_timing/api.php?r=swimmerfinish');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = curl_exec($ch);
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
		
	}
?>

<html>
<head>
	<title>Start Races</title>
	<script type="text/javascript" src="assets/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		
		//Submit the swimmer
		function finishSwimmer()
		{
			$('#FinishTime').val(new Date());
			$('#RacerNumber').val($('#RacerText').val());
			$('#frm').submit();
		}
	</script>
</head>
<body>
	<H1>Swimmer Finish</H1>
	<table>
	<tr>
		<td>Racer Number</td>
		<td><input type='text' name='RacerText' id='RacerText' value='' /></td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type='button' onclick='finishSwimmer();' name='button' value='Finished' id='submit' />
		</td>
	</tr>		
	</table>
	<form id='frm' action='<?php print htmlspecialchars($_SERVER["PHP_SELF"]) ?>' method='post'>
			<input type='hidden' name='FinishTime' id='FinishTime' value='0'>
			<input type='hidden' name='RacerNumber' id='RacerNumber' value='0'>
	</form>
</body>
</html>
	
<?php endif; ?>



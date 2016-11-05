<?php
	require_once("apiurl.php");	
	
	$response = file_get_contents($api . 'racers');
	$raceresponse = file_get_contents($api . 'races');
	
	try
	{		
		$swimmers = json_decode($response, true);
		$races = json_decode($raceresponse, true);
	}
	catch (Exception $e)
	{
		
	}
	
?>

<?php if (!empty($_POST)):
    
    //{"ID":"5","RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
    
    $data = array(
		'ID'			=> $_POST['ID'],
		'RacerNumber'	=> $_POST['Number'],
		'SwimmerID'		=> $_POST['SwimmerID'],
		'RaceID'		=> $_POST['races'],
		'Gender'		=> $_POST['Gender'],
		'Birthdate'		=> $_POST['Birthdate'],
		'City'			=> $_POST['City'],
		'State'		=> $_POST['State'],
		'HasFins'		=> $_POST['HasFins'],
	);
	$json = json_encode($data);
	
    //Post Changes
    $ch = curl_init('http://localhost/api.php?r=editracer');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = curl_exec($ch);
 	print $result;
    header("Location:" . $_SERVER["PHP_SELF"]);
    
	?>

<?php else: ?>

<html>
<head>
	<title>Dashboard</title>
	<?php include 'layouthead.php' ?>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Scheduled Swimmers</H1>
	<table>
	<?php
	foreach($swimmers as $item)
	{
		print "<form action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
		print "<tr>";
		print "<td>";
		print "#:<input type='text' size=4 name='Number' id='racenumber' value='" . $item['RacerNumber'] . "' />";
		print "<input type='hidden' name='ID' id='ID' value='". $item['ID'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='hidden' name='SwimmerID' id='swimmerID' value='". $item['SwimmerID'] ."' />";
		print $item['LastName'] . ", " . $item['FirstName'];
		print "</td>";
		print "<td><select name='races'><option value='-1'>&nbsp;</option>";
		foreach($races as $race)
		{
			print "<option value='".$race['ID']."' ";
			if($item['Description']==$race['Description']) {print "selected ";}
			print ">".$race['Description']."</option>";
		}
		print $item['Description'];
		print "</select></td>";
		print "<td><input type='text' name='Gender' id='Gender' value='" . $item['Gender'] . "' /></td>";
		print "<td><input size='11' type='text' name='Birthdate' id='birthdate' value='" . $item['Birthdate'] . "' /></td>";
		print "<td><input type='text' name='City' id='racenumber' value='" . $item['City'] . "' /></td>";
		print "<td><input size='3' type='text' name='State' id='racenumber' value='" . $item['State'] . "' /></td>";
		print "<td>";

		print "<input type='hidden' name='HasFins' value='0'>Fins:<input type='checkbox' name='HasFins' value='1' id='checkbox' ";
			if($item['HasFins']=='1') {print " checked ";}
		print "/>";
		print "</td>";
		print "<td>";
		print "<input type='submit' name='button' value='Update' id='submit' />";
		print "</td>";
		print "</tr>\r\n";
		print "</form>";
	}
	?>
	</table>
	
</body>
</html>
<?php endif; ?>




<?php if (!empty($_POST)): ?>
    <?php
    
    //{"RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
    
    $data = array(
		'ID'		=> $_POST['ID'],
		'FirstName'	=> $_POST['FirstName'],
		'LastName'	=> $_POST['LastName'],
		'Birthdate'	=> $_POST['Birthdate'],
		'City'		=> $_POST['City'],
		'Country'	=> $_POST['Country'],
		'Gender'	=> $_POST['Gender']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init('http://localhost/api.php?r=editswimmer');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = curl_exec($ch);
    header("Location: ./racers.php");
    
	?>

<?php else: ?>

<html>
<head>
	<title>Dashboard</title>
	<?php include 'layouthead.php' ?>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Edit Swimmer</H1>
	<table>
	<?php
	require_once("apiurl.php");	
	
	//{"ID":"5"}
    
    $data = array(
		'ID'		=> $_GET['id']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init($api . 'getswimmer');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = json_decode(curl_exec($ch), true);
 	//print ($result);
	foreach($result as $item)
	{
		
		print "<form action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
		print "<tr>";
		print "<td>";
		print $item['ID'] . "<input type='hidden' name='ID' id='swimmerID' value='". $item['ID'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='10' name='FirstName' id='FirstName' value='". $item['FirstName'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='10' name='LastName' id='LastName' value='". $item['LastName'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='10' name='Birthdate' id='Birthdate' value='". $item['Birthdate'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='3' name='Gender' id='Gender' value='". $item['Gender'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='10' name='City' id='City' value='". $item['City'] ."' />";
		print "</td>";
		print "<td>";
		print "<input type='text' size='10' name='Country' id='Country' value='". $item['Country'] ."' />";
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

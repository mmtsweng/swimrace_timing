<?php
	require_once("apiurl.php");	
	

   if (!empty($_POST)):
        
    $data = array(
		'FirstName'		=> $_POST['FirstName'],
		'LastName'		=> $_POST['LastName'],
		'Gender'		=> $_POST['Gender'],
		'Birthdate'		=> $_POST['Birthdate'],
		'City'			=> $_POST['City'],
		'Country'		=> $_POST['Country']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init($api . 'addswimmer');                                                                      
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

<html>
<head>
	<title>Dashboard</title>
	<?php include 'layouthead.php' ?>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Add a Swimmer</H1>
	<table>
	<?php
		print "<form action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
		print "<tr>";
		print "<td><input type='text' name='FirstName' id='FirstName' value='FirstName' /></td>";
		print "<td><input type='text' name='LastName' id='LastName' value='LastName' /></td>";
		print "<td><input type='text' size='4' name='Gender' id='Gender' value='MF' /></td>";
		print "<td><input size='10' type='text' name='Birthdate' id='birthdate' value='DOB' /></td>";
		print "<td><input size='10'type='text' name='City' id='racenumber' value='City' /></td>";
		print "<td><input size='10' type='text' name='Country' id='racenumber' value='Country/State' /></td>";
		print "<td>";
		print "<input type='submit' name='button' value='Add' id='submit' />";
		print "</td>";
		print "</tr>\r\n";
		print "</form>";
	?>
	</table>
	
</body>
</html>
<?php endif; ?>



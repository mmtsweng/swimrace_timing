<?php 
	require_once("apiurl.php");	

    //{"RacerNumber":1, "FinishTime":"09-12-2014 12:15:20"}
    
    try
    {
    
    $data = array(
		'RacerNumber'	=> $_POST['RacerNumber'],
		'FinishTime'	=> $_POST['FinishTime']
	);
	$json = json_encode($data);
	
    //print($json);
    
    //Post Changes
    $ch = curl_init('http://localhost/api.php?r=swimmerfinish');                                                                      
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);                                                                  
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
		'Content-Type: application/json',                                                                                
		'Content-Length: ' . strlen($json))                                                                       
	);                                                                                                                   
 	$result = curl_exec($ch);
    header("Location:" . $_SERVER["PHP_SELF"]);
}
catch (Exception $e)
{
	$this->response('{"ID":"-1"}',400);
}	
    
?>




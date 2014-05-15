
<?php
	//require_once("/apiurl.php");	

	$filename = "website_data_" . date('Ymd') . ".rtf";
	
	//$response = file_get_contents($api . 'finishorder');
	//$finishers = json_decode($response, true);
		
	$firstRow = true;
	$resultGrid = "Test";
	
	/*foreach ($finishers as $row)
	{
		if ($firstRow)
		{
			//display column names
			$result .= implode("\t", array_keys($row)) . "\r\n";
			$firstRow = false;
		}
		array_walk($row, 'cleanData');
		echo implode("\t", array_values($row)) . "\r\n";
	}*/
	
	$rtf = file_get_contents("report.rtf");
	$rtf = str_replace('__RESULTSHEADING__', 'RACE 1', $rtf);
	$rtf = str_replace('__RESULTSGRID__', $resultGrid, $rtf);

	header("Content-Disposition: attachment; filename=\"$filename\"");
	header("Content-Type: application/msword");
	echo $rtf;
	die();
	
	
?>

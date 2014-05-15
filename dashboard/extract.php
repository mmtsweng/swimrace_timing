
<?php
	require_once("apiurl.php");	

	$filename = "website_data_" . date('Ymd') . ".xls";
	header("Content-Disposition: attachment; filename=\"$filename\"");
	header("Content-Type: application/vnd.ms-excel");
	//header("Content-Type: text/plain");
	
	$response = file_get_contents($api . 'finishorder');
	$finishers = json_decode($response, true);
	
	
	$firstRow = true;
	foreach ($finishers as $row)
	{
		if ($firstRow)
		{
			//display column names
			echo implode("\t", array_keys($row)) . "\r\n";
			$firstRow = false;
		}
		array_walk($row, 'cleanData');
		echo implode("\t", array_values($row)) . "\r\n";
	}
	
	
	//Function to remove problematic data from the download
	function cleanData(&$str)
	{
		// escape tab characters
		$str = preg_replace("/\t/", "\\t", $str);

		// escape new lines
		$str = preg_replace("/\r?\n/", "\\n", $str);

		// escape fields that include double quotes
		if(strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
	}
?>

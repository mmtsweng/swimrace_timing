<?php
	require_once("apiurl.php");	
	
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
	<title>Dashboard</title>
	<script type="text/javascript" src="assets/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">

		<?php
			print "var times = jQuery.parseJSON('" . $response . "');";
		?>
		
		//OnReady, start the timer
		$(function()
		{
			showTimes();
			setInterval(showTimes, 1000);
		});
		
		
		//Display Elapsed Times for races
		function showTimes()
		{
			$.each(times, function(idx, obj)
			{
				if (obj.StartTime != null)
				{
					displayElapsed(new Date(Date.parse(obj.StartTime)), $("#timer" + obj.ID));
				}
			});	
		}
		
		//Display the elapsed time in the element
		function displayElapsed(starttime, el) 
		{
			
			var endTime = new Date();
			var timeDiff = endTime - starttime;
			console.log(starttime + "vs" + endTime);

			// Calculate H:MM:SS
			var timeDiff = timeDiff / 1000;
			var seconds = Math.round(timeDiff % 60);
			timeDiff = Math.floor(timeDiff / 60);
			var minutes = Math.round(timeDiff % 60);
			timeDiff = Math.floor(timeDiff / 60);
			var hours = Math.round(timeDiff % 24);
			timeDiff = Math.floor(timeDiff / 24);
			var days = timeDiff ;
			
			$(el).text(hours + " : " + padLeft(minutes) + " : " + padLeft(seconds));
		}
		
		//Function to add a leading zero to single diget time frames
		function padLeft(time)
		{
			var pad = "00";
			var str = "" + time;
			return pad.substring(0, pad.length - str.length) + str;
		}

	</script>
</head>
<body>
	<H1>Races</H1>
	<table>
	<?php
	foreach($races as $item)
	{
		print "<tr>";
		print "<td style='background-color:" . $item['CapHex'] . "'>";
		print "CAP";
		print "</td>";
		print "<td>";
		print $item['Description'];
		print "</td>";
		
		if ($item['StartTime'] != null)
		{
			print "<td>";
			print "<span id='timer" . $item['ID'] . "'><span>";
			//print $item['StartTime'];
			print "</td>";
		}
		else
		{
			print "<td>";
			print "PENDING";
			print "</td>";
		}
				
		print "</tr>";
	}
	?>
	</table>
</body>
</html>
	



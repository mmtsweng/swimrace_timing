<html>
<head>
	<?php 
	include 'layouthead.php'; 
	$showRaceTimes = false;
	?>
	<script>
		showTruncated = false;
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<H1>Order of Finish</H1>
	<H2 id="RaceDesc">Overall</H2>
	<div id="scrollableTable">		
		<div id='startScrolling'/>
		<table id="finisherTable1" class='finisherTable'>
			<thead>
				<tr>
				<td colspan="2">Position</td>
				<td>Number</td>
				<td colspan="2">Name</td>
				<td>Race Time</td>
				<td>Location</td>
				<td>Fins</td>		
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<table id="finisherTable2" class='finisherTable'>
			<thead>
				<tr>
				<td colspan="2">Position</td>
				<td>Number</td>
				<td>Name</td>
				<td>Race Time</td>
				<td>Location</td>
				<td>Fins</td>		
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<table id="finisherTable3" class='finisherTable'>
			<thead>
				<tr>
				<td colspan="2">Position</td>
				<td>Number</td>
				<td>Name</td>
				<td>Race Time</td>
				<td>Location</td>
				<td>Fins</td>		
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div id='finishedScrolling'/>
	</div>
	<?php include 'layoutpostcontent.php' ?>
</body>
</html>
	



<html>
<head>
	<?php include '../layouthead.php';
	$raceID = $_GET['raceID'];
	 ?>
	<script>
		showTruncated = true;
		showOverall = true;
	</script>
</head>
<body>
	<?php include '../layoutprecontent.php' ?>
	<H1>2014 Results</H1>
	<H2><?php $raceID ?></H2>
	<table id="finisherTable" class='finisherTable'>
		<thead>
			<tr>
			<td colspan="2">Position</td>
			<td>Number</td>
			<td>Name</td>
			<td>Race Time</td>
			<td>Fins</td>		
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<?php include '../layoutpostcontent.php' ?>
</body>
</html>
	



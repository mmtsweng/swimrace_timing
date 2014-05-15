<html>
<head>
	<?php include 'layouthead.php' ?>
	<script>
		showSeconds = true;
		showFinals = true;
		showTruncated = false;
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<a href='extract.php'>Download</a>
	<H1>Final Results</H1>
	<H2>5 mile</H2>
	<table id="finisherTable1" class='finisherTable'>
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
	
	<H2>2 mile</H2>
	<table id="finisherTable2" class='finisherTable'>
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
	
	<H2>1 mile</H2>
	<table id="finisherTable3" class='finisherTable'>
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
	<?php include 'layoutpostcontent.php' ?>
</body>
</html>
	



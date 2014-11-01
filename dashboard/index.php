<html>
<head>
	<?php include 'layouthead.php' ?>
	<script>
		showTruncated = true;
		showOverall = true;
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<H1>Order of Finish</H1>
	<H2>Overall</H2>
	<div id="scrollableTable">
		<div id='startScrolling'/>
		<table id="finisherTable" class='finisherTable'>
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
	



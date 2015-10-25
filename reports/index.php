<html>
<head>
	<?php include '../dashboard/layouthead.php';
	$raceID = $_GET['raceID'];
	 ?>
	<script>
		showTruncated = true;
		showOverall = true;
	</script>
</head>
<body>
	<?php include '../dashboard/layoutprecontent.php' ?>
	<H1>2015 Results</H1>
	<H2><?php $raceID ?></H2>
	<?php include '../dashboard/layoutpostcontent.php' ?>
</body>
</html>
	



<html>
<head>
	<?php include 'layouthead_simple.php'; ?>
	<script>
		showSeconds = true;
		showFinals = true;
		showTruncated = false;
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<H1>2015 Final Results</H1>
		<div id="slideshowprint">
			<?php include '../reports/5Mile.php' ?>		
			<?php include '../reports/2Mile.php' ?>			
			<?php include '../reports/1Mile.php' ?>			
		</div>

	<?php include 'layoutpostcontent.php' ?>
</body>
</html>
	



<html>
<head>
	<?php include 'layouthead_simple.php'; 
	$showRaceTimes = false; ?>
	<script>
		showSeconds = true;
		showFinals = true;
		showTruncated = false;
		
		$(function()
		{
			//Hide all divs
			$("#slideshow > div:gt(0)").hide();
			
			setInterval(function() {
				$('#slideshow > div:first')
					.fadeOut(2000)
					.next()
					.fadeIn(2000)
					.end()
					.appendTo('#slideshow');
				}, 5000);
		});
		
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<H1>2015 Final Results</H1>
		<div id="slideshow">
			<?php include '/reports/5Mile.php' ?>			
			<?php include '/reports/2Mile.php' ?>			
			<?php include '/reports/1Mile.php' ?>			
		</div>

	<?php include 'layoutpostcontent.php' ?>
</body>
</html>
	



<html>
<head>
	<?php include 'layouthead.php'; 
	$showRaceTimes = false; 
	$showPagination = true; ?>
	<script>
		showTimes = false;
		
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
				}, 10000);
				
			 setInterval(function() {
                  window.location.reload();
                }, 250000); 
		});
		
	</script>
</head>
<body>
	<?php include 'layoutprecontent.php' ?>
	<H1>2015 Unofficial Results</H1>
		<div id="slideshow">
			<?php include '../reports/Overall.php' ?>		
		</div>

	<?php include 'layoutpostcontent.php' ?>
</body>
</html>
	





<html>
<head>
	<title>Swimmers Finishing</title>
	<?php include 'layouthead.php' ?>
	<script type="text/javascript" src="assets/swimmer_async.js"></script>	
	<script type="text/javascript">
		$(function()
		{	
			PrintLocal();	
		});
	</script>
</head>
<body>
	<?php include 'layoutnav.php' ?>
	<H1>Swimmer Finish, Local Storage</H1>
	<div id='SwimmerLocalStorage'></div>
		
	<hr style="margin-top: 30px; margin-bottom: 30px"/>
	

	<div><input type="button" onclick='BulkUpload();'value="Bulk Upload" /></div>
</body>
</html>
	

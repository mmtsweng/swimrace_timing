<html>
<head>
    <?php include 'layouthead_simple.php';
    $showRaceTimes = true; ?>
    <script lang="JavaScript">
    $(function()
    {
        UpdateRacers();
    });
</script>
</head>


<body>
    <H1 class='heading'>Unofficial Order of Finish</H1>
    <?php include 'layoutprecontent.php' ?>
    <div id="scrollableTable">
        <div id='startScrolling'/>
        <table id="finisherTable" class='finisherTable'>
            <thead>
                <tr>
                <td>Pos</td>
                <td colspan=3>Number</td>
                <td>Name</td>
                <td>Location</td>
                <td>Time</td>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div id='spacer'>&nbsp;</div>
        <div id='finishedScrolling'/>
    </div>
    <?php include 'layoutpostcontent.php' ?>
    <div id='logo'><img src='/dashboard/assets/STX2018.jpg'></div>
</body>
</html>

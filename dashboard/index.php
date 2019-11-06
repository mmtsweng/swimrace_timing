<html>
<head>
    <?php include 'layouthead.php';?>
    <script lang="JavaScript">
    $(function()
    {
        UpdateDashboard();
    });
    </script>
</head>


<body>
    <div id='CoralReef'></div>
    <?php include 'layoutprecontent.php' ?>
    <H1 class='heading'>Unofficial Order of Finish</H1>
    <div id="scrollableTable">
        <div id='startScrolling'></div>
        <table id="finisherTable" class='finisherTable'>
            <thead>
                <tr>
                <td>Overall</td>
                <td colspan=3>Number</td>
                <td>Name</td>
                <td>Location</td>
                <td>Age</td>
                <td>Time</td>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div id='spacer'>&nbsp;</div>
        <div id='finishedScrolling'></div>
    </div>
    <?php include 'layoutpostcontent.php' ?>
    <div id='logo'></div>
</body>
</html>

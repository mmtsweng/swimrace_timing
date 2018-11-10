<html>
<head>
    <?php include 'layouthead_simple.php';
    $showRaceTimes = true; ?>
</head>


<body>
    <H1 class='heading'>Unofficial Results</H1>
    <?php include 'layoutprecontent.php' ?>
    <div id="scrollableTable">
        <div id='startScrolling'/>
        <table id="finisherTable" class='finisherTable'>
            <thead>
                <tr>
                <td>Position</td>
                <td>Number</td>
                <td>Race</td>
                <td>Name</td>
                <td>Location</td>
                <td>Race Time</td>
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

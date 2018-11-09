<html>
<head>
    <?php include 'layouthead_simple.php' ?>
</head>


<body>
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
</body>
</html>

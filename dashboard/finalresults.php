<html>
<head>
    <?php include 'layouthead_simple.php';
    $showRaceTimes = false;
    $showPagination = false; ?>
    <script lang="JavaScript">

    $(function()
    {
        $('#finishedScrolling').ScrollTo({
            duration: 100000,
            easing: 'linear',
            callback: function(){location.reload();}
        });
    });

    </script>
</head>

<body>
    <H1 class='heading'>2018 Results</H1>
    <?php include 'layoutprecontent.php' ?>
    <div id='scrollableTable'>
        <div id='startScrolling'/>
            <?php include '../reports/5Mile.php' ?>
            <?php include '../reports/2Mile.php' ?>
            <?php include '../reports/1Mile.php' ?>
        <div id='spacer'>&nbsp;</div>
        <div id='finishedScrolling'/>
    </div>
    <?php include 'layoutpostcontent.php' ?>
    <div id='logo'><img src='/dashboard/assets/STX2018.jpg'></div>
</body>
</html>



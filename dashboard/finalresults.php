<html>
<head>
    <?php include 'layouthead.php';
    $showRaceTimes = false;
    $showPagination = false; ?>
    <script lang="JavaScript">
    $(function()
    {
        ScrollResults();
    });
    </script>
</head>

<body>
    <div id='CoralReef'></div>
    <?php include 'layoutprecontent.php' ?>
    <H1 class='heading'>2019 Coral Reef Swim<br> Results</H1>
    <div id='scrollableTable'>
        <div id='startScrolling'/>
            <?php include '../reports/5Mile.php' ?>
            <?php include '../reports/2Mile.php' ?>
            <?php include '../reports/1Mile.php' ?>
        <div id='spacer'>&nbsp;</div>
        <div id='finishedScrolling'/>
    </div>
    <?php include 'layoutpostcontent.php' ?>
    <div id='logo'></div>
</body>
</html>



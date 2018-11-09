<html>
<head>
    <?php include 'layouthead.php';
    $showRaceTimes = false;
    $showPagination = true; ?>
    <script>
        showSeconds = true;
        showFinals = true;
        showTruncated = false;
        showTimes = false;

        $(function()
        {
            //Hide all divs
            $("#slideshow > div:gt(0)").hide();


            setInterval(function() {
                $('#slideshow > div:first')
                    .fadeOut(500)
                    .next()
                    .fadeIn(500)
                    .end()
                    .appendTo('#slideshow');
                }, 3500);

            /*
             setInterval(function() {
                  window.location.reload();
                }, 300000); )*/
        });

    </script>
</head>
<body>
    <?php include 'layoutprecontent.php' ?>
    <H1>2018 Final Results</H1>
        <div id="slideshow">
            <?php include '../reports/5Mile.php' ?>
            <?php include '../reports/2Mile.php' ?>
            <?php include '../reports/1Mile.php' ?>
        </div>

    <?php include 'layoutpostcontent.php' ?>
</body>
</html>




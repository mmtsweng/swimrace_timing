<?php
    require_once("apiurl.php");

    $response = file_get_contents($api . 'racefinishercount');

    try
    {
        $swimmers = json_decode($response, true);
    }
    catch (Exception $e)
    {

    }

?>

<html>
<head>
    <title>Dashboard</title>
    <?php include 'layouthead.php' ?>
    <link href="assets/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <link href="assets/jquery.jqplot.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="assets/race_dashboard_async.js"></script>
    <script type="text/javascript" src="assets/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="/shared/raceTimes_async.js"></script>
    <script type="text/javascript" src="assets/jquery.circliful.min.js"></script>
</head>
<body>
    <?php include 'layoutnav.php' ?>
    <div id='dashboard'>
        <H1>Race Times</H1>
        <div style='display:table; width:100%; padding-bottom:30px'>
            <div><strong>5 Mile Race:</strong><span id='racetime1'></span></div>
            <div><strong>2 Mile Race:</strong><span id='racetime2'></span></div>
            <div><strong>1 Mile Race:</strong><span id='racetime3'></span></div>
        </div>


        <H1>Swimmer / Finisher counts - <img src='assets/reset.png' class='reset' onclick='ResetSwimmerCounts()'/> </H1>
        <div id='gauges'>
        <?php
        $idx = 0;
        foreach($swimmers as $item)
        {
            $pct = sprintf("%.2f", ($item['Finishers'] / $item['Swimmers']) * 100);
            print "<div id='gauge" . $idx . "' "
                . "class='dashboard' "
                . "data-info='" . $item['Description'] . "' "
                . "data-percent= '" . $pct .  "' "
                . "data-fgcolor='" . $item['CapHex'] . "' "
                . "data-text='" . $item['Finishers'] . " of " . $item['Swimmers'] . "' "
                . "data-startdegree='100' data-type='half'></div>\n";
            $idx++;
        }
        ?>
        <div id='chartremaining'></div>
        </div>
    </div>


    <H1>Swimmers in the Water</H1>
    <table id="swimmersIn1" class="swimmersIn">
        <thead><th class="swimmersInHead" colspan=2>5 mile</th></thead>
        <tbody></tbody>
    </table>
    <table id="swimmersIn2" class="swimmersIn">
        <thead><th class="swimmersInHead" colspan=2>2 mile</th></thead>
        <tbody></tbody>
    </table>
        <table id="swimmersIn3" class="swimmersIn">
        <thead><th class="swimmersInHead" colspan=2>1 mile</th></thead>
        <tbody></tbody>
    </table>

    <H1 style="padding-top: 50px">Swimmers Finished</H1>
    <table id="swimmersOut1" class="swimmersOut">
        <thead><th class="swimmersOutHead" colspan=2>5 mile</th></thead>
        <tbody></tbody>
    </table>
    <table id="swimmersOut2" class="swimmersOut">
        <thead><th class="swimmersOutHead" colspan=2>2 mile</th></thead>
        <tbody></tbody>
    </table>
        <table id="swimmersOut3" class="swimmersOut">
        <thead><th class="swimmersOutHead" colspan=2>1 mile</th></thead>
        <tbody></tbody>
    </table>
</body>
</html>




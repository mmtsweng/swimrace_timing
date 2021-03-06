<?php
    require_once("apiurl.php");

    $response = file_get_contents($api . 'nonracers');
    $raceresponse = file_get_contents($api . 'races');

    try
    {
        $swimmers = json_decode($response, true);
        $races = json_decode($raceresponse, true);
    }
    catch (Exception $e)
    {

    }

?>

<?php if (!empty($_POST)): ?>
    <?php

    //{"RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}

    $data = array(
        'RacerNumber'   => $_POST['Number'],
        'SwimmerID' => $_POST['ID'],
        'RaceID'    => $_POST['races'],
        'HasFins'   => $_POST['HasFins'],
    );
    $json = json_encode($data);

    //print($json);

    //Post Changes
    $ch = curl_init('http://localhost/api.php?r=addracer');
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Content-Length: ' . strlen($json))
    );
    $result = curl_exec($ch);
    header("Location:" . $_SERVER["PHP_SELF"]);

    ?>

<?php else: ?>

<html>
<head>
    <title>Dashboard</title>
    <?php include 'layouthead.php' ?>
</head>
<body>
    <?php include 'layoutnav.php' ?>
    <H1>Unassigned Swimmers</H1>
    <table>
    <thead>
    <tr><td>ID</td><td>Name</td><td>Race</td><td>Number</td><td>Fins</td></tr>
    </thead>
    <?php
    foreach($swimmers as $item)
    {
        print "<form action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
        print "<tr>";
        print "<td>";
        print $item['ID'] . "<input type='hidden' name='ID' id='swimmerID' value='". $item['ID'] ."' />";
        print "</td>";
        print "<td>";
        print $item['LastName'] . ", " . $item['FirstName'];
        print "</td>";
        print "<td><select name='races'><option value='-1'>&nbsp;</option>";
        foreach($races as $race)
        {
            print "<option value='".$race['ID']."'>".$race['Description']."</option>";
        }
        print "</select></td>";
        print "<td>";
        print "#:<input type='text' name='Number' id='racenumber' />";
        print "</td>";
        print "<td>";
        print "<input type='hidden' name='HasFins' value='0'><input type='checkbox' name='HasFins' value='1' id='checkbox' />";
        print "</td>";
        print "<td>";
        print "<input type='submit' name='button' value='Update' id='submit' />";
        print "</td>";
        print "</tr>\r\n";
        print "</form>";
    }
    ?>
    </table>

</body>
</html>
<?php endif; ?>



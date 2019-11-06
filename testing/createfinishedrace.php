

<?php
    require_once("apiurl.php");

    $response = file_get_contents($api . 'racers');

    try
    {
        $swimmers = json_decode($response, true);
    }
    catch (Exception $e)
    {

    }
?>

<?php



    function CreateFinisher($racerNumber)
    {
        //{"RacerNumber":1, "FinishTime":"09-12-2014 12:15:20"}

        try
        {
            $dtString = date('Y').'-'.date('m').'-'.date('d').' 09:10:00';
            $date = DateTime::createFromFormat('Y-m-d H:i:s', $dtString);
            $hours = rand(1, 3);
            $minutes = rand(0, 59);
            $seconds = rand(0, 59);
            $timeDiff = 'PT'.$hours.'H'.$minutes.'M'.$seconds.'S';
            $date->add(new DateInterval($timeDiff));

            $data = array(
                'RacerNumber'   => $racerNumber,
                'FinishTime'    => $date->format('Y-m-d H:i:s')
            );
            $json = json_encode($data);

            //return $json;

            //Post Changes
            $ch = curl_init('http://localhost/api.php?r=swimmerfinish');
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($json))
            );
            $result = curl_exec($ch);
            return $result;
        }
        catch (Exception $e)
        {
            return $e;
        }
    }
?>

<html>
<head>
    <title>Tests</title>
    <?php include 'layouthead.php' ?>
</head>
<body>
    <H1>Generated Swimmer Times</H1>
    <table>
    <?php
    foreach($swimmers as $item)
    {
        $times=CreateFinisher($item['RacerNumber']);

        $tz  = new DateTimeZone('AST');
        $age = DateTime::createFromFormat('Y-m-d', $item['Birthdate'], $tz)
            ->diff(new DateTime('now', $tz))
            ->y;

        print "<tr><td>" . $item['ID'] . "</td>";
        print "<td>" . $item['RacerNumber'] . "</td>";
        print "<td>" . $item['LastName'] . ", " . $item['FirstName'] . "</td>";
        print "<td>" . $item['Birthdate'] . "</td>";
        print "<td>" . $age . "</td>";
        print "<td>" . $item['City'] . "</td>";
        print "<td>" . $item['Country'] . "</td>";
        print "<td>" . $times . "</td>";
        print "<td>" . $timeDiff . "</td>";
        print "</tr>";

        /*
        print "<form action='" . htmlspecialchars($_SERVER["PHP_SELF"]) . "' method='post'>";
        print "<tr>";
        print "<td>";
        print "#:<input type='text' size=4 name='Number' id='racenumber' value='" . $item['RacerNumber'] . "' />";
        print "<input type='hidden' name='ID' id='ID' value='". $item['ID'] ."' />";
        print "</td>";
        print "<td><input type='hidden' name='SwimmerID' value='".$item['SwimmerID'] ."'>";
        print "<a href='editswimmer.php?id=".$item['SwimmerID'] ."'>" . $item['LastName'] . ", " . $item['FirstName'] . "</a>";
        print "</td>";
        print "<td><select name='races'><option value='-1'>&nbsp;</option>";
        foreach($races as $race)
        {
            print "<option value='".$race['ID']."' ";
            if($item['Description']==$race['Description']) {print "selected ";}
            print ">".$race['Description']."</option>";
        }
        print $item['Description'];
        print "</select></td>";
        print "<td>" . $item['Gender'] . "</td>";
        print "<td style='width: 90px'>" . $item['Birthdate'] . "</td>";
        print "<td>" . $item['City'] . "</td>";
        print "<td>" . $item['Country'] . "</td>";
        print "<td>";

        print "<input type='hidden' name='HasFins' value='0'>Fins:<input type='checkbox' name='HasFins' value='1' id='checkbox' ";
            if($item['HasFins']=='1') {print " checked ";}
        print "/>";
        print "</td>";
        print "<td>";
        print "<input type='submit' name='button' value='Update' id='submit' />";
        print "</td>";
        print "</tr>\r\n";
        print "</form>"; */
    }
    ?>
    </table>

</body>
</html>

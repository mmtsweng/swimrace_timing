
//OnReady, initiate the gauges
$(function()
{
    RefreshGauges();
});

//User requeste a reset of swimmer counts
function ResetSwimmerCounts()
{
    GetRaceFinisherCounts();
    UpdateRacersSwimming();
    UpdateRacersFinished();
}

//Refresh Gauge Rendering
function RefreshGauges()
{
    $('#gauge0').circliful();
    $('#gauge1').circliful();
    $('#gauge2').circliful();
    $('#gauge3').circliful();

}

//Update Gauges with new data
function UpdateFinisherCounts(el, pct, fin, swm )
{
    var inf = el.attr('data-info');
    var col = el.attr('data-fgcolor');

    el.empty();
    el.removeData();
    el.attr('data-info', inf);
    el.attr('data-fgcolor', col);
    el.attr('data-startdegree', 100);
    el.attr('data-type', 'half');
    el.attr('data-percent', pct);
    el.attr('data-text', fin + " of " + swm);
    el.circliful();
}

//function to call Racer Counts
function GetRaceFinisherCounts()
{
    $.ajax(
    {
        url: '/api.php?r=racefinishercount',
        type: 'get',
        contentType: 'application/json',
        dataType: 'json'
    })
    .done (function(data)
    {
        //alert (JSON.stringify(data));
        /*
            [{"Swimmers":"70","Finishers":"1","Description":"5 Mile","CapHex":"#FFFF00"},
            * {"Swimmers":"47","Finishers":"0","Description":"2 Mile","CapHex":"#33CC33"},
            * {"Swimmers":"30","Finishers":"1","Description":"1 Mile","CapHex":"#FF66CC"},
            * {"Swimmers":"147","Finishers":"2","Description":"Overall","CapHex":"#008080"}]
         */
        if (data != null && data != undefined)
        {
            $.each(data, function(i, item) {
                if (item != null)
                {
                    var pct=0;
                    if (item.Finishers != "0")
                    {
                        pct = Math.ceil(Number(item.Finishers) / Number(item.Swimmers))
                    }
                    UpdateFinisherCounts($('#gauge' + i), pct, item.Finishers, item.Swimmers);
                }
            });
        }
        else
        {
            console.log("No Data");
        }
    })
    .fail(function(xhr, desc, err)
    {
        console.log(desc);
    });
}

function UpdateRacersSwimming()
{
    $.ajax(
    {
        url: '/api.php?r=racersswimming',
        type: 'get',
        contentType: 'application/json',
        dataType: 'json'
    })
    .done (function(data)
    {
        //console.log(JSON.stringify(data));
        /*
         * [{"ID":"1","Description":"5 Mile","RacerNumber":"23","SwimmerID":"110","FirstName":"Misty","LastName":"Hyman"},
         * {"ID":"1","Description":"5 Mile","RacerNumber":"26","SwimmerID":"82","FirstName":"Seth","LastName":"Andrews"},
         * {"ID":"1","Description":"5 Mile","RacerNumber":"27","SwimmerID":"83","FirstName":"Jennifer","LastName":"Andrews"}
         */
        if (data != null && data != undefined)
        {
            $('.swimmersIn > tbody').empty();
            $.each(data, function(i, item) {
                if (item.Age != null && Number(item.Age) < 19)
                {
                    $('#swimmersIn' + item.ID + ' > tbody').append("<tr class='U19'><td>" + item.RacerNumber + "</td><td>" + item.LastName + ", " + item.FirstName + "</td></tr>");
                }
                else
                {
                    $('#swimmersIn' + item.ID + ' > tbody').append("<tr><td>" + item.RacerNumber + "</td><td>" + item.LastName + ", " + item.FirstName + "</td></tr>");
                }
            });
        }
        else
        {
            console.log("No Data");
        }
    })
    .fail(function(xhr, desc, err)
    {
        console.log(desc);
    });
}

function UpdateRacersFinished()
{
    $.ajax(
    {
        url: '/api.php?r=racefinishers',
        type: 'get',
        contentType: 'application/json',
        dataType: 'json'
    })
    .done (function(data)
    {
        //console.log(JSON.stringify(data));
        /*
         * [{"ID":"1","RacerNumber":"25","SwimmerID":"81","FirstName":"Maxwell","LastName":"Adams","City":"Lancaster","Country":"PA","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-04 14:38:12.0000","Age":"49","StartTime":"2018-11-08 14:30:08"},
         * {"ID":"1","RacerNumber":"28","SwimmerID":"84","FirstName":"Nicole","LastName":"Angeli","City":"Cabo Rojo","Country":"PR","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-08 13:55:07.0000","Age":"31","StartTime":"2018-11-08 14:30:08"},
         * {"ID":"1","RacerNumber":"59","SwimmerID":"115","FirstName":"Alex ","LastName":"Kostich","City":"Los Angeles","Country":"CA","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-08 13:56:38.0000","Age":null,"StartTime":"2018-11-08 14:30:08"}
         */
        if (data != null && data != undefined)
        {
            $('.swimmersOut > tbody').empty();
            $.each(data, function(i, item) {
                if (item.Age != null && Number(item.Age) < 19)
                {
                    $('#swimmersOut' + item.ID + ' > tbody').append("<tr class='U19'><td>" + item.RacerNumber + "</td><td>" + item.LastName + ", " + item.FirstName + "</td></tr>");
                }
                else
                {
                    $('#swimmersOut' + item.ID + ' > tbody').append("<tr><td>" + item.RacerNumber + "</td><td>" + item.LastName + ", " + item.FirstName + "</td></tr>");
                }
            });
        }
        else
        {
            console.log("No Data");
        }
    })
    .fail(function(xhr, desc, err)
    {
        console.log(desc);
    });
}

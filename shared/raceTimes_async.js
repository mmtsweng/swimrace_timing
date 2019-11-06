
var raceTimes;
var secondTimer;

//Function to AJAX the race times from the API
function callRaceTimesAPI()
{
    clearInterval(secondTimer);
    $.ajax(
    {
        url: '/api.php?r=racetimes',
        type: 'get',
        contentType: 'application/json',
        dataType: 'json'
    })
    .done (function(data)
    {
        console.log (data);
        //{"ID":"1","Description":"5 Mile","CapHex":"#FFFF00","StartTime":"2014-05-15 03:09:14"}
        raceTimes =  data;
        if (data != null && data != undefined)
        {
            showTimes();
        }
    })
    .fail(function(xhr, desc, err)
    {
        console.log(desc);
    })
    ;
}

function showTimes()
{
    currentTime = $.now();

    $.each(raceTimes, function(idx, obj)
    {
        if (obj != null && obj.StartTime != null)
        {
            $("#racetime" + obj.ID).countdown({since: parseDT(obj.StartTime), layout: '{hn} : {mnn} : {snn} '});
        }
        else
        {
            $("#racetime" + obj.ID).html('PENDING');
        }
    });
}


/* Delete



//Display Elapsed Times for races
function showTimes()
{
    $.each(raceTimes, function(idx, obj)
    {
        if (obj != null && obj.StartTime != null)
        {
            displayElapsed(parseDT(obj.StartTime), $("#racetime" + obj.ID));
        }
        else
        {
            $("#racetime" + obj.ID).html('PENDING');
        }
    });
}

//Display the elapsed time in the element
function displayElapsed(starttime, el)
{
    var endTime = new Date();
    var diff = starttime - endTime;
    var seconds = Math.abs(Math.floor((diff % 6e4)/1000));
    var minutes = Math.abs(Math.floor((diff % 3.6e6) / 6e4));
    var hours = Math.abs(Math.floor(diff / 3.6e6));

    var time= hours + ":" + padLeft(minutes) + ":" + padLeft(seconds);
    $(el).text(time);
}
*/

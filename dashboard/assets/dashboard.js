var pos;

function UpdateDashboard()
{
    console.log('update dashboard');
    callRaceTimesAPI();
    ScrollRacers();
}

function GetAge(dateString)
{
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate()))
    {
        age--;
    }
    return age;
}

function ScrollResults()
{
    $('#scrollableTable').scrollTo($('#finishedScrolling'), {
        duration: 1000 * 60 * 1, //3 minutes
        easing: 'linear',
        onAfter: function(){
            requestAnimationFrame(function() {
                    $('#scrollableTable').scrollTo($('#startScrolling'));
                    ScrollResults();
                });
        }
    });
}


function ScrollRacers()
{
    $('#scrollableTable').scrollTo($('#startScrolling'), {
        duration: 10});

    var dur = pos*500;
    if (dur<7500) { dur=7500; }
    $('#scrollableTable').scrollTo($('#finishedScrolling'), {
        duration: dur,
        easing: 'linear',
        onAfter: function(){
            requestAnimationFrame(function() {
                console.log(pos + ' racers scrolled');
                UpdateRacers();
                });
        }
    });
}

function UpdateRacers()
{
    console.log("Loading racer table");
    $('#scrollableTable').finish();

    $.ajax(
    {
        url: '/api.php?r=finishorder',
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
         *
         *  [{"ID":"1","RacerNumber":"25","SwimmerID":"81","FirstName":"Maxwell","LastName":"Adams","City":"Lancaster","Country":"PA","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-04 14:38:12.0000","Age":"49","StartTime":"2018-11-08 14:30:08"},
         * {"ID":"1","RacerNumber":"28","SwimmerID":"84","FirstName":"Nicole","LastName":"Angeli","City":"Cabo Rojo","Country":"PR","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-08 13:55:07.0000","Age":"31","StartTime":"2018-11-08 14:30:08"},
         * {"ID":"1","RacerNumber":"59","SwimmerID":"115","FirstName":"Alex ","LastName":"Kostich","City":"Los Angeles","Country":"CA","Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0","averageDate":"2018-11-08 13:56:38.0000","Age":null,"StartTime":"2018-11-08 14:30:08"}
         */
        if (data != null && data != undefined && data!="")
        {
            var fins;
            var time;
            var age;
            pos=1;
            $('.finisherTable > tbody').empty();
            $.each(data, function(i, item) {
                (item.HasFins == 0) ? fins='' : fins='hasFins';
                time = DateDiff (item.StartTime, item.averageDate, true);
                age = GetAge(item.Birthdate);
                $('#finisherTable > tbody').append("<tr><td>" + pos + "</td><td>" + item.RacerNumber + "</td><td class='" + item.Cap + "'></td>"
                    + "<td class='" + fins + "'></td><td>" + item.LastName + ", " + item.FirstName
                    + "<td>" + item.City + "," + item.State + "</td>"
                    + "<td>" + age + ","
                    + "<td>" + time + "</td></tr>");
                pos++;
            });

            UpdateDashboard();
        }

        else
        {
            console.log("No Data");
            setTimeout( () => location.reload(), 60000);
        }
    })
    .fail(function(xhr, desc, err)
    {
        console.log(desc);
        setTimeout( () => location.reload(), 60000);
    });
}

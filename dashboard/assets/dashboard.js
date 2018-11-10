var pos;

function ScrollRacers()
{
    $('#finishedScrolling').ScrollTo({
        duration: pos*1000,
        easing: 'linear',
        callback: function(){location.reload();}
    });
}

function UpdateRacers()
{
    $.ajax(
    {
        url: '/api.php?r=finishorder',
        //url: '/api.php?r=racersswimming',
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
            pos=1;
            $('.finisherTable > tbody').empty();
            $.each(data, function(i, item) {
                (item.HasFins == 0) ? fins='' : fins='hasFins';
                time = DateDiff (item.StartTime, item.averageDate, true);
                $('#finisherTable > tbody').append("<tr><td>" + pos + "</td><td>" + item.RacerNumber + "</td><td class='" + item.Cap + "'></td>"
                    + "<td class='" + fins + "'></td><td>" + item.LastName + ", " + item.FirstName
                    + "<td>" + item.City + "," + item.Country + "</td>"
                    + "<td>" + time + "</td></tr>");
                pos++;
                if (pos > 60) {return false;}
            });

            setTimeout(ScrollRacers, 3000);
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
    });
}

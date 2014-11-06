
var raceTimes;
var secondTimer;

//OnReady, start the timer
$(function()
{
	callRaceTimesAPI();
	setInterval(callRaceTimesAPI, 30000);
});

//Function to AJAX the race times from the API
function callRaceTimesAPI()
{
	clearInterval(secondTimer);
	$.ajax(
	{
		url: '/swimrace_timing/api.php?r=racetimes',
		type: 'get',
		contentType: 'application/json',
		dataType: 'json'
	})
	.done (function(data)
	{
		//{"ID":"1","Description":"5 Mile","CapHex":"#FFFF00","StartTime":"2014-05-15 03:09:14"}
		console.log(JSON.stringify(data));
		raceTimes =  data;
		if (data != null)
		{
			secondTimer = setInterval(showTimes, 1000);
		}
	})
	.fail(function(xhr, desc, err)
	{
		alert(desc);
	})
	;		
}


//Display Elapsed Times for races
function showTimes()
{
	$.each(raceTimes, function(idx, obj)
	{
		if (obj.StartTime != null)
		{
			displayElapsed(new Date(Date.parse(obj.StartTime)), $("#racetime" + obj.ID));
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
	var time = DateDiff(starttime, new Date(), true);
	
	
	$(el).text(time);
}

function DateDiff(starttime, endtime, showSeconds)
{
	var timeDiff = endtime - starttime;

	// Calculate H:MM:SS
	var timeDiff = timeDiff / 1000;
	var seconds = Math.round(timeDiff % 60);
	timeDiff = Math.floor(timeDiff / 60);
	var minutes = Math.round(timeDiff % 60);
	timeDiff = Math.floor(timeDiff / 60);
	var hours = Math.round(timeDiff % 24);
	timeDiff = Math.floor(timeDiff / 24);
	var days = timeDiff ;
	
	if (showSeconds)
	{
		return hours + " : " + padLeft(minutes) + " : " + padLeft(seconds);
	}
	else
	{
		return hours + " : " + padLeft(minutes);
	}
	
}

//Function to add a leading zero to single diget time frames
function padLeft(time)
{
	var pad = "00";
	var str = "" + time;
	return pad.substring(0, pad.length - str.length) + str;
}

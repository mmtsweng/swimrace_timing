
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
		url: '/api.php?r=racetimes',
		type: 'get',
		contentType: 'application/json',
		dataType: 'json'
	})
	.done (function(data)
	{
		//{"ID":"1","Description":"5 Mile","CapHex":"#FFFF00","StartTime":"2014-05-15 03:09:14"}
		//console.log(JSON.stringify(data));
		raceTimes =  data;
		if (data != null && data != undefined)
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
	var time = DateDiff(endTime, starttime, true);
	//console.log(endTime + " - " + starttime);
	
	$(el).text(time);
}


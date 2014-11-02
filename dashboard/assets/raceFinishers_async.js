
var showTruncated = false;
var showOverall = false;
var showSeconds = false;
var showFinals = false;

//OnReady, start the timer
$(function()
{
	callRaceFinishersAPI();
});


//Function to AJAX the race times from the API
function callRaceFinishersAPI()
{
	$.ajax(
	{
		url: '/swimrace_timing/api.php?r=finishorder',
		type: 'get',
		contentType: 'application/json',
		dataType: 'json'
	})
	.done (function(data)
	{
		//alert (JSON.stringify(data));
		/*
		 * [
		 * {"ID":"1","RacerNumber":"1","SwimmerID":"10","FirstName":"Alex","LastName":"Kostich",
		 * 	"Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0",
		 *  "averageDate":"2014-10-17 19:53:06","StartTime":"2014-10-17 19:50:41"},
		 * {"ID":"1","RacerNumber":"2","SwimmerID":"12","FirstName":"Brian","LastName":"Brady",
		 * 	"Description":"5 Mile","Cap":"Yellow","CapHex":"#FFFF00","HasFins":"0",
		 * 	"averageDate":"2014-10-17 19:53:25","StartTime":"2014-10-17 19:50:41"}
		 */
		raceTimes =  data;
		showFinishers();
		if (showTruncated) 
		{			
			resetTable($('#finisherTable'), true);
			setTimeout(callRaceFinishersAPI, 15000);
		}
		else
		{
			if (!showFinals)
			{
				scroll(raceTimes.length);
			}
		}
	})
	.fail(function(xhr, desc, err)
	{
		console.log(desc);
	})
	;		
}

//Function to show the finishers 
function showFinishers()
{
	if (showOverall) 
	{
		showFinishersOverall();
	}
	else
	{
		showFinishersByRace();
	}
}

//Function to show the overall order of finish
function showFinishersOverall()
{
	$('#finisherTable tbody tr').remove();
	$.each(raceTimes, function(idx,item)
	{
		if (!showTruncated || idx >= raceTimes.length - 10)
		{
			var hasfins = $('<td>').html('&nbsp;');
			var cap = $('<td class="cap ' + item.Cap +'"/>').html('&nbsp;');
			var dtF = new Date(item.averageDate);
			var dtS = new Date(item.StartTime);
			var finishTime = $('<td>').html('<span class="race">(' + item.Description + ')</span>  ' + DateDiff(dtS, dtF, showSeconds));
			if (item.HasFins == '1')
			{
				$(hasfins).addClass('hasFins');
			}
			var tr = $('<tr/>')
				.append(cap)			
				.append($('<td/>').html(idx+1))
				.append($('<td/>').html(item.SwimmerID))
				.append($('<td/>').html(item.LastName + ', ' + item.FirstName))
				.append(finishTime)	
				.append(hasfins);
			$('#finisherTable tbody').append(tr);
		}
	});
}

//Function to show order of finish by race
function showFinishersByRace()
{
	var orders = [0, 0, 0];
	$('#finisherTable1 tbody tr').remove();
	$('#finisherTable2 tbody tr').remove();
	$('#finisherTable3 tbody tr').remove();
	$.each(raceTimes, function(idx,item)
	{
		orders[item.ID-1]++;
		if (!showTruncated || idx >= raceTimes.length - 10)
		{
			var hasfins = $('<td>').html('&nbsp;');
			var cap = $('<td class="cap ' + item.Cap +'"/>').html('&nbsp;');
			var dtF = new Date(item.averageDate);
			var dtS = new Date(item.StartTime);
			var location = $('<td class="location"/>').html(item.City + ',' + item.State + ' ' + item.Country);
			var finishTime = $('<td>').html(DateDiff(dtS, dtF, showSeconds));
			if (item.HasFins == '1')
			{
				$(hasfins).addClass('hasFins');
			}
			var tr = $('<tr/>')
				.append(cap)			
				.append($('<td/>').html(orders[item.ID-1]))
				.append($('<td/>').html(item.SwimmerID))
				.append($('<td/>').html(item.LastName + ', ' + item.FirstName))
				.append(finishTime)
				.append(location)				
				.append(hasfins);
			$('#finisherTable' + item.ID + ' tbody').append(tr);
		}
	});
}


var showTruncated = false;
var showOverall = false;
var showSeconds = false;
var showFinals = false;
var raceFinishers = null;

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
		url: '/api.php?r=finishorder',
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
		raceFinishers =  data;
		if (raceFinishers != null && raceFinishers != undefined)
		{
			$('#scrollableTable').show();
			showFinishers();
			setTimeout(callRaceFinishersAPI, 15000);
		}
		else
		{
			$('#scrollableTable').hide();
			console.log("No Data");
			setTimeout(callRaceFinishersAPI, 5000);
		}
	})
	.fail(function(xhr, desc, err)
	{
		console.log(desc);
	})
	;		
}


//Function to show the overall order of finish
function showFinishers()
{
	$('#finisherTable tbody tr').remove();
	$.each(raceFinishers, function(idx,item)
	{
		if (!showTruncated || idx >= raceFinishers.length - 10)
		{
			var cap = $('<td class="cap ' + item.Cap +'"/>').html('&nbsp;');
			var dtF = parseDT(item.averageDate);
			var dtS = parseDT(item.StartTime);
			var finishTime = $('<td>').html('<span class="race">(' + item.Description + ')</span>  ' + DateDiff(dtS, dtF, showSeconds));
			var tr = $('<tr/>')
				.append(cap)			
				.append($('<td/>').html(idx+1))
				.append($('<td/>').html(item.RacerNumber))
				.append($('<td/>').html(item.LastName + ', ' + item.FirstName))
				.append(finishTime)	
			$('#finisherTable tbody').append(tr);
		}
	});
}



//OnReady, start the timer
$(function()
{
	callRaceFinishersAPI();
	//setInterval(callRaceFinishersAPI, 10000);
});


//Function to AJAX the race times from the API
function callRaceFinishersAPI()
{
	clearInterval(secondTimer);
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
		scroll(raceTimes.length);

	})
	.fail(function(xhr, desc, err)
	{
		alert(desc);
	})
	;		
}

//Function to show the finishers 
function showFinishers()
{
	$('#finisherTable tbody tr').remove();
	$.each(raceTimes, function(idx,item)
	{
		if (idx >= raceTimes.length - 30) //10
		{
			var hasfins = $('<td>').html('&nbsp;');
			var cap = $('<td class="cap ' + item.Cap +'"/>').html('&nbsp;');
			var dtF = new Date(item.averageDate);
			var dtS = new Date(item.StartTime);
			var finishTime = $('<td>').html('<span class="race">(' + item.Description + ')</span>  ' + DateDiff(dtS, dtF, false));
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
			//alert(tr);
			$('#finisherTable tbody').append(tr);
		}
	});
}

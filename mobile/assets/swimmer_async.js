
$(function()
{
	//Set focus
	$('input#RacerText').focus();
	
	//Bind keypress
	$('input#RacerText').bind('keypress', function(e)
	{
		{
			//Check for [Enter]
			if (e.keyCode==13 || e.keyCode==10 || e.keyCode==9)
			{
				saveSwimmerTime();
			}
		}
	});
	
	$('#RacerGo').click(function (e)
	{
		saveSwimmerTime();
	});
});

//Save this racer number's finish time
function saveSwimmerTime()
{
	//Load swimmer results
	var id = $('#RacerText').val();
	var finishTime = new Date().toISOString().slice(0, 19).replace('T', ' ');
	CallSwimmerFinishAPI(id, finishTime);						
				
	//Clear textbox
	$('#RacerText').val('');
}

//API Call
function CallSwimmerFinishAPI(id, finishtime)
{
		var apiData = {RacerNumber:id, FinishTime:finishtime};
		//alert(JSON.stringify(apiData));
		
		$.ajax(
		{
			url: '/api.php?r=swimmerfinish',
			type: 'post',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(apiData)
		})
		.done (function(data)
		{
			$.each(data, function(index, item)
			{
				//alert (JSON.stringify(data));
				//[{"ID":"2","TimeID":"14","RacerNumber":"123","firstname":"Matt","lastname":"Brown","Description":"5 Mile","CapHex":"#FFFF00"}]
				var dtF = parseDT(item.FinishTime);
				var dtS = parseDT(item.StartTime);
				var li = '<li><span style="background-color: ' + item.CapHex + '">' + item.RacerNumber + '</span> -- ' + item.lastname + ", " + item.firstname + "   " + DateDiff(dtS, dtF, true) + '</li>';				
				$('ul#SwimmerList').append(li);
				
				//Limit to 5
				if ($('ul#SwimmerList li').length > 5)
				{
					$('ul#SwimmerList li:first').remove();
				}	
			});
		})
		.fail(function(xhr, desc, err)
		{
			alert(desc);
		})
		;		
}

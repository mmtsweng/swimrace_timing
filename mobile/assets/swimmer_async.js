
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
	//Check for Storage
	if (localStorage['finishers'] == null)
	{
		localStorage['finishers'] = JSON.stringify([]);
	}
	
	//Load swimmer results
	var id = $('#RacerText').val();
	var finishTime = JSONLocalTime();
	StoreLocally(id, finishTime);						
	CallSwimmerFinishAPI(id, finishTime);	
	PrintLocal();					
				
	//Clear textbox
	$('#RacerText').val('');
}

//Method to store all finishers in local storage
function StoreLocally(id, finishtime)
{
	var finisherData = {RacerNumber:id, FinishTime:finishtime};
	var storedNames = JSON.parse(localStorage["finishers"]);
	storedNames.push(finisherData);
	localStorage["finishers"] = JSON.stringify(storedNames);
}

//Method to Print the Local Storage Items to the Screen
function PrintLocal()
{
	var storedFinisher = JSON.parse(localStorage["finishers"]);
	$('#SwimmerLocalStorage').empty();
	$.each(storedFinisher, function(i, item){
			$('#SwimmerLocalStorage').prepend(item.RacerNumber + " , " + item.FinishTime + "<br />");
	});
}

//Method to upload all the local storage items to the server
function BulkUpload()
{
	var storedFinisher = JSON.parse(localStorage["finishers"]);
	$('#SwimmerLocalStorage').empty();
	$.each(storedFinisher, function(i, item){
		var apiData = {RacerNumber:item.RacerNumber, FinishTime:item.FinishTime};
		
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
			$('#SwimmerLocalStorage').prepend(item.RacerNumber + " , " + item.FinishTime + "<br />"); 
		})
		.fail(function(xhr, desc, err)
		{
			console.log(desc);
		});		
	});
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
			console.log('Saved ID:' + id + 'Time:' + finishTime); 
		})
		.fail(function(xhr, desc, err)
		{
			console.log(desc);
		});		
}

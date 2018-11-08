
$(function()
{
    //Check for Storage
    if (localStorage['finishers'] == null)
    {
        localStorage['finishers'] = JSON.stringify([]);
    }
    if (localStorage['moves'] == null)
    {
        localStorage['moves'] = JSON.stringify([]);
    }

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
    var finishTime = JSONLocalTime();
    StoreLocally(id, finishTime);
    CallSwimmerFinishAPI(id, finishTime);
    PrintLocal();

    //Clear textbox
    $('#RacerText').val('');
}

function UpdateFinish()
{
    //Get Data from Webpage
    var id=$('#RacerUpdateID').val();
    var notes = $('#RacerUpdateNotes').val();
    var finishTime = null;
    var storedData = JSON.parse(localStorage['moves']);
    var storedFinishers = JSON.parse(localStorage['finishers']);

    //Get additional data from local Storage
    $(storedFinishers).each(function (index)
    {
        if (storedFinishers[index].RacerNumber == id)
        {
            finishTime = storedFinishers[index].FinishTime;
            storedFinishers.splice(index, 1);
            localStorage["finishers"] = JSON.stringify(storedFinishers);
            return false;
        }
    });

    //Update Local Storage
    storedData.push({RacerNumber: id, FinishTime:finishTime, Notes: notes});
    localStorage['moves'] = JSON.stringify(storedData);

    //Clear boxes
    $('#RacerUpdateID').val('');
    $('#RacerUpdateNotes').val('');

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

    var storedMoves = JSON.parse(localStorage["moves"]);
    $('#SwimmerLocalMoves').empty();
    $.each(storedMoves, function(i, item){
        $('#SwimmerLocalMoves').prepend(item.RacerNumber + " , " + item.FinishTime + " - " + item.Notes + "<br />");
    });
}

//Method to upload all the local storage items to the server
function BulkUpload()
{
    var storedFinisher = JSON.parse(localStorage["finishers"]);
    $('#SwimmerLocalStorage').empty();
    $.each(storedFinisher, function(i, item){
        CallSwimmerFinishAPI(item.RacerNumber, item.FinishTime);
    });
}

//API Call
function CallSwimmerFinishAPI(id, finishtime)
{
        var apiData = {RacerNumber:id, FinishTime:finishtime};
        //alert(JSON.stringikfy(apiData));

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
            console.log('Saved ID:' + id + 'Time:' + finishtime);
        })
        .fail(function(xhr, desc, err)
        {
            console.log(desc);
        });
}

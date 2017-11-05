

//OnReady, start the timer
$(function()
{
	scroll();
});

//Function to nicely reset the view of the table to the top row
function resetTable(tableElement, reshow)
{
		$(tableElement).fadeOut('slow', 0, function() 
		{
			$('#startScrolling').animatescroll({element: '#scrollableTable', scrollSpeed: 1, onScrollEnd: function()
			{
				if (reshow)
				{
					$(tableElement).fadeIn();
				}
			}});
		}
	);		
}


//Function to start scrolling the results
function scroll()
{
	resetTable($('#finisherTable'), false);	
	callRaceFinishersAPI();
}

function beginAnimate()
{
	console.log('begin animate');
	$('#finisherTable').fadeIn('slow');	
	var rows = $('#finisherTable > tbody > tr').length;
	console.log('rows: ' + rows);
	setTimeout(scroll, rows * 500);
}


//Function called when scrolling is complete
function notify()
{
	console.log('notify');
	scroll();
	return;
	resetTable($('#finisherTable'), false);	
	callRaceFinishersAPI();
}

//Method to scroll to the end of the table
function scrollToView()
{
	$('#finishedScrolling').animatescroll({element: '#scrollableTable', scrollSpeed: 120000, onScrollEnd: notify});
}


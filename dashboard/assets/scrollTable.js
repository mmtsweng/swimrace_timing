

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
	beginAnimate();
}

function beginAnimate()
{
	$('#finisherTable').fadeIn('slow');	
	setTimeout(scrollToView, 3000);
}


//Function called when scrolling is complete
function notify()
{
	resetTable($('#finisherTable'), false);	
	callRaceFinishersAPI();
}

//Method to scroll to the end of the table
function scrollToView()
{
	$('#finishedScrolling').animatescroll({element: '#scrollableTable', scrollSpeed: 120000, onScrollEnd: notify});
}


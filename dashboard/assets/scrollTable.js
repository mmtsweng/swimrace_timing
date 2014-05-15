
var currentRaceTable = 0;

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
function scroll(count)
{
	resetTable($('#finisherTable1'), false);	
	resetTable($('#finisherTable2'), false);	
	resetTable($('#finisherTable3'), false);
	currentRaceTable = 1;
	beginAnimate();
}

function beginAnimate()
{
	switch(currentRaceTable)
	{
		case 1:
			$('#RaceDesc').html('5 Mile');
			break;
		case 2:
			$('#RaceDesc').html('2 Mile');
			break;
		case 3:
			$('#RaceDesc').html('1 Mile');
			break;
	}
	$('#finisherTable' + currentRaceTable).fadeIn('slow');	
	setTimeout(scrollToView, 3000);
}


//Function called when scrolling is complete
function notify()
{
	resetTable($('#finisherTable' + currentRaceTable), false);	
	currentRaceTable++;
	
	if (currentRaceTable<4)
	{
		beginAnimate();
	}
	else
	{
		callRaceFinishersAPI();
	}
}

//Method to scroll to the end of the table
function scrollToView()
{
	$('#finishedScrolling').animatescroll({element: '#scrollableTable', scrollSpeed: 20000, onScrollEnd: notify});
}


var scrollOffset;
var scrolDelay;

//Function to start scrolling the results
function scroll(count)
{
	console.log ($('#startScrolling').offset().top);
	scrollOffset = $('#finishedScrolling').offset().top + $('#startScrolling').offset().top;
	scrollDelay = count * 750;
	console.log('offset: ' + scrollOffset);
	console.log('delay: ' + scrollDelay);
	setTimeout(scrollToView, 3000);
}

//Function called when scrolling is complete
function notify()
{
	console.log('finished scrolling');
}

//Method to scroll to the end of the table
function scrollToView()
{
	$('#scrollableTable').animate({Top: -scrollOffset}, scrollDelay, 'linear', notify);
}


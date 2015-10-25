
//Parse a mySQL (yyyy-MM-DD HH:mm:ss) into a Javascript date
function parseDT(dt)
{
	var t, result = null;

	if( typeof dt === 'string' )
	{
		t = dt.split(/[- :]/);

		//when t[3], t[4] and t[5] are missing they defaults to zero
		result = new Date(t[0], t[1] - 1, t[2], t[3] || 0, t[4] || 0, t[5] || 0);          
	}
	
	return result;   
}



//DateDiff
function DateDiff(starttime, endtime, showSeconds)
{
/*	
	var matchDate = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/;
	var firstDateParsed = matchDate.exec(starttime);
	var secondDateParsed = matchDate.exec(endtime);
	var a = new Date(firstDateParsed[1], firstDateParsed[2], firstDateParsed[3], firstDateParsed[4], firstDateParsed[5], firstDateParsed[6], 0);
	var b = new Date(secondDateParsed[1], secondDateParsed[2], secondDateParsed[3], secondDateParsed[4], secondDateParsed[5], secondDateParsed[6], 0);
	var differenceInMilliseconds = a.getTime() - b.getTime();

	// minutes
	var minutes = (differenceInMilliseconds / 1000 / 60);

	// hours
	var hours = (differenceInMilliseconds / 1000 / 60 / 60);

	// days
	var days = (differenceInMilliseconds / 1000 / 60 / 60 / 24);
*/
	var timeDiff = Math.abs(endtime - starttime) / 1000;
	var days = Math.floor(timeDiff / 86400);
	timeDiff -= days * 86400;
	var hours = Math.floor(timeDiff / 3600) % 24;
	timeDiff -= hours * 3600;
	var minutes = Math.floor(timeDiff / 60) % 60;
	timeDiff -= minutes * 60;
	var seconds = Math.floor(timeDiff % 60);

/*

	// Calculate H:MM:SS
	var seconds = Math.round(timeDiff % 60);
	timeDiff = Math.floor(timeDiff / 60);
	var minutes = Math.round(timeDiff % 60);
	timeDiff = Math.floor(timeDiff / 60);
	var hours = Math.round(timeDiff % 24);
	timeDiff = Math.floor(timeDiff / 24);
	var days = timeDiff ;
*/
	
	if (showSeconds)
	{
		return hours + " : " + padLeft(minutes) + " : " + padLeft(seconds);
	}
	else
	{
		return hours + " : " + padLeft(minutes);
	}
	
}


//Function to add a leading zero to single diget time frames
function padLeft(time)
{
	var pad = "00";
	var str = "" + time;
	return pad.substring(0, pad.length - str.length) + str;
}

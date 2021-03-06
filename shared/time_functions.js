
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

// Get the Current local time in yyyy-MM-DD HH:mm:ss format
function JSONLocalTime ()
{
    var d = new Date();
    console.log(d);
    return d.getFullYear()
    + "-" + ("0"+(d.getMonth()+1)).slice(-2)
    + "-" + ("0" + d.getDate()).slice(-2)
    + " " + ("0" + d.getHours()).slice(-2)
    + ":" + ("0" + d.getMinutes()).slice(-2)
    + ":" + ("0" + d.getSeconds()).slice(-2);
}

//DateDiff
function DateDiff(starttime, endtime, showSeconds)
{
    var diff =  Math.abs(new Date(endtime) - new Date(starttime));
    var seconds = Math.floor(diff/1000); //ignore any left over units smaller than a second
    var minutes = Math.floor(seconds/60);
    seconds = seconds % 60;
    var hours = Math.floor(minutes/60);
    minutes = minutes % 60;

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
    return time>9 ? "" + time : "0" + time;

    var pad = "00";
    var str = "" + time;
    return pad.substring(0, pad.length - str.length) + str;
}

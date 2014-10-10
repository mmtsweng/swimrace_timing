
		var raceDisplays = new Array();
		var idx = -1;
		
		//OnReady, Show Each Race Result
		$(function()
		{
			initRaceCounts();
			showRace();
			
		});
		
		function showRace()
		{	
			idx++;
			if (idx < raceDisplays.length)
			{
				$('#resultTable'+raceDisplays[idx].ID)
					.fadeIn(400)
					.delay(1000*raceDisplays[idx].Duration)
					.fadeOut(400, function() {showRace();}
				);
			}
			else
			{
				idx=-1;
				showRace();
			}		
		}
		
		//Set up duration to show each race
		function initRaceCounts()
		{
			$.each(races, function(idx, obj)
			{
				var finishcount = 5;
				var valueToPush = {};
				$.each(finishers, function(id2x, obj2)
				{
					if (obj.ID == obj2.ID)
					{
						finishcount++;
					}
				});
				valueToPush.ID = obj.ID;
				valueToPush.Duration = finishcount;				
				raceDisplays.push(valueToPush);
				$('#resultTable'+obj.ID).hide();
			});
		}

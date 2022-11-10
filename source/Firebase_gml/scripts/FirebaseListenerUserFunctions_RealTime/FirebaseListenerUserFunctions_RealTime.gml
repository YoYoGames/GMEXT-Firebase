
function Firebase_Listener_Refresh_RealTime(ind)
{
	with(ind)
	{
		ind.alarm[0] = -1
		event_perform(ev_alarm,0)
	}
}

function Firebase_Listener_SetErrorCountLimit_RealTime(ind,value)
{
	ind.errorCountLimit = value
}

function Firebase_Listener_SetErrorResetSteps_RealTime(ind,value)
{
	ind.errorResetAlarm = value
}


function Firebase_Listener_SetRefreshSteps_RealTime(ind,value) 
{
	ind.refreshCall = value
}


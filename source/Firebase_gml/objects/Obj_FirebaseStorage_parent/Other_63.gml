
if(request == async_load[?"id"])
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	path = async_load[?"result"]
	event_user(0)
}

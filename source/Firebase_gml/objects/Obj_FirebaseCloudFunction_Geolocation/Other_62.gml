
if(async_load[?"status"] != 1)// 1==downloading, 0==success ,<0==Error
if(async_load[?"id"] == request)
{
	var geoData = async_load[?"result"]
	show_message_async(geoData)
	show_debug_message(geoData)
}


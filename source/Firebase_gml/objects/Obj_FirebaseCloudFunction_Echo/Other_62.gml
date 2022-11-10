
if(async_load[?"status"] != 1)// 1==downloading, 0==success ,<0==Error
if(async_load[?"id"] == request)
{
	var echo = async_load[?"result"]
	show_message_async("Echo: " + echo)
}


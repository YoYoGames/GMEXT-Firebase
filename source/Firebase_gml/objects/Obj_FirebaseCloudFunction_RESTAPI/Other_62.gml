
if(async_load[?"status"] != 1)// 1==downloading, 0==success ,<0==Error
if(async_load[?"id"] == request)
{
	show_message_async(json_encode(async_load))
	show_debug_message(json_encode(async_load))
}


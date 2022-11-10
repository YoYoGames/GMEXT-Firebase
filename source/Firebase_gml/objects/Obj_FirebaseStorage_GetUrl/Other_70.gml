
if(request_storage == async_load[?"listener"])
if(async_load[?"success"])
	show_message_async(async_load[?"path"] + " URL: " + async_load[?"value"])
else
	show_message_async(json_encode(async_load))

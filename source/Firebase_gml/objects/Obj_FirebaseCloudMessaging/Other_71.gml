
if(async_load[?"type"] == "Notification_Remote")
{
	show_message_async("Remote Notification: " + json_encode(async_load))

	//iterate the async_load to get all the keys
	//be carful, iOS and android have have different extra key/values
	var key = ds_map_find_first(async_load)
	while(!is_undefined(key))
	{
		show_debug_message(key + " -> " + string(async_load[?key]))
		var key = ds_map_find_next(async_load,key)
	}
		
	//Or directly check if your data key exits and get the data 
	if(ds_map_exists(async_load,"MyFavoriteDataKey"))
	{
		var value = async_load[?"MyFavoriteDataKey"]
		//Do something with the value....
		//..
		//..
	}
}


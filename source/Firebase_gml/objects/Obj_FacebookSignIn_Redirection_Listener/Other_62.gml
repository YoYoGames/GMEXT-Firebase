
//show_debug_message(json_encode(async_load))
if(async_load[?"status"] != 0)
	exit

if(search_request == async_load[?"id"])
{
	if(async_load[?"result"] == "NO_EXISTS")
	{
		alarm[0] = room_speed
		exit
	}
	
	var _code = json_parse(async_load[?"result"])
	
	var _map = ds_map_create();
	_map[? "token"] = _code.access_token;
	_map[? "type"] = "facebook_redirection_login";
	_map[? "success"] = true;
	event_perform_async(ev_async_social, _map);
	
	instance_destroy();
}

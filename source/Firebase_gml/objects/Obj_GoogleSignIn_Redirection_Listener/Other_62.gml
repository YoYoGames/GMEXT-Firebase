
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
	
	var _code = async_load[?"result"]
	show_debug_message("_code: " + _code)
	//code_exchange_request = __google_signin_exchange_code(client_id, redirect_url, client_secret, verifier, _code);
	
	
	var _map = ds_map_create();
	_map[? "idToken"] = _code;
	_map[? "type"] = "GoogleSignIn_Show";
	_map[? "success"] = true;
	event_perform_async(ev_async_social, _map);
	
	instance_destroy();
}

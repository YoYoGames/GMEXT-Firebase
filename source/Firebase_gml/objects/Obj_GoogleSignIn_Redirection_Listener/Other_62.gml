
//show_debug_message(json_encode(async_load))

if(async_load[?"status"] != 0)
	exit

if(search_request == async_load[?"id"])
{
	if(async_load[?"result"] == "NO_EXISTS") {
		alarm[0] = room_speed
		exit
	}
	
	var _token = "";
	try {
		var _tokens = json_parse(async_load[? "result"]);
		_token = _tokens.id_token;
	}
	catch (_err) {
		show_debug_message("[ERROR] couldn't parse server response.");
	}
	
	var _map = ds_map_create();
	_map[? "idToken"] = _token;
	_map[? "type"] = "GoogleSignIn_Show";
	_map[? "success"] = true;
	event_perform_async(ev_async_social, _map);
	
	instance_destroy();
}

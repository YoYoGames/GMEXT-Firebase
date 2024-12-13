
if(async_load[?"status"] != 0)
	exit

if(search_request == async_load[?"id"])
{
	if(async_load[? "result"] == "NO_EXISTS")
	{
		alarm[0] = room_speed
		exit
	}
	
	var _data = json_parse(async_load[?"result"])
	show_debug_message(_data); // this will be the token that was already exchanged!!!
	
	var map = ds_map_create()
	
	var _struct = {
		success: true,
		identityToken: _data.id_token,
		nonce: nonce
	}
	
	var _map = ds_map_create();
	_map[? "id"] = applesignin_signin_response;
	_map[? "response_json"] = json_stringify(_struct)
	_map[? "success"] = true;
	event_perform_async(ev_async_social, _map);
	
	instance_destroy();
}
//else
//	show_debug_message("Apple Sign In Failed");



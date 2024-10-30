if(ds_map_exists(async_load,"listener"))
if(async_load[?"listener"] == token_request)
{
    if(async_load[?"status"] == 200)
    {
		var idToken = async_load[?"value"]
		show_debug_message(idToken)
		
		var _body = {
			idToken: idToken,
		};

		request = FirebaseCloudFunctions_Call("geolocation", _body, 10);
    }
}
else if (async_load[?"listener"] == request) {
	
	var _data = async_load[?"value"]
	show_debug_message("geolocation: " + _data);
}


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

		request = SDKFirebaseCloudFunctions_Call("tokenDecoder", json_stringify(_body), 10);
    }
}

if(async_load[?"listener"] == request)
{
	var _value = async_load[?"value"]
	show_debug_message(_value);
}


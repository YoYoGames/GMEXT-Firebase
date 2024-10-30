if(ds_map_exists(async_load,"listener"))
{
	if(async_load[?"listener"] == token_request)
	{
	    if(async_load[?"status"] == 200)
	    {
			var _idToken = async_load[?"value"]
			show_debug_message(_idToken)
		
			var body = {
				idToken: _idToken,
			};

			request = FirebaseCloudFunctions_Call("tokenDecoder", body, 10);

	    }
	}

	if(async_load[?"listener"] == request)
	{
		var _result = async_load[?"value"]
		
		show_debug_message(_result)
	}


}
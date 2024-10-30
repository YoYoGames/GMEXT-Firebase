if(ds_map_exists(async_load,"listener"))
{
	if(async_load[?"listener"] == token_request)
	{
	    if(async_load[?"status"] == 200)
	    {
			var idToken = async_load[?"value"]
			show_debug_message(idToken)
			show_message_async(idToken)
		
			var body = {
				idToken: idToken,
			};

			request = FirebaseCloudFunctions_Call("tokenDecoder", body, 10);

	    }
	}

	if(async_load[?"listener"] == request)
	{
		var _result = async_load[?"value"]
		
		show_message_async(_result)
	}


}
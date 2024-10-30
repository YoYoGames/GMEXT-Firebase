

if(async_load[?"type"] == "FirebaseAppCheck_GetToket")
{
	if(async_load[?"success"])
	{
		var _token = async_load[?"token"]
		show_debug_message("FirebaseAppCheck_GetToket:\n" + _token)

		var _body = {
			token: _token
		};
		
		request = FirebaseCloudFunctions_Call("appchecktoken", _body, 10);
	}
	else
	{}
}

if(async_load[?"listener"] == request)
{
	//var _result = async_load[?"value"]
	show_debug_message("appCheckToken: " + json_encode(async_load))
}


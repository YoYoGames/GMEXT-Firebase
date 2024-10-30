

if(async_load[?"type"] == "FirebaseAppCheck_GetToket")
{
	if(async_load[?"success"])
	{
		var token = async_load[?"token"]
		show_debug_message("FirebaseAppCheck_GetToket:\n" + token)
		show_message_async("FirebaseAppCheck_GetToket:\n" + token)

		var body = {
				token: "token"
			};
		
		request = FirebaseCloudFunctions_Call("appchecktoken", body, 10);
	}
	else
	{}
}

if(async_load[?"listener"] == request)
{
	//var _result = async_load[?"value"]
	show_debug_message("appCheckToken: " + json_encode(async_load))
	show_message_async("appCheckToken: " + json_encode(async_load))
}


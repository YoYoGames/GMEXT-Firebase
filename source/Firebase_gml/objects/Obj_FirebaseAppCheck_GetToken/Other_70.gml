
if(async_load[?"type"] == "FirebaseAppCheck_GetToken")
{
	if(async_load[?"success"])
	{
		var token = async_load[?"token"]
		show_message_async("FirebaseAppCheck_GetToken:\n" + token)
	}
	else
	{}
}


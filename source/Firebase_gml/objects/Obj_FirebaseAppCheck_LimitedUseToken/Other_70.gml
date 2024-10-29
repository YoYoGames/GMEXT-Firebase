
if(async_load[?"type"] == "FirebaseAppCheck_LimitedUseToken")
{
	if(async_load[?"success"])
	{
		var token = async_load[?"token"]
		show_message_async("FirebaseAppCheck_LimitedUseToken:\n" + token)
	}
	else
	{}
}


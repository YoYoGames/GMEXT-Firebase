
if(async_load[?"type"] == "FirebaseAppCheck_GetToket")
{
	if(async_load[?"success"])
	{
		var token = async_load[?"token"]
		show_message_async("FirebaseAppCheck_GetToket:\n" + token)
	}
	else
	{}
}


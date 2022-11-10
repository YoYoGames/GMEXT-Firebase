
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	if(async_load[?"id"] == request_email)
	{
		email = async_load[?"result"]
		request_password = get_string_async("Password:","MyPassword123")
	}
	
	if(async_load[?"id"] == request_password)
	{
		var password = async_load[?"result"]
		
		var reauthenticate = false
		var array = FirebaseAuthentication_GetProviderUserInfo()
		for(var a = 0 ; a < array_length(array) ; a ++)
		if(array[a].providerId == "password")
		{
			reauthenticate = true
			break
		}
		
		if(reauthenticate)
			FirebaseAuthentication_ReauthenticateWithEmail(email,password)
		else
			FirebaseAuthentication_LinkWithEmailPassword(email,password)
	}
}

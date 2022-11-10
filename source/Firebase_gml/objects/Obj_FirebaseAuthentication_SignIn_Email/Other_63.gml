
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
		FirebaseAuthentication_SignIn_Email(email,password)
	}
}

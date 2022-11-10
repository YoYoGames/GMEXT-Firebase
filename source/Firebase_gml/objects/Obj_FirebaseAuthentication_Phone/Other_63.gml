
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	//if(async_load[?"id"] == request_recaptchaToken)
	//{
	//	recaptchaToken = async_load[?"result"]
	//	request_phone = get_string_async("Phone:","")
	//}
	
	if(async_load[?"id"] == request_phone)
	{
		phone = async_load[?"result"]
		FirebaseAuthentication_SendVerificationCode(phone,recaptchaToken)
	}
	
	if(async_load[?"id"] == request_code)
	{
		var code = async_load[?"result"]
		
		if(FirebaseAuthentication_GetUID() == "")
			FirebaseAuthentication_SignInWithPhoneNumber(phone,code,sessionInfo)
		else
		{
			var reauthenticate = false
			var array = FirebaseAuthentication_GetProviderUserInfo()
			for(var a = 0 ; a < array_length(array) ; a ++)
			if(array[a].providerId == "phone")
			{
				reauthenticate = true
				break
			}
	
			if(reauthenticate)
				FirebaseAuthentication_ReauthenticateWithPhoneNumber(phone,code,sessionInfo)
			else
				FirebaseAuthentication_LinkWithPhoneNumber(phone,code,sessionInfo)
		}
	}
}

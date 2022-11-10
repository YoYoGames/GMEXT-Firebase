
if(FirebaseAuthentication_GetUserData_raw() == "{}")
	FirebaseAuthentication_SignIn_OAuth(token,token_kind,provider,redirect_uri)
else
{
	var reauthenticate = false
	var array = FirebaseAuthentication_GetProviderUserInfo()
	for(var a = 0 ; a < array_length(array) ; a ++)
	if(array[a].providerId == provider)
	{
		reauthenticate = true
		break
	}
	
	if(reauthenticate)
		FirebaseAuthentication_ReauthenticateWithOAuth(token,token_kind,provider,redirect_uri)
	else
		FirebaseAuthentication_LinkWithOAuthCredential(token,token_kind,provider,redirect_uri)
}

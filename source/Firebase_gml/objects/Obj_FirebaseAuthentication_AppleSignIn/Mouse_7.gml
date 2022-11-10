
event_inherited();

if((os_type == os_android or os_browser != browser_not_a_browser) and FirebaseAuthentication_Library_useSDK)
{
	var jsonArray_scopes = json_stringify(["email","name"])
	
	if(FirebaseAuthentication_GetUserData_raw() == "{}")
		SDKFirebaseAuthentication_SignInWithProvider(provider,jsonArray_scopes)
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
			SDKFirebaseAuthentication_ReauthenticateWithProvider(provider,jsonArray_scopes)
		else
			SDKFirebaseAuthentication_LinkWithProvider(provider,jsonArray_scopes)
	}
	exit
}



AppleSignIn_CrossPlatform_AddScope(mac_applesignin_scope_fullname);
AppleSignIn_CrossPlatform_AddScope(mac_applesignin_scope_email);
AppleSignIn_CrossPlatform_AuthoriseUser();

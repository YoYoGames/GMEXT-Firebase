
function AppleSignIn_CrossPlatform_Init()
{
	switch(os_type)
	{
		case os_ios: case os_tvos: return AppleSignIn_Init()
		case os_macosx: return Mac_AppleSignIn_Init()
	}
}

function AppleSignIn_CrossPlatform_AuthoriseUser()
{
	switch(os_type)
	{
		case os_ios: case os_tvos: Mac_AppleSignIn_RegisterWindow(window_handle()); return AppleSignIn_AuthoriseUser()
		case os_macosx: return Mac_AppleSignIn_AuthoriseUser()
	}
}

function AppleSignIn_CrossPlatform_AddScope(scope)
{
	switch(os_type)
	{
		case os_ios: case os_tvos: return AppleSignIn_AddScope(scope)
		case os_macosx: return Mac_AppleSignIn_AddScope(scope)
	}
}

function AppleSignIn_CrossPlatform_ClearScopes()
{
	switch(os_type)
	{
		case os_ios: case os_tvos: return AppleSignIn_ClearScopes()
		case os_macosx: return Mac_AppleSignIn_ClearScopes()
	}
}

function AppleSignIn_CrossPlatform_GetCredentialState(identitiy_token)
{
	switch(os_type)
	{
		case os_ios: case os_tvos: return AppleSignIn_GetCredentialState(identitiy_token)
		case os_macosx: return Mac_AppleSignIn_GetCredentialState(identitiy_token)
	}
}


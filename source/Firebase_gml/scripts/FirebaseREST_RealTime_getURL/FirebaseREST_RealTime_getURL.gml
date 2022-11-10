function FirebaseREST_RealTime_getURL(path,database)
{
	var url;
	if(is_undefined(database))
		url = extension_get_option_value("YYFirebaseRealTime","DatabaseURL")
	else
		url = database
		
	url = FirebaseRealTime_Path_Join(url,path)
	
	if(asset_get_index("RESTFirebaseAuthentication_GetIdToken") == -1)
		url += ".json"
	else
	{
		if(RESTFirebaseAuthentication_GetIdToken() == "")
			url += ".json"
		else
			url += ".json?auth=" + RESTFirebaseAuthentication_GetIdToken()
	}
		

	return(url)
}

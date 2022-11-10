function FirebaseREST_RealTime_getURL(path) 
{

	var url;
	
	if(argument_count == 1)
		url = Firebase_RealTime_URL
	else
		url = argument[1]
	
	url = Firebase_Path_Join(url,path)
	
	if(Obj_Firebase.idToken == "")
		url += ".json"
	else
		url += ".json?auth=" + Obj_Firebase.idToken

	return(url)
}

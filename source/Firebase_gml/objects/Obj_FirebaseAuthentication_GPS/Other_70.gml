
event_inherited()


if(async_load[?"type"] == "GooglePlayServices_RequestServerSideAccess")
if(async_load[?"success"])
{
	show_debug_message(json_encode(async_load))
	if(FirebaseAuthentication_Library_useSDK)
	{
		token = async_load[?"accessToken"]
		event_user(0)
		exit
	}
	
	//https://developers.google.com/identity/protocols/oauth2/web-server#exchange-authorization-code
	
	var header_map = json_decode(FirebaseREST_KeyValue("Content-Type","application/x-www-form-urlencoded"))
	
	var body = "code="+ async_load[?"authCode"] +
		"&client_id=" + client_id +
		"&client_secret=" + client_secret +
		"&redirect_uri=" + redirect_uri +
		"&grant_type=authorization_code"
		
	request = http_request("https://oauth2.googleapis.com/token","POST",header_map,body)
		
	ds_map_destroy(header_map)
}

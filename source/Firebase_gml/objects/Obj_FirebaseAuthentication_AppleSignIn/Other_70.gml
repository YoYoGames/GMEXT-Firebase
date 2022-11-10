
event_inherited()

switch(async_load[?"id"])
{
	case mac_applesignin_signin_response:
	case applesignin_signin_response:
		
	var appleSignInResponse = async_load[?"response_json"]
		
	if(appleSignInResponse == "")
		exit
	
	var jsonMap = json_decode(appleSignInResponse);
	if(!ds_exists(jsonMap,ds_type_map))
		exit
	
	if(jsonMap[? "success"])
	{
		show_debug_message("Apple Sign In Succeeded");
		var identityToken = jsonMap[? "identityToken"];
			
		token = identityToken
		event_user(0)
	}
	else
		show_debug_message("Apple Sign In Failed");
		
	ds_map_destroy(jsonMap);
		
	break;
	
	case mac_applesignin_credential_response:
	case applesignin_credential_response:
		
	break
}

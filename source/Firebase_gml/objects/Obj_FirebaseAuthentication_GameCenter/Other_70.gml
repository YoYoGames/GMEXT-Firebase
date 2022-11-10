
event_inherited()


/// @description Handle callbacks

// We create a switch on the 'type' of the event being triggered
// The type of events used by the GameCenter API starts with "GameCenter_"
switch(async_load[?"type"])
{
	case "GameCenter_Authenticate":
		if(async_load[?"success"])
		{
			if(FirebaseAuthentication_GetUserData_raw() == "{}")
				SDKFirebaseAuthentication_SignIn_GameCenter()
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
					SDKFirebaseAuthentication_ReauthenticateWithGameCenter()
				else
					SDKFirebaseAuthentication_LinkWithGameCenter()
			}
			exit
			
			GameCenter_FetchItemsForIdentityVerificationSignature()
		}
		break;
	
	case "GameCenter_FetchItemsForIdentityVerificationSignature":
		show_debug_message("GameCenter: " + json_encode(async_load))
		
		var map = json_decode(GameCenter_LocalPlayer_GetInfo())
		var displayName = map[?"displayName"]
		var playerId = map[?"playerID"]
		show_debug_message("displayName: " + displayName)
		show_debug_message("playerId: " + playerId)
		ds_map_destroy(map)
		
		var publicKeyURL = async_load[?"publicKeyURL"]
		var signature = async_load[?"signature"]
		var salt = async_load[?"salt"]
		var timestamp = async_load[?"timestamp"]
		
		FirebaseAuthentication_SignIn_GameCenter("com.yoyogames.yygfirebase",playerId,publicKeyURL,signature,salt,timestamp,RESTFirebaseAuthentication_GetIdToken(),displayName,
			function(event,status,data)
			{
				show_debug_message("SignIn_GameCenter: " + json_encode(async_load))
				
				var ins = instance_create_depth(0,0,0,Obj_Debug_FallText_Authentication)
				ins.text = event + "-" + string(status) + " -> " + string(data)
				ins.color = status == 200 ? c_white : c_red;

			})
		break;
}

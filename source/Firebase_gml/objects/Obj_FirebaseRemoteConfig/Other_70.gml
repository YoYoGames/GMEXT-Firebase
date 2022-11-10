/// @description Handle callbacks

switch(async_load[?"type"])
{
	// @triggered be FirebaseRemoteConfig_FetchAndActivate()
	case "FirebaseRemoteConfig_FetchAndActivate":
		show_debug_message("FirebaseRemoteConfig_FetchAndActivate: " + string(async_load[?"success"]));
		// At this point if 'success' is true we were able to fetch the remote values and activate them
		// they can now be used inside the app if the function was not successful them the default values
		// are used instead.
		break;
	
	// @triggered be FirebaseRemoteConfig_Reset()
	case "FirebaseRemoteConfig_Reset":
		show_debug_message("FirebaseRemoteConfig_Reset: " + string(async_load[?"success"]));
		// At this point if 'success' is true we were able to reset all the keys
		// this function is not compatible with iOS.
		break;
}

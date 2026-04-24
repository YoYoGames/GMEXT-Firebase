

switch(async_load[?"type"])
{
	case "FirebaseMessaging_OnNewToken":
		show_debug_message("FCM OnNewToken: " + async_load[?"value"])
	break
	
	case "FirebaseCloudMessaging_RequestPermission":
		switch(async_load[?"state"])
		{
			case FIREBASECLOUDMESSAGING_STATE_GRANTED:
				show_debug_message("Notifications Granted")
			break
			
			case FIREBASECLOUDMESSAGING_STATE_NOT_GRANTED:
				show_debug_message("Notifications Not Granted")
			break
			
			case FIREBASECLOUDMESSAGING_STATE_AUTHORIZED:
				show_debug_message("Notifications Authorized")
			break
			
			case FIREBASECLOUDMESSAGING_STATE_DENIED:
				show_debug_message("Notifications Denied")
			break
		}
		
	break
}


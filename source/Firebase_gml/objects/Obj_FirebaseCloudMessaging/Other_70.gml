switch(async_load[?"type"])
{
	case "FirebaseMessaging_OnNewToken":
		show_debug_message("FCM OnNewToken: " + async_load[?"value"])
	break
}
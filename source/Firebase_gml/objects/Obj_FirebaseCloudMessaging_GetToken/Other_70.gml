
if(async_load[?"type"] == "FirebaseCloudMessaging_GetToken")
if(async_load[?"success"])
	show_debug_message("FCM token: " + async_load[?"value"])
else
	show_debug_message("FCM token: FAILED")

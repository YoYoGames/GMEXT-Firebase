
if(async_load[?"type"] == "FirebaseCloudMessaging_DeleteToken")
if(async_load[?"success"])
	show_debug_message("FCM DeleteToken: SUCCESS")
else
	show_debug_message("FCM DeleteToken: FAILED")

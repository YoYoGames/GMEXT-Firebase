
if(async_load[?"type"] == "FirebaseCloudMessaging_SubscribeToTopic")
if(async_load[?"success"])
	show_debug_message("FCM Subscription to '" + async_load[?"topic"] + "': SUCCESS")
else
	show_debug_message("FCM Subscription to '" + async_load[?"topic"] + "': FAILED")

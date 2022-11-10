
if(async_load[?"type"] == "FirebaseCloudMessaging_UnsubscribeFromTopic")
if(async_load[?"success"])
	show_debug_message("FCM Unsubscription to '" + async_load[?"topic"] + "': SUCCESS")
else
	show_debug_message("FCM Unsubscription to '" + async_load[?"topic"] + "': FAILED")

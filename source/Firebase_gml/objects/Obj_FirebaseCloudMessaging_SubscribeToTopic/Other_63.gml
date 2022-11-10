
if(request == async_load[?"id"])
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	var topic = async_load[?"result"]
	FirebaseCloudMessaging_SubscribeToTopic(topic)
}

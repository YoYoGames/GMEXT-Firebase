/// @description Initialize variables

var _info = os_get_info()

// On iOS before we can use local notifications we need to request for permission
// for this purpose we have a permission status variable that will keep track of our status.
iOS_permission_status = LocalPushNotification_iOS_Permission_Status_NotDetermined
if(os_type == os_ios)
{
	// To request the current permission status we can use the function below.
	// It doesn't return the value itself but it will trigger an Async PushNotification
	// Event of the same name with the respective value.
	LocalPushNotification_iOS_Permission_Status();
}
else if(os_type == os_android and _info[? "SDK_INT"] >= 33)
{
	if(os_check_permission("android.permission.POST_NOTIFICATIONS") != os_permission_granted)
		os_request_permission("android.permission.POST_NOTIFICATIONS")
}


switch(async_load[? "type"])
{
	// @triggered by LocalPushNotification_iOS_Permission_Status()
	case "LocalPushNotification_iOS_Permission_Status":
		
		// At the point we have just complete the status request we can cach the return value
		iOS_permission_status =  async_load[? "value"];
		switch(iOS_permission_status)
		{
			case LocalPushNotification_iOS_Permission_Status_Authorized:
				// At this point we know we have been authorized to deliver notifications to the user.
				break;
			
			case LocalPushNotification_iOS_Permission_Status_Denied:
				// At this point we know we have been denided to deliver notifications to the user.
				break;
			
			case LocalPushNotification_iOS_Permission_Status_NotDetermined:
				// At this point we know we haven't requested for permissions just yet
				// We use this logic to request for the permission the function below doesn't return
				// any value but triggers an Async Push Notification Event of the same 'type' value.
				LocalPushNotification_iOS_Permission_Request();
				break;
		}
		
		break;
	
	// @triggered by LocalPushNotification_iOS_Permission_Request()
	case "LocalPushNotification_iOS_Permission_Request":
	
		// Early exit if the request was not successful
		if (!async_load[?"success"]) break;
		
		// The 'value' key contains either the value: 0 - Permission was denied; 1 - Permission was granted
		if(async_load[?"value"])
		{
			// At this point we know we have been authorized to deliver notifications to the user.
			iOS_permission_status = LocalPushNotification_iOS_Permission_Status_Authorized;
		}
		else
		{
			// At this point we know we have been denided to deliver notifications to the user.
			iOS_permission_status = LocalPushNotification_iOS_Permission_Status_Denied;
		}
		break;
}

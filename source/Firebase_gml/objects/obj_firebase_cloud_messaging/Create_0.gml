firebase_messaging_initialize();

if (os_type == os_android)
{
    var _permission = "android.permission.POST_NOTIFICATIONS";

    if (os_check_permission(_permission) != os_permission_granted)
    {
        os_request_permission(_permission);
    }
}
else
{
    firebase_messaging_request_permission(
	        function(_error, _message)
	        {
	            show_debug_message({error: _error, message: _message});
	        }
	    );
}



// @triggered when local notifications fire.
if(async_load[? "type"] == "Notification_Local")
{
	// At this point a notification has been fired.
	// We are now able to access all its parameters.
	show_debug_message("notification_id: " + async_load[? "id"]);
	show_debug_message("notification_title: " + async_load[? "title"]);
	show_debug_message("notification_message: " + async_load[? "message"]);
	show_debug_message("notification_data: " + async_load[? "data"]);
}

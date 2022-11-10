/// @description Create notification

// This function call will create/register a new notification 
// to be delivered some time in the future. The function itself will not
// return anything and will trigger an Async Post Notification Event when the
// notification gets fired.
LocalPushNotification_Create(uid, seconds, title, msg, data);

show_debug_message("Notification Created: " + uid)

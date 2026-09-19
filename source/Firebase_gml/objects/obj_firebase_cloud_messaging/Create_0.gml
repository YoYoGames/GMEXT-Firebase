// ------------------------------------------------------------
// CLOUD MESSAGING - CALLBACKS
// ------------------------------------------------------------

// The SDK delivers each event through one of these. They can be set before
// or after firebase_messaging_initialize(); anything that arrives while a
// callback is not yet set is held and delivered once it is.

firebase_messaging_set_message_callback(function(_message)
{
    show_debug_message("================================");
    show_debug_message("FCM MESSAGE RECEIVED");

    show_debug_message({
        id: _message.message_id,
        from: _message.from,
        type: _message.message_type,
        priority: _message.priority,
        collapse_key: _message.collapse_key,
        sent_time: _message.sent_time,
        ttl: _message.time_to_live,
        opened: _message.notification_opened,
        link: _message.link
    });

    // Custom data - the sender's own keys
    var _keys = variable_struct_get_names(_message.data);
    show_debug_message($"Custom data fields: {array_length(_keys)}");
    for (var i = 0; i < array_length(_keys); ++i)
    {
        show_debug_message($"{_keys[i]} = {_message.data[$ _keys[i]]}");
    }

    // Notification part, when the sender attached one
    if (!is_undefined(_message.notification))
    {
        var _n = _message.notification;
        show_debug_message({
            title: _n.title,
            body: _n.body,
            sound: _n.sound,
            badge: _n.badge,
            tag: _n.tag,
            color: _n.color,
            click_action: _n.click_action,
            android_channel: is_undefined(_n.android) ? "" : _n.android.channel_id
        });
    }

    // Binary payload, when there is one: copy it out, then release the handle
    if (!is_undefined(_message.raw_data))
    {
        var _buffer = buffer_create(_message.raw_data_size, buffer_fixed, 1);
        var _copied = firebase_messaging_raw_data_copy(_message.raw_data, _buffer);
        show_debug_message($"Raw data: {_copied} bytes");
        buffer_delete(_buffer);
        firebase_messaging_raw_data_release(_message.raw_data);
    }
});

// Fires after firebase_messaging_register() completes, and on init when
// registration-on-init is enabled. The id is the Firebase Installation ID
// to target this app instance with.
firebase_messaging_set_registration_callback(function(_installation_id)
{
    show_debug_message($"FCM registered: {_installation_id}");
});

firebase_messaging_set_unregistration_callback(function(_installation_id)
{
    show_debug_message($"FCM unregistered: {_installation_id}");
});


// ------------------------------------------------------------
// CLOUD MESSAGING - INITIALIZE
// ------------------------------------------------------------

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

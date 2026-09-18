
// ------------------------------------------------------------
// CLOUD MESSAGING - POLL REGISTRATION
// ------------------------------------------------------------

// Fires after firebase_messaging_register() completes, and on init when
// registration-on-init is enabled. The id is the Firebase Installation ID
// to target this app instance with.

while (firebase_messaging_poll_registration())
{
    var _installation_id = firebase_messaging_current_installation_id();
    show_debug_message($"FCM registered: {_installation_id}");
}

while (firebase_messaging_poll_unregistration())
{
    var _installation_id = firebase_messaging_current_installation_id();
    show_debug_message($"FCM unregistered: {_installation_id}");
}


// ------------------------------------------------------------
// CLOUD MESSAGING - POLL TOKEN (deprecated by the SDK, still delivered)
// ------------------------------------------------------------

while (firebase_messaging_poll_token())
{
    var _token = firebase_messaging_current_token();
    show_debug_message($"FCM token changed: {_token}");
}



// ------------------------------------------------------------
// CLOUD MESSAGING - POLL MESSAGE
// ------------------------------------------------------------

while (firebase_messaging_poll_message())
{
    show_debug_message("================================");

    show_debug_message("FCM MESSAGE RECEIVED");

    show_debug_message({
        id: firebase_messaging_message_message_id(),
        from: firebase_messaging_message_from(),
        type: firebase_messaging_message_message_type(),
        priority: firebase_messaging_message_priority(),
        collapse_key: firebase_messaging_message_collapse_key(),
        sent_time: firebase_messaging_message_sent_time(),
        ttl: firebase_messaging_message_time_to_live(),
        opened: firebase_messaging_message_notification_opened(),
        link: firebase_messaging_message_link()
    });


    // --------------------------------------------------------
    // CUSTOM DATA
    // --------------------------------------------------------

    var _count = firebase_messaging_message_data_count();

    show_debug_message($"Custom data fields: {_count}");

    for (var i = 0; i < _count; ++i)
    {
        var _key = firebase_messaging_message_data_key_at(i);
        var _value = firebase_messaging_message_get_data(_key);
        show_debug_message($"{_key} = {_value}");
    }


    // --------------------------------------------------------
    // NOTIFICATION INFO
    // --------------------------------------------------------

    if (firebase_messaging_message_has_notification())
    {
        show_debug_message({
			title: firebase_messaging_message_notification_title(),
            body: firebase_messaging_message_notification_body(),
            sound: firebase_messaging_message_notification_sound(),
            badge: firebase_messaging_message_notification_badge(),
            tag: firebase_messaging_message_notification_tag(),
            color: firebase_messaging_message_notification_color(),
            click_action: firebase_messaging_message_notification_click_action(),
            android_channel: firebase_messaging_message_notification_android_channel_id()
        });
    }
}


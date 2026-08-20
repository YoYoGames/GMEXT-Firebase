
firebase_analytics_get_session_id(
    function(_error, _message, _session_id)
    {
        if (_error != 0)
        {
            show_debug_message(_message);
            return;
        }

        show_debug_message(
            "Session ID: "
            + string(_session_id)
        );
    }
);

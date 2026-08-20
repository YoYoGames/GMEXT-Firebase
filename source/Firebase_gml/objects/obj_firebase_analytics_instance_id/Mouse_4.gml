
firebase_analytics_get_analytics_instance_id(
    function(_error, _message, _instance_id)
    {
        if (_error != 0)
        {
            show_debug_message(_message);
            return;
        }

        show_debug_message(
            "Analytics Instance ID: "
            + _instance_id
        );
    }
);

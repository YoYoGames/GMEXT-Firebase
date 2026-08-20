event_inherited();

text = "DesktopDebugMode"


firebase_analytics_set_log_callback(
    function(_level, _message)
    {
        show_debug_message(
            "[Firebase Analytics "
            + string(_level)
            + "] "
            + _message
        );
    }
);



_config =
    firebase_remote_config_get_instance();

firebase_remote_config_fetch_and_activate(
    _config,
    function(_error, _message, _activated)
    {
        if (_error != 0)
        {
            show_debug_message(
                "Remote Config error: "
                + _message
            );

            return;
        }

        var _k1 =firebase_remote_config_get_string(_config,"k1");
        show_debug_message(_k1);
		
        var _k2 =firebase_remote_config_get_string(_config,"k2");
        show_debug_message(_k2);
		
        var _k3 =firebase_remote_config_get_string(_config,"k3");
        show_debug_message(_k3);
    }
);

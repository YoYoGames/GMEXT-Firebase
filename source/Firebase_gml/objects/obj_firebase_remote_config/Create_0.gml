event_inherited();

text = ""

my_remote_configs = {}






my_remote_configs = {}

_config = firebase_remote_config_get_instance();

firebase_remote_config_fetch_and_activate(_config,
    function(_error, _message, _activated)
    {
        if (_error != 0)
        {
            show_debug_message("Remote Config error: " + _message);
            return;
        }

        show_debug_message("Activated new config: "+ string(_activated));

        firebase_remote_config_get_all(_config,
            function(_values)
            {
                // _values is a struct:
                //
                // {
                //     k1: ...,
                //     k2: ...,
                //     k3: ...,
                //     ...
                // }
				
				my_remote_configs = _values

                var _keys = variable_struct_get_names(_values);
                for (var i = 0; i < array_length(_keys); ++i)
                {
                    var _key = _keys[i];

                    var _value = variable_struct_get(_values,_key);

                    show_debug_message(
                        _key
                        + " = "
                        + string(_value)
                    );
                }
            }
        );
    }
);




/////////////////////////Alternative:


//_config = firebase_remote_config_get_instance();


//firebase_remote_config_fetch_and_activate(
//    _config,
//    function(_error, _message, _activated)
//    {
//        if (_error != 0)
//        {
//            show_debug_message("Remote Config error: " + _message);
//            return;
//        }

//        var _k1 = firebase_remote_config_get_string(_config,"k1");
//        show_debug_message(_k1);
		
//        var _k2 = firebase_remote_config_get_string(_config,"k2");
//        show_debug_message(_k2);
		
//        var _k3 = firebase_remote_config_get_string(_config,"k3");
//        show_debug_message(_k3);
//    }
//);

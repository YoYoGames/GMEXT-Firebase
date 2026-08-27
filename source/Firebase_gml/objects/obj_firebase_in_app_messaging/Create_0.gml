

firebase_installations_get_id(
    function(_error, _message, _fid)
    {
        show_debug_message({
            error: _error,
            message: _message,
            firebase_installation_id: _fid
        });

        if (_error == 0)
        {
            show_debug_message(
                $"FIAM TEST FID: {_fid}"
            );
        }
    }
);




firebase_in_app_messaging_set_impression_callback(
    function(
        _message_id,
        _campaign_name,
        _is_test,
        _message_type,
        _data_json
    )
    {
        show_debug_message({
            event: "impression",
            message_id: _message_id,
            campaign_name: _campaign_name,
            is_test: _is_test,
            message_type: _message_type,
            data: json_parse(_data_json)
        });
    }
);






firebase_in_app_messaging_set_click_callback(
    function(
        _message_id,
        _campaign_name,
        _is_test,
        _message_type,
        _action_url,
        _action_text,
        _data_json
    )
    {
        show_debug_message({
            event: "click",
            message_id: _message_id,
            campaign_name: _campaign_name,
            is_test: _is_test,
            message_type: _message_type,
            action_url: _action_url,
            action_text: _action_text,
            data: json_parse(_data_json)
        });
    }
);





firebase_in_app_messaging_set_dismiss_callback(
    function(
        _message_id,
        _campaign_name,
        _is_test,
        _message_type,
        _data_json
    )
    {
        show_debug_message({
            event: "dismiss",
            message_id: _message_id,
            campaign_name: _campaign_name,
            is_test: _is_test,
            message_type: _message_type,
            data: json_parse(_data_json)
        });
    }
);







firebase_in_app_messaging_set_display_error_callback(
    function(
        _message_id,
        _campaign_name,
        _is_test,
        _message_type,
        _error,
        _data_json
    )
    {
        show_debug_message({
            event: "display_error",
            message_id: _message_id,
            campaign_name: _campaign_name,
            is_test: _is_test,
            message_type: _message_type,
            error: _error,
            data: json_parse(_data_json)
        });
    }
);




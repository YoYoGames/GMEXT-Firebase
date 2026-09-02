
firebase_installations_get_token(
    true,
    function(_error, _message, _token)
    {
        if (_error != 0)
        {
            show_debug_message(
                $"Installations token error: {_error} - {_message}"
            );
            return;
        }

        show_debug_message(
            $"Installations token: {_token}"
        );
    }
);
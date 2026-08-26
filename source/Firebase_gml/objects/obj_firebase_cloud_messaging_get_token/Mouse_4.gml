// ------------------------------------------------------------
// CLOUD MESSAGING - GET TOKEN
// ------------------------------------------------------------

firebase_messaging_get_token(
    function(_error, _message, _token)
    {
        show_debug_message({
            error: _error,
            message: _message,
            token: _token
        });

        if (_error == 0)
        {
            show_debug_message(
                "Use this token in Firebase Console "
                + "to send a test notification."
            );
        }
    }
);
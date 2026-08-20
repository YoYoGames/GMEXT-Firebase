if (!firebase_auth_get_auth())
{
    show_debug_message(
        firebase_last_error_message()
    );

    exit;
}

firebase_auth_sign_in_with_email_and_password(
    "new@example.com",
    "password123",
    function(_error, _message, _user)
    {
        if (_error != FirebaseAuthError.None)
        {
            show_debug_message(
                "Login failed: " + _message
            );

            return;
        }

        var _info =
            firebase_auth_user_get_info(_user);

        show_debug_message(
            "UID: " + _info.uid
        );

        show_debug_message(
            "Email: " + _info.email
        );

        show_debug_message(
            "Name: " + _info.display_name
        );

        firebase_auth_user_release(_user);
    }
);

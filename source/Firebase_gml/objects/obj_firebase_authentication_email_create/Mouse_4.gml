
firebase_auth_create_user_with_email_and_password(
    "new@example.com",
    "password123",
    function(_error, _message, _user)
    {
        if (_error == FirebaseAuthError.None)
        {
            show_debug_message("User created");

            firebase_auth_user_release(_user);
        }
        else
        {
            show_debug_message(_message);
        }
    }
);

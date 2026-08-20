var _user = firebase_auth_current_user();

if (!is_undefined(_user))
{
    firebase_auth_user_get_token(_user,false,
        function(_error, _message, _token)
        {
            if (_error == FirebaseAuthError.None)
            {
                show_debug_message($"ID token: {_token}");
            }
            else
            {
                show_debug_message(_message);
            }
        }
    );

    firebase_auth_user_release(_user);
}


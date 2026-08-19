
firebase_auth_sign_in_anonymously(
	    function(_error, _message, _user)
	    {
	        if (_error == FirebaseAuthError.None)
	        {
	            show_debug_message("Anonymous login OK");

	            firebase_auth_user_release(_user);
	        }
	    }
	);

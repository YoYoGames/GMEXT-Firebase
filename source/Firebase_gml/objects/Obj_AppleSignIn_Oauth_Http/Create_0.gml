
#macro APPLESIGNIN_OAUTH_ENDPOINT "https://accounts.google.com/o/oauth2/v2/auth"

client_id = extension_get_option_value("AppleSignIn", "REDIRECTION ClientID");
redirect_uri = extension_get_option_value("AppleSignIn", "REDIRECTION Uri");

scope = "name email";
response_type = "code";
response_mode = "form_post";
nonce = __apple_signin_generate_code_verifier(128);
nonce_sha256 = __apple_signin_generate_code_challenge(nonce);

var _auth_url = "https://appleid.apple.com/auth/authorize"
    + "?client_id=" + string(client_id)
    + "&redirect_uri=" + __apple_signin_url_encode(redirect_uri)
    + "&response_type=" + __apple_signin_url_encode(response_type)
    + "&response_mode=" + __apple_signin_url_encode(response_mode)
    + "&scope=" + __apple_signin_url_encode(scope)
    + "&state=" + __apple_signin_url_encode(state)
    + "&nonce=" + __apple_signin_url_encode(nonce_sha256)

search_request = undefined;
	
url_open(_auth_url);




#macro GOOGLE_OAUTH_ENDPOINT "https://accounts.google.com/o/oauth2/v2/auth"
#macro GOOGLE_GOOGLE_TOKEN_ENDPOINT "https://oauth2.googleapis.com/token"

scope = "openid email profile";

client_id = extension_get_option_value("GoogleSignIn", "OAuth ClientID");
redirect_url = extension_get_option_value("GoogleSignIn", "OAuth URL");

auth_url = GOOGLE_OAUTH_ENDPOINT + "?response_type=code" +
           "&scope=" + __google_signin_url_encode(scope) +
           "&redirect_uri=" + __google_signin_url_encode(redirect_url) +
           "&client_id=" + __google_signin_url_encode(client_id) +
           "&state=" + state;

show_debug_message("auth_url: " + auth_url)
url_open(auth_url);



#macro FACEBOOK_OAUTH_ENDPOINT "https://www.facebook.com/v21.0/dialog/oauth"

client_id = extension_get_option_value("FacebookExtension2", "OAuth ClientID");
redirect_uri = extension_get_option_value("FacebookExtension2", "OAuth URL");

auth_url = FACEBOOK_OAUTH_ENDPOINT +
           "?redirect_uri=" + __facebook_signin_url_encode(redirect_uri) +
           "&client_id=" + __facebook_signin_url_encode(client_id) +
		   "&state=" + state;

show_debug_message("auth_url: " + auth_url)
url_open(auth_url);



fb_init();
fb_logout()
event_inherited()

app_id = extension_get_option_value("YYFirebaseAuthentication", "projectId");

provider = "facebook.com"
redirect_uri = $"https://{app_id}.firebaseapp.com/__/auth/handler"
token_kind = "access_token"

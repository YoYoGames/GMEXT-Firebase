
event_inherited()

project_id = extension_get_option_value("YYFirebaseAuthentication", "projectId");

provider = "google.com"
redirect_uri = $"https://{project_id}.firebaseapp.com/__/auth/handler"
token_kind = "id_token"

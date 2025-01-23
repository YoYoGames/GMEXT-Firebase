
event_inherited()

AppleSignIn_Init()
AppleSignIn_GetCredentialState("")//Apple "identitiyToken"

project_id = extension_get_option_value("YYFirebaseAuthentication", "projectId");

nonce = "";
provider = "apple.com"
redirect_uri = $"https://{project_id}.firebaseapp.com/__/auth/handler"
token_kind = "id_token"


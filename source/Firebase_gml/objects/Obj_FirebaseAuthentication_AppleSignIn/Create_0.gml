
event_inherited()

AppleSignIn_Init()
AppleSignIn_GetCredentialState("")//Apple "identitiyToken"

app_id = extension_get_option_value("YYFirebaseAuthentication", "projectId");

nonce = "";
provider = "apple.com"
redirect_uri = $"https://{app_id}.firebaseapp.com/__/auth/handler"
token_kind = "id_token"


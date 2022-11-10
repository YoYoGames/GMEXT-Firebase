
event_inherited();

request = noone

if(FirebaseAuthentication_Library_useSDK)
{
	provider = "playgames.google.com"
	redirect_uri = ""
	token_kind = "serverAuthCode"
}
else
{
	//Only if you are working with REST API and you want sign in with GooglePlayServices.....
	provider = "google.com"/*"playgames.*/
	redirect_uri = "https://yoyoplayservices-13954376.firebaseapp.com/__/auth/handler"
	token_kind = "id_token"
	//https://console.cloud.google.com/apis/credentials
	//Select your project
	//in section 'OAuth 2.0 Client IDs' choose 'Web client (auto created by Google Service)'
	//Copy Client ID, Client secret and a URI from Authorized redirect URIs
	client_id = "20722703459-a7si0v3inel7uaf69t4cemjo9h20ind7.apps.googleusercontent.com"
	client_secret = "ZdQS3ABKNLdlc9KUo_QHnLyy"
}

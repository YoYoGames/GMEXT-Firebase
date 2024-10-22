

if(async_load[?"listener"] == request)
{
	var _result = async_load[?"value"]
	var _struct = json_parse(_result);
	
	FirebaseAuthentication_SignInWithCustomToken(_struct.customToken);
}


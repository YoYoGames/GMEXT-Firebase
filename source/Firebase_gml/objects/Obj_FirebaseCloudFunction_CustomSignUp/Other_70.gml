

if(async_load[?"listener"] == request)
{
	var _result = async_load[?"value"]
	var _struct = json_parse(_result);
	show_debug_message(json_encode(async_load))
	FirebaseAuthentication_SignInWithCustomToken(_struct.customToken);
}



if(async_load[?"status"] != 1)// 1==downloading, 0==success ,<0==Error
if(async_load[?"id"] == request)
{
	var json = async_load[?"result"]
	var struct = json_parse(json)
	
	FirebaseAuthentication_SignInWithCustomToken(struct.customToken)
}


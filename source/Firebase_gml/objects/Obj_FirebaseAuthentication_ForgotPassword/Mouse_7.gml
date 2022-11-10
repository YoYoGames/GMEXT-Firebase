
if(locked)
	exit

if(FirebaseAuthentication_GetUID() != "")
	exit

request_email = get_string_async("Forgot Password? Email:","youremail@example.com")
	
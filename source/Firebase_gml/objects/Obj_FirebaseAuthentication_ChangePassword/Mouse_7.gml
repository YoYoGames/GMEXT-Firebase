
if(locked)
	exit

if(FirebaseAuthentication_GetUID() == "")
	exit

request = get_string_async("Password","YourNewPassword123")


if(locked)
	exit

if(FirebaseAuthentication_GetUID() == "")
	exit

request = get_string_async("Display Name","myNewName")

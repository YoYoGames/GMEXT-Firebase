
if(locked)
	exit

if(FirebaseAuthentication_GetUID() == "")
	exit

FirebaseAuthentication_SignOut()
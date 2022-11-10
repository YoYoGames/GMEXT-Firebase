
if(locked)
	exit

if(FirebaseAuthentication_GetUID() == "")
	exit

request = get_string_async("PhotoURL","https://coal.yoyogames.com/brand/YoYoGames_Logo/YoYoGames_Primary_OnBlack.png")

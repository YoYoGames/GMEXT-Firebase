
if(FirebaseAuthentication_GetUserData_raw() == "{}")
	exit

show_message_async("Display Name: " + FirebaseAuthentication_GetDisplayName())
show_debug_message("Display Name: " + FirebaseAuthentication_GetDisplayName())

show_message_async("Email: " + FirebaseAuthentication_GetEmail())
show_debug_message("Email: " + FirebaseAuthentication_GetEmail())

show_message_async("Provider User Info: " + json_stringify(FirebaseAuthentication_GetProviderUserInfo()))
show_debug_message("Provider User Info: " + json_stringify(FirebaseAuthentication_GetProviderUserInfo()))

show_message_async("Email Verified: " + string(FirebaseAuthentication_GetEmailVerified()))
show_debug_message("Email Verified: " + string(FirebaseAuthentication_GetEmailVerified()))

show_message_async("Photo Url: " + FirebaseAuthentication_GetPhotoUrl())
show_debug_message("Photo Url: " + FirebaseAuthentication_GetPhotoUrl())

show_message_async("RAW: " + FirebaseAuthentication_GetUserData_raw())
show_debug_message("RAW: " + FirebaseAuthentication_GetUserData_raw())
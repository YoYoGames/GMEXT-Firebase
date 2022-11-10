
event_inherited()

if(async_load[?"type"] == "GoogleSignIn_Show")
if(async_load[?"success"])
{
	token = async_load[?"idToken"]
	event_user(0)
}

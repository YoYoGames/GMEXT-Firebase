

if(request == async_load[?"id"])
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	var str = async_load[?"result"]
	FirebaseAuthentication_ChangePhotoURL(str)
}

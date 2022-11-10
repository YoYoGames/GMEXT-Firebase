
if(request == async_load[?"id"])
if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	var path = async_load[?"result"]
	FirebaseRealTime().Path(path).Exists()
}

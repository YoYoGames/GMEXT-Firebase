
if(!ds_map_exists(async_load,"type"))
	exit

if(!string_count("FirebaseRealTime",async_load[?"type"]))
	exit

var ins = instance_create_depth(0,0,0,Obj_Debug_FallText_RealTime)
ins.text = string(async_load[?"listener"]) + " - " + async_load[?"type"]  + " - " + async_load[?"path"] + " - " + string(async_load[?"status"])

if(ds_map_exists(async_load,"value"))
	ins.text += " -> " + string(async_load[?"value"])
	
if(ds_map_exists(async_load,"errorMessage"))
	ins.text += " -> " + string(async_load[?"errorMessage"])

if(async_load[?"status"] == 200)
	ins.color = c_white
else
	ins.color = c_red


////////////////////////////

if(async_load[?"status"] == 200)//400: general error; 401: expired toek || invalid token || denied permision; 503: unavailable
//if(async_load[?"listener"] == myListener)//comapre with your listener if you have one...
switch(async_load[?"type"])
{

	case "FirebaseRealTime_Set":
		var path = async_load[?"path"]
	break
		
	case "FirebaseRealTime_Read":
		var path = async_load[?"path"]
		if(ds_map_exists(async_load,"value"))//value can not exists
		{
			var value = async_load[?"value"]
		}
	break
	
	case "FirebaseRealTime_Listener":
		var path = async_load[?"path"]
		if(ds_map_exists(async_load,"value"))//value can not exists
		{
			var value = async_load[?"value"]
		}
	break

	
	case "FirebaseRealTime_Exists":
	
		var path = async_load[?"path"]
		if(async_load[?"value"])
		{
			//exists
		}
		else
		{
			//not exists
		}
			
	break

	case "FirebaseRealTime_Delete":
		var path = async_load[?"path"]
	break
}

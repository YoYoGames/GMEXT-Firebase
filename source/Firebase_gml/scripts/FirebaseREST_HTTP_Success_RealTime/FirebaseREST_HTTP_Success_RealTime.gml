
function FirebaseREST_HTTP_Success_RealTime()
{
	switch(event)
	{
		default:
			FirebaseREST_asyncCall_RealTime()
		break

		////////////////////////////////////////////////REALTIME DATABASE
		
		case "FirebaseRealTime_Listener":
		case "FirebaseRealTime_Read":
			if(async_load[?"result"] == "null")
				FirebaseREST_asyncCall_RealTime(undefined)
			else
			{
				var value = json_parse(async_load[?"result"])
				if(is_struct(value))
					value = json_stringify(value)
				FirebaseREST_asyncCall_RealTime(value)
			}
		break
        
	    case "FirebaseRealTime_Exists":
			if(async_load[?"result"] == "null")
				FirebaseREST_asyncCall_RealTime(false)
			else
				FirebaseREST_asyncCall_RealTime(true)
	    break
		
	}
}

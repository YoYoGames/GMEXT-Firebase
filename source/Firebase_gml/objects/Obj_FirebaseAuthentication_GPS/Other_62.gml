if(async_load[?"status"] != 1)// 1==downloading, 0==success ,<0==Error
if(async_load[?"id"] == request)
{
    if(async_load[?"http_status"] == 200 and async_load[?"status"] == 0)
	{
		////https://developers.google.com/identity/protocols/oauth2/web-server#exchange-authorization-code
		var map = json_decode(async_load[?"result"])
		token = map[?"id_token"]
		ds_map_destroy(map)
		
		event_user(0)
	}
	else
	{
	}
}

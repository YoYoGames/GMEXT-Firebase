if(ds_map_exists(async_load,"listener"))
if(async_load[?"listener"] == token_request)
{
    if(async_load[?"status"] == 200)
    {
		var idToken = async_load[?"value"]
		show_debug_message(idToken)
		
		body = {
			idToken: idToken,
		};

		var headerMap = ds_map_create()
		ds_map_add(headerMap,"Content-Type","application/json")//Heads
		request = http_request(url,"POST",headerMap,json_stringify(body))
		ds_map_destroy(headerMap)

    }
}


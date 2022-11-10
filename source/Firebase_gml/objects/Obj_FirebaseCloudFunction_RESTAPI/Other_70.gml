if(ds_map_exists(async_load,"listener"))
if(async_load[?"listener"] == token_request)
{
    if(async_load[?"status"] == 200)
    {
		var idToken = async_load[?"value"]
		show_debug_message(idToken)
		
		
//PUT /your-bucket-name/your-object.txt HTTP/1.1
//Authorization:  (YOUR ACCESS TOKEN GOES HERE)
//Content-Length: 20
//Content-Type: text/plain-or-whatever; charset=utf-8
//Host: storage.googleapis.com
//User-Agent: YourApplication/1.0

//This is a test file

var headerMap = ds_map_create()
//ds_map_add(headerMap,"Authorization","Bearer " + idToken)
ds_map_add(headerMap,"Authorization","Bearer " + RESTFirebaseAuthentication_GetIdToken())
ds_map_add(headerMap,"Accept","application/json")
ds_map_add(headerMap,"Content-Type", "application/json");
request = http_request("https://storage.googleapis.com/storage/v1/b/yoyoplayservices-13954376.appspot.com/o?key="+RESTFirebaseAuthentication_GetIdToken(),"GET",headerMap,"")
ds_map_destroy(headerMap)

		//var body_json = json_stringify({idToken: idToken})

		//var headerMap = ds_map_create()
		//ds_map_add(headerMap,"Content-Type","application/json")
		//ds_map_add(headerMap,"Authorization",idToken)
		//ds_map_add(headerMap,"Content-Length",string_length(body_json))
		//ds_map_add(headerMap,"Host","storage.googleapis.com")
		////ds_map_add(headerMap,"User-Agent",idToken)
		//request = http_request(url,"PUT",headerMap,body_json)
		//ds_map_destroy(headerMap)

    }
}


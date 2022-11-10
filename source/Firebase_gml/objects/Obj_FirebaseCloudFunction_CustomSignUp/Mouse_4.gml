
body = {
	uid: string(irandom_range(10000,99999)),//is better if encode here
};

var headerMap = ds_map_create()
ds_map_add(headerMap,"Content-Type","application/json")//Heads
request = http_request(url,"POST",headerMap,json_stringify(body))
ds_map_destroy(headerMap)


//Echo data
body = {
	data0: "Opera X YoYoGames",
	data1: "Hello World",
	data2: 12345
};

var headerMap = ds_map_create()
ds_map_add(headerMap,"Content-Type","application/json")//Heads
request = http_request(url,"POST",headerMap,json_stringify(body))
ds_map_destroy(headerMap)

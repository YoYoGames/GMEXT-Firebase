
//Echo data
body = {
	data0: "Opera X YoYoGames",
	data1: "Hello World",
	data2: 12345
};


request = SDKFirebaseCloudFunctions_Call("echo", json_stringify(body), 10);


//Echo data
body = {
	data0: "Opera X YoYoGames",
	data1: "Hello World",
	data2: 12345
};


request = FirebaseCloudFunctions_Call("echo", body, 10);

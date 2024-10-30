
body = {
	uid: string(irandom_range(10000,99999)),//is better if encode here
};

request = FirebaseCloudFunctions_Call("customsignup", body, 10);


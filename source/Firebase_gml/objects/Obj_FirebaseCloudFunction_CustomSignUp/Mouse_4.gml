
body = {
	uid: string(irandom_range(10000,99999)),//is better if encode here
};

request = SDKFirebaseCloudFunctions_Call("customSignUp", json_stringify(body), 10);

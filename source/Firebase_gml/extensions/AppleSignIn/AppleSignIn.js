
var scopes = "";

function AppleSignIn_Init()
{
	// Listen for authorization success.
	document.addEventListener('AppleIDSignInOnSuccess', (event) => {
		// Handle successful response.
		
		GMS_API.send_async_event_social({
			id:1,//applesignin_signin_response
			response_json:JSON.stringify({
			authCode: event.detail.authorization.code,
			identityToken: event.detail.authorization.id_token,
			state: event.detail.authorization.state,
			success: 1.0,
			})
		});	
	});

	// Listen for authorization failures.
	document.addEventListener('AppleIDSignInOnFailure', (event) => {
		// Handle error.
		console.log(event.detail.error);
		
		GMS_API.send_async_event_social({
			id:1,//applesignin_signin_response
			response_json:JSON.stringify({
				success: 0.0,
			})
		});	
	});
}

function AppleSignIn_AuthoriseUser()
{
	const random = Hex2Bin(random_bytes(5));
	AppleID.auth.init({
		clientId : GMS_API.extension_get_option_value("AppleSignIn", "ClientID"),
		scope : scopes,
		redirectURI: GMS_API.extension_get_option_value("AppleSignIn", "RedirectURI"),
		state: random,
		usePopup : true,
	});
	
	AppleID.auth.signIn();
}

function AppleSignIn_AddScope(scope)
{
	scopes = scope + " "//space separation
}

function AppleSignIn_ClearScopes()
{
	scopes = "";
}

function AppleSignIn_GetCredentialState(identitiy_token)
{
	
}

function random_bytes(n) {
	var crypto = (self.crypto || self.msCrypto), QUOTA = 65536;
		var a = new Uint8Array(n);
		for (var i = 0; i < n; i += QUOTA) {
			crypto.getRandomValues(a.subarray(i, i + Math.min(n - i, QUOTA)));
		}
		return a.toString();
}

function Hex2Bin(hex){
	var bytes = [];
	var str;

	for(var i=0; i< hex.length-1; i+=2){
		bytes.push(parseInt(hex.substr(i, 2), 16));
	}

	str = String.fromCharCode.apply(String, bytes);

	return(str);
}



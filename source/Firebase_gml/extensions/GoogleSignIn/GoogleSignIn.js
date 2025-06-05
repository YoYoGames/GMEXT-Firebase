
function GoogleSignIn_Show()
{
    const CLIENT_ID = GMS_API.extension_get_option_value("GoogleSignIn", "html5ClientID");

    google.accounts.id.initialize({
      client_id: CLIENT_ID + '.apps.googleusercontent.com',
      callback: handleCredentialResponse,
	  auto_select: true,
	  // use_fedcm_for_prompt: true  // Not necesary for our only client sign-in
    });
	
    google.accounts.id.prompt();
}

function GoogleSignIn_SignOut()
{
    console.log("GoogleSignIn_SignOut :: not available in this platform.")
}

function handleCredentialResponse(credentialResponse)
{
	GMS_API.send_async_event_social({
		type:"GoogleSignIn_Show",
		success:1.0,
		idToken: credentialResponse.credential
	});	
}

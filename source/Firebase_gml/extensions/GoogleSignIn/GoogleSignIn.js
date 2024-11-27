
function GoogleSignIn_Show()
{
    const CLIENT_ID = GMS_API.extension_get_option_value("GoogleSignIn", "html5ClientID");

    google.accounts.id.initialize({
      client_id: CLIENT_ID + '.apps.googleusercontent.com',
      callback: handleCredentialResponse,
	  //use_fedcm_for_prompt: false// https://stackoverflow.com/a/78310284
    });
	
    google.accounts.id.prompt((notification) => 
	{
		console.log(notification);
        if (notification.isNotDisplayed() || notification.isSkippedMoment()) 
		{
            // try next provider if OneTap is not displayed or skipped
        }
		
		console.log(notification.getMomentType());
		console.log(notification.isDisplayed());
    });
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
		idToken:credentialResponse.credential
	});	
}

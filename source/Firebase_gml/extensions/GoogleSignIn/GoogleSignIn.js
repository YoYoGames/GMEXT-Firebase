
function GoogleSignIn_Show_(token)
{
	console.log("GoogleSignIn_Show CALLED");
    google.accounts.id.initialize({
      client_id: '20722703459-v53e1l6aeist3nrupt3oc0casrf1jsa0.apps.googleusercontent.com',
      callback: handleCredentialResponse
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

function handleCredentialResponse(credentialResponse)
{
	
	GMS_API.send_async_event_social({
		type:"GoogleSignIn_Show",
		success:1.0,
		idToken:credentialResponse.credential
	});	
}

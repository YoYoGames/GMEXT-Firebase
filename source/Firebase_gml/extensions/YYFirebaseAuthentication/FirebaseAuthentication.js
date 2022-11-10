
function SDKFirebaseAuthentication_GetUserData()
{
	return SDKFirebaseAuthentication_GetUserData_From(firebase.auth().currentUser);
}

//Start point of index
//Autentication 5000
//storage 6000
//Firestore 7000
//RealTime 10000
let auth_listener_ind = 5000;

function auth_getListenerInd()
{
	auth_listener_ind ++;
	return(auth_listener_ind);
}

function SDKFirebaseAuthentication_GetUserData_From(user)
{
	//https://firebase.google.com/docs/reference/js/v8/firebase.User#providerdata
	
	
	if(user === null)
		return "{}";
	
	let UserMap = {};
	if(user.displayName !== null) UserMap.displayName = user.displayName;
	if(user.email !== null) UserMap.email = user.email;
	if(user.localId !== null) UserMap.localId = user.uid;
	if(user.emailVerified !== null) UserMap.emailVerified = user.emailVerified;
	if(user.phoneNumber !== null) UserMap.phoneNumber = user.phoneNumber;
	if(user.metadata.lastSignInTime !== null) UserMap.lastLoginAt = user.metadata.lastSignInTime;
	if(user.metadata.creationTime !== null) UserMap.createdAt = user.metadata.creationTime;
	
	let list = user.providerData;
	let providerArray = [];
	for(a = 0 ; a < list.length ; a++)
	{
		let userInfo = list[a];
		if(userInfo.providerId == "firebase")
			continue;
		
		let providerObj = {};
		if(userInfo.displayName != null) providerObj.displayName = userInfo.displayName;
		if(userInfo.email != null) providerObj.email = userInfo.email;
		if(userInfo.phoneNumber != null) providerObj.phoneNumber = userInfo.phoneNumber;
		if(userInfo.photoURL != null) providerObj.photoUrl = userInfo.photoURL;
		if(userInfo.providerId != null) providerObj.providerId = userInfo.providerId;
		if(userInfo.uid != null) providerObj.rawId = userInfo.uid;
		if(userInfo.uid != null) providerObj.federatedId = userInfo.uid;
		
		providerArray.push(providerObj);
	}
	UserMap.providerUserInfo = providerArray;
	
	let root = {kind:"identitytoolkit#GetAccountInfoResponse",users:[UserMap]};
	return JSON.stringify(root);
}

function SDKFirebaseAuthentication_SignInWithCustomToken(token)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().signInWithCustomToken(token).then(function(userCredential)
	{
		if(user == null)
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignInWithCustomToken",
				status:400,
			});
		}
		else
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignInWithCustomToken",
				status:200,
				value:SDKFirebaseAuthentication_GetUserData_From(userCredential.user)
			});			
		}
	}).catch(function(error)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignInWithCustomToken",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SignIn_Email(email,password)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().signInWithEmailAndPassword(email,password).then(function(userCredential)
	{
		if(userCredential.user === null)
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignIn_Email",
				status:400,
			});
		}
		else
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignIn_Email",
				status:200,
				value:SDKFirebaseAuthentication_GetUserData_From(userCredential.user)
			});			
		}
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_SignIn_Email",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SignUp_Email(email,password)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().createUserWithEmailAndPassword(email,password).then(function(userCredential) 
	{
		if(userCredential.user === null)
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignUp_Email",
				status:400,
			});
		}
		else
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignUp_Email",
				status:200,
				value:SDKFirebaseAuthentication_GetUserData_From(userCredential.user)
			});
		}
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignUp_Email",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SignIn_Anonymously()
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().signInAnonymously().then(function(userCredential) 
	{
		if(userCredential.user === null)
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignIn_Anonymously",
				status:400,
			});
		}
		else
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignIn_Anonymously",
				status:200,
				value:SDKFirebaseAuthentication_GetUserData_From(userCredential.user)
			});
		}
	}).catch(function(error) 
	{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_SignIn_Anonymously",
				status:400,errorMessage:error.message
			});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SendPasswordResetEmail(email)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().sendPasswordResetEmail(email).then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SendPasswordResetEmail",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SendPasswordResetEmail",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_ChangeEmail(email)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.updateEmail(email).then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangeEmail",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangeEmail",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_ChangePassword(password)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.updatePassword(password).then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangePassword",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangePassword",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_ChangeDisplayName(name)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.updateProfile({displayName:name}).then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangeDisplayName",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangeDisplayName",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_ChangePhotoURL(photoURL)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.updateProfile({photoURL: photoURL}).then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangePhotoURL",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ChangePhotoURL",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SendEmailVerification()
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.sendEmailVerification().then(function() 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SendEmailVerification",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SendEmailVerification",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_DeleteAccount()
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.delete().then(function()
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_DeleteAccount",
			status:200,
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_DeleteAccount",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SignOut()
{
	firebase.auth().signOut();
}
	

///////////////////////////

function SDKFirebaseAuthentication_LinkWithEmailPassword(email,password)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.linkWithCredential(EmailAuthProvider.credential(email,password)).then(function(userCredential)
	{
		if(userCredential.user === null)
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_LinkWithEmailPassword",
				status:400,
			});
		}
		else
		{
			GMS_API.send_async_event_social({
				listener:listenerInd,
				type:"FirebaseAuthentication_LinkWithEmailPassword",
				status:200,
				value:SDKFirebaseAuthentication_GetUserData_From(userCredential.user)
			});			
		}
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_LinkWithEmailPassword",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_SignIn_OAuth(token,token_kind,provider,requestUri)
{
	let listenerInd = auth_getListenerInd();
	let credential = getAuthCredentialFromProvider(token,token_kind,provider);
	firebase.auth().signInWithCredential(credential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignIn_OAuth",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignIn_OAuth",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_LinkWithOAuthCredential(token,token_kind,provider,requestUri)
{
	let listenerInd = auth_getListenerInd();
	let credential = getAuthCredentialFromProvider(token,token_kind,provider);
	firebase.auth().currentUser.linkWithCredential(credential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_LinkWithOAuthCredential",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_LinkWithOAuthCredential",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

	function getAuthCredentialFromProvider(token,token_kind,provider)
	{
		let authCredential = null;
		switch(provider)
		{
			case "facebook.com":
				authCredential = firebase.auth.FacebookAuthProvider.credential(token);
			break;
			
			case "google.com":
				if(token_kind == "id_token")
					authCredential = firebase.auth.GoogleAuthProvider.credential(token,null);
				else
				if(token_kind == "access_token")
					authCredential = firebase.auth.GoogleAuthProvider.credential(null,token);
			break;
		}
		
		return authCredential;
	}


function SDKFirebaseAuthentication_UnlinkProvider(provider)
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.unlink(provider).then(function(user)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_UnlinkProvider",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_UnlinkProvider",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_RefreshUserData()
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.reload().then(function()
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_RefreshUserData",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_RefreshUserData",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_GetIdToken()
{
	let listenerInd = auth_getListenerInd();
	firebase.auth().currentUser.getIdToken(true).then(function(token)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_GetIdToken",
			status:200,
			value:token
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_GetIdToken",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}


function SDKFirebaseAuthentication_SignInWithPhoneNumber(phone,code,sessionInfo)
{
	let listenerInd = auth_getListenerInd();
	let authCredential = firebase.auth.PhoneAuthProvider.credential(sessionInfo,code);
	firebase.auth().signInWithCredential(authCredential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignInWithPhoneNumber",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_SignInWithPhoneNumber",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_LinkWithPhoneNumber(phone,code,sessionInfo)
{
	let listenerInd = auth_getListenerInd();
	let authCredential = firebase.auth.PhoneAuthProvider.credential(sessionInfo,code);
	firebase.auth().currentUser.linkWithCredential(authCredential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_LinkWithPhoneNumber",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_LinkWithPhoneNumber",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_ReauthenticateWithEmail(email,password)
{
	let listenerInd = auth_getListenerInd();
	
	let credential = firebase.auth.EmailAuthProvider.credential(email,password);
	firebase.auth().currentUser.reauthenticateWithCredential(credential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithOAuth",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithOAuth",
			status:400,errorMessage:error.message
		});
	});	
	
	return(listenerInd);
}

function SDKFirebaseAuthentication_ReauthenticateWithOAuth(token,token_kind,provider,requestUri)
{
	let listenerInd = auth_getListenerInd();
	
	let credential = getAuthCredentialFromProvider(token,token_kind,provider);
	firebase.auth().currentUser.reauthenticateWithCredential(credential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithOAuth",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithOAuth",
			status:400,errorMessage:error.message
		});
	});
	
	return(listenerInd);
}

function SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber(phoneNumber,code,sessionInfo)
{
	let listenerInd = auth_getListenerInd();
	
	let credential = firebase.auth.PhoneAuthProvider.credential(sessionInfo,code);
	firebase.auth().currentUser.reauthenticateWithCredential(credential).then(function(authCredential)
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithPhoneNumber",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(authCredential.user)
		});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"FirebaseAuthentication_ReauthenticateWithPhoneNumber",
			status:400,errorMessage:error.message
		});
	});
	
	return(listenerInd);
}


function SDKFirebaseAuthentication_SignInWithProvider(provider,jsonArray_scopes)
{
	let listenerInd = auth_getListenerInd();
	let auth_provider = new firebase.auth.OAuthProvider(provider);
	let array = JSON.parse(jsonArray_scopes);
	array.forEach((entry) => 
	{
		auth_provider.addScope(entry);
	});
	
	firebase.auth().signInWithPopup(auth_provider).then((result) => 
	{
		let user = result.user;
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_SignInWithProvider",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(user)
		});
			
	}).catch((error) => 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_SignInWithProvider",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_LinkWithProvider(provider,jsonArray_scopes)
{
	let listenerInd = auth_getListenerInd();
	let auth_provider = new firebase.auth.OAuthProvider(provider);
	let array = JSON.parse(jsonArray_scopes);
	array.forEach((entry) => 
	{
		auth_provider.addScope(entry);
	});
	
	firebase.auth().currentUser.linkWithPopup(auth_provider).then((result) => 
	{
		let user = result.user;
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_LinkWithProvider",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(user)
		});
			
	}).catch((error) => 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_LinkWithProvider",
			status:400,errorMessage:error.message
		});
	});	
	return(listenerInd);
}

function SDKFirebaseAuthentication_ReauthenticateWithProvider(provider,jsonArray_scopes)
{
	let listenerInd = auth_getListenerInd();
	let auth_provider = new firebase.auth.OAuthProvider(provider);
	let array = JSON.parse(jsonArray_scopes);
	array.forEach((entry) => 
	{
		auth_provider.addScope(entry);
	});
	
	firebase.auth().currentUser.reauthenticateWithPopup(auth_provider).then((result) => 
	{
		let user = result.user;
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_ReauthenticateWithProvider",
			status:200,
			value:SDKFirebaseAuthentication_GetUserData_From(user)
		});
	}).catch((error) => 
	{
		GMS_API.send_async_event_social({
			listener:listenerInd,
			type:"SDKFirebaseAuthentication_ReauthenticateWithProvider",
			status:400,errorMessage:error.message
		});
	});
	return(listenerInd);
}


let mIdTokenListener = null;
function SDKFirebaseAuthentication_IdTokenListener()
{
	let listenerInd = auth_getListenerInd();
	mIdTokenListener = firebase.auth().onIdTokenChanged(function(user) 
	{
		if(!user)
		{
			GMS_API.send_async_event_social({
					type:"FirebaseAuthentication_IdTokenListener",
					listener:listenerInd,
					status:200,
					value:""
				});
			
			return;
		}
		
		user.getIdToken(false).then((token) => 
		{
			GMS_API.send_async_event_social({
					type:"FirebaseAuthentication_IdTokenListener",
					listener:listenerInd,
					status:200,
					value:token
				});
				
		}).catch((error) => 
		{
			//ignore
		});	
	});
	return(listenerInd);
}

function SDKFirebaseAuthentication_IdTokenListener_Remove()
{
	if(mIdTokenListener != null)
	{
		mIdTokenListener();
		mIdTokenListener = null;
	}
}

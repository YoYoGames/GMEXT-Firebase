
//Start point of index
//Autentication 5000
//storage 6000
//Firestore 7000
//RealTime 10000
let Storage_indMap = 7000;

let Storage_listenerIdMap = {};

function Storage_getListenerInd()
{
	Storage_indMap ++;
	return(Storage_indMap);
}

function FileGet(_FileName,displayName)
{
	if(FileExists(_FileName,displayName))
	{
		let name = buildlocalfilename(displayName) + _FileName;
		console.log(name);
		console.log(window.localStorage[name]);
		return window.localStorage[name];
	}
	else
		return null;
}

function FileExists(_FileName,displayName)
{
	try 
	{
		var name = buildlocalfilename(displayName) + _FileName;
		if (window.localStorage[name] && (window.localStorage[name] !== undefined)) 
		{
			return true;
		}
		return false;
	}
	catch (ex) 
	{
		return false;
	}
}

function SDKFirebaseStorage_Cancel(listener)
{
	
}

function buildlocalfilename(DisplayName)
{
    // Only use alpha-numeric characters, and underbars, from the display name
    var displayName = "";
    if (DisplayName !== null && DisplayName !== undefined) {
    
        for (var i = 0; i < DisplayName.length; i++) {
        
            var chr = DisplayName[i];
            if ((chr >= 'a' && chr <= 'z') ||
                (chr >= 'A' && chr <= 'Z') ||
                (chr >= '0' && chr <= '9') ||
                (chr === '_'))
            {
                displayName = displayName + DisplayName[i];
            }
        }
    }
    if (displayName.length === 0) {
        displayName = "GameMaker";
    }
	
	game_id = "0";//g_pBuiltIn.game_id
    return displayName + "." + game_id + ".";
}


function GetLocalStorageName(_fname)
{
    //return (g_pBuiltIn.local_storage + _fname);
	return (GetLocalStorageRoot() + _fname);
}

function GetLocalStorageRoot()
{
    // Only use alpha-numeric characters, and underbars, from the display name
    var displayName = "";
    if (g_pGMFile.Options.DisplayName !== null && g_pGMFile.Options.DisplayName !== undefined) {
    
        for (var i = 0; i < g_pGMFile.Options.DisplayName.length; i++) {
        
            var chr = g_pGMFile.Options.DisplayName[i];
            if ((chr >= 'a' && chr <= 'z') ||
                (chr >= 'A' && chr <= 'Z') ||
                (chr >= '0' && chr <= '9') ||
                (chr === '_'))
            {
                displayName = displayName + g_pGMFile.Options.DisplayName[i];
            }
        }
    }
    if (displayName.length === 0) {
        displayName = "GameMaker";
    }
	
    return displayName + "." + g_pBuiltIn.game_id + ".";
}

function SDKFirebaseStorage_Upload(localPath,firebasePath,displayName,bucket)
{
	let listener = Storage_getListenerInd();
	
	//let myBlob = new Blob(["This is my blob content"], {type : "text/plain"});
	// new Blob([JSON.stringify(myData)],{type:'application/json'})
	let file = FileGet(localPath,displayName);//myBlob;console.log(file);
	console.log("file:");
	console.log(file);
	let uploadTask = firebase.storage().ref().child(firebasePath).put(file);
	uploadTask.on("state_changed",
		function(snapshot) 
		{
			console.log("UPLOAD PROGRESS");
		},function(error)
		{
			console.log("UPLOAD FAILED");
		}, function() 
		{
			console.log("UPLOAD SUCCESS");
		});
	
	return listener;
}


function SDKFirebaseStorage_Download(localPath,storagePath,displayName,bucket)
{
	let listener = Storage_getListenerInd();
	
	let starsRef = firebase.storage().ref().child(storagePath);
	starsRef.getDownloadURL().then(function(url)
	{
		console.log("Download success");
	}).catch(function(error) 
	{
		console.log("Download failed");
	});
	
	return listener;
}


function SDKFirebaseStorage_Delete(firebasePath,bucket)
{
	let listener = Storage_getListenerInd();
	
	let desertRef = firebase.storage().ref().child(firebasePath);
	desertRef.delete().then(function() 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_Delete",
				"listener": listener,
				"path": firebasePath,
				success:1.0
			});
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_Delete",
				"listener": listener,
				"path": firebasePath,
				success:0.0
			});
	});
	
	return listener;
}


function SDKFirebaseStorage_GetURL(firebasePath,bucket)
{
	let listener = Storage_getListenerInd();
	
	firebase.storage().ref().child(firebasePath).getDownloadURL().then(function(downloadURL) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_GetURL",
				"listener": listener,
				"path": firebasePath,
				success:1.0,
				value: downloadURL
			});
			
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_GetURL",
				"listener": listener,
				"path": firebasePath,
				success:0.0,
			});
	});
	
	return listener;
}

function SDKFirebaseStorage_List(firebasePath,maxResults,pageToken,bucket)
{
	let listener = Storage_getListenerInd();

	let promise;
	if(pageToken == "")
		promise = firebase.storage().ref().child(firebasePath).list({maxResults: maxResults});
	else
		promise = firebase.storage().ref().child(firebasePath).list({maxResults: maxResults, pageToken:pageToken});
	
	promise.then(function(listResult) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_List",
				"listener": listener,
				"path": firebasePath,
				"success":1.0,
				"pageToken":listResult.nextPageToken,
				"files":listOfReferencesToJSON(listResult.items),
				"folders":listOfReferencesToJSON(listResult.prefixes)
			});
			
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_List",
				"listener": listener,
				"path": firebasePath,
				success:0.0,
			});
	});
	
	return listener;
}

function SDKFirebaseStorage_ListAll(firebasePath,bucket)
{
	let listener = Storage_getListenerInd();
	
	firebase.storage().ref().child(firebasePath).listAll().then(function(listResult) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_ListAll",
				"listener": listener,
				"path": firebasePath,
				"success":1.0,
				"files":listOfReferencesToJSON(listResult.items),
				"folders":listOfReferencesToJSON(listResult.prefixes)
			});
			
	}).catch(function(error) 
	{
		GMS_API.send_async_event_social({
				"type": "FirebaseStorage_ListAll",
				"listener": listener,
				"path": firebasePath,
				success:0.0,
			});
	});
			
	return listener;
}


	
function listOfReferencesToJSON(list)
{
	let array = [];
	list.forEach(function(ref)
	{
		array.push(ref.fullPath);
	});
	
	return(JSON.stringify(array));
}



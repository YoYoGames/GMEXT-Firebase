
let listenerRefMap = {};
let listenerIdMap = {};

//Start point of index
//Autentication 5000
//storage 6000
//Firestore 7000
//RealTime 10000
let indMap = 10000;

function FirebaseRealTime_SDK(json,callback)
{
	let fluent_obj = JSON.parse(json);
	let action = fluent_obj._action;
	
	if(action == "Set")
		return YYRealTime_Set(fluent_obj,callback);
	else if(action == "Read" || action == "Listener")
		return  YYRealTime_Read(fluent_obj,callback);
	else if(action == "Exists")
		return  YYRealTime_Exists(fluent_obj,callback);
	else if(action == "Delete")
		return YYRealTime_SetDelete(fluent_obj,callback);
	else if(action == "ListenerRemove")
		YYRealTime_SetListenerRemove(fluent_obj);
	else if(action == "ListenerRemoveAll")
		YYRealTime_SetListenerRemoveAll();
	return 0.0;
}

let app_list = [];
function RealTime_makeRef(fluent_obj)
{
	let ref;
	console.log(fluent_obj);
	console.log(fluent_obj._database);
	if(fluent_obj._database == null)
		ref = firebase.database().ref();
	else
	{
		let database = fluent_obj._database;
		
		let current_app = null;
		for(let a = 0 ; a < app_list.length ; a ++)
		if(app_list[a].options.databaseURL == database)
		{
			current_app = app_list[a];
			break;
		}
		
		if(current_app == null)
		{
			current_app = firebase.initializeApp({databaseURL: database},"app" + app_list.length.toString());
			app_list[app_list.length] = current_app;
		}
		ref = firebase.database(current_app).ref();
	}
	
	ref = ref.child(fluent_obj._path);

	return ref;
}

function YYRealTime_Set(fluent_obj,callback)
{
	let listenerInd = getListenerInd();
	let ref = RealTime_makeRef(fluent_obj);
	
	if(fluent_obj._push != null)
		ref = ref.push();
	
	if(typeof fluent_obj._value == "string")
	{
		//If value is json string convert to object
		try{fluent_obj._value = JSON.parse(fluent_obj._value);}catch(e){}
	}
	
	ref.set(fluent_obj._value, function(error)
	{
		let data = {
			type:"FirebaseRealTime_Set",
			listener:listenerInd,
			path:fluent_obj._path,
		};
		
		data = InsertStatusData(data,error);
		
		GMS_API.send_async_event_social(data);
	});
	return(listenerInd);
}

function YYRealTime_Read(fluent_obj,callback)
{
	const listenerInd = getListenerInd();
	let ref = RealTime_makeRef(fluent_obj);
	
	let query = ref;
	
	if(fluent_obj._OrderBy != null)
	if(typeof fluent_obj._OrderBy == "string")
		 query = query.orderByChild(fluent_obj._OrderBy);
	else
	switch(fluent_obj._OrderBy)
	{
		// case 0: query = query.orderByChild(OrderKey); break;
		case 1: query = query.orderByKey(); break;
		case 2: query = query.orderByValue(); break;
	}
	
	if(fluent_obj._StartValue != null)
		query = query.startAt(fluent_obj._StartValue);
	
	if(fluent_obj._EndValue != null)
		query = query.endAt(fluent_obj._EndValue);
		
	if(fluent_obj._EqualTo != null)
		query = query.equalTo(fluent_obj._EqualTo);
		
	if(fluent_obj._LimitKind != null)
	if(fluent_obj._LimitValue != null)
	{
		switch(fluent_obj._LimitKind)
		{
			case 0: query = query.limitToFirst(fluent_obj._LimitValue); break;
			case 1: query = query.limitToLast(fluent_obj._LimitValue); break;
		}			
	}
	
	let callback_type;
	if(fluent_obj._action == "Read")
		callback_type = "FirebaseRealTime_Read";
	else if(fluent_obj._action == "Listener")
		callback_type = "FirebaseRealTime_Listener";
	
	let myCallback = function(snapshot) 
	{
		let value = snapshot.val();
		if(!snapshot.exists())
		{
			GMS_API.send_async_event_social({
				type:callback_type,
				listener:listenerInd,
				path:fluent_obj._path,
				status:200,
				//value:
			});
			return;
		}

		let ret_value;
		switch(typeof  value)
		{
			case "number":
			case "string":
				ret_value = snapshot.val();
			break
			
			case "object":
				ret_value = JSON.stringify(snapshot.val());
			break
		}
		
		GMS_API.send_async_event_social({
			type:callback_type,
			listener:listenerInd,
			path:fluent_obj._path,
			status:200,
			value:ret_value
		});
	};
	
	let myErrorCallback = function(error)
	{
		let data = {
			type:callback_type,
			listener:listenerInd,
			path:fluent_obj._path
		};
		data = InsertStatusData(data,error);
		GMS_API.send_async_event_social(data);
	};
	
	if(fluent_obj._action == "Read")
		query.once('value',myCallback,myErrorCallback).catch(myErrorCallback);
	else
	if(fluent_obj._action == "Listener")
	{
		let id = query.on('value',myCallback,myErrorCallback);
		listenerToMaps(query,id,listenerInd);
	}
	return(listenerInd);
}

function YYRealTime_Exists(fluent_obj,callback)
{
	const listenerInd = getListenerInd();
	let ref = RealTime_makeRef(fluent_obj);
	ref.once('value',
		function(snapshot) 
		{
			let ret_value = 0;
			if(snapshot.exists())
				ret_value = 1;
			
			GMS_API.send_async_event_social({
				type:"FirebaseRealTime_Exists",
				listener:listenerInd,
				path:fluent_obj._path,
				status:200,
				value:ret_value
			});
		},
		function(error)
		{
			let data = {
				type:"FirebaseRealTime_Exists",
				listener:listenerInd,
				path:fluent_obj._path
			};
			data = InsertStatusData(data,error);
			GMS_API.send_async_event_social(data);
		}).catch(function(error)
		{
			console.log("Exists catch");
			let data = {
				type:"FirebaseRealTime_Exists",
				listener:listenerInd,
				path:fluent_obj._path
			};
			data = InsertStatusData(data,error);
			GMS_API.send_async_event_social(data);
		});
	return(listenerInd);
}

function YYRealTime_SetDelete(fluent_obj,callback)
{
	let ref = RealTime_makeRef(fluent_obj);
	const listenerInd = getListenerInd();
	ref.remove(function(error) 
	{
		let data = {
			type:"FirebaseRealTime_Delete",
			listener:listenerInd,
			path:fluent_obj._path
		};
		
		data = InsertStatusData(data,error);
		
		GMS_API.send_async_event_social(data);
	});
	return(listenerInd);
}

function YYRealTime_SetListenerRemove(fluent_obj)
{
	let ind = fluent_obj._value;
	let ref = listenerRefMap[ind.toString()]
	if(ref != undefined)
		ref.off("value",listenerIdMap[ind.toString()]);
	delete listenerRefMap[ind.toString()];
	delete listenerIdMap[ind.toString()];
}

function YYRealTime_SetListenerRemoveAll()
{
	for (let key in listenerRefMap) 
	{
		let ref = listenerRefMap[key]
		if(ref != undefined)
		ref.off("value",listenerIdMap[key]);
	}
	listenerRefMap = {};
	listenerIdMap = {};
}

function getListenerInd()
{
	indMap ++;
	return(indMap);
}

function listenerToMaps(reference,listenerId,ind)
{
	listenerRefMap[ind.toString()] = reference;
	listenerIdMap[ind.toString()] = listenerId;
}

//https://firebase.google.com/docs/reference/js/v8/firebase.functions.HttpsError#error
function InsertStatusData(obj,error)
{
	if(error == null)
	{
		obj.status = 200;
		return obj;
	}

	let http_status = 400;
	if(error.hasOwnProperty("message"))//if(error instanceof firebase.functions.HttpsError)
	{
		console.log(error.message);
		if(error.message.includes("EXPIRED_TOKEN"))
			http_status = 401;
		if(error.message.includes("INVALID_TOKEN"))
			http_status = 401;
		if(error.message.includes("PERMISSION_DENIED"))
			http_status = 401;
		if(error.message.includes("UNAVAILABLE"))
			http_status = 503;
		
		// switch(error.message)
		// {
			// case "DISCONNECTED": http_status = 400; break;
			// case "EXPIRED_TOKEN":http_status = 401; break;
			// case "INVALID_TOKEN": http_status = 401; break;
			// case "MAX_RETRIES": http_status = 400; break;
			// case "NETWORK_ERROR": http_status = 400; break;
			// case "OPERATION_FAILED": http_status = 400; break;
			// case "OVERRIDDEN_BY_SET": http_status = 400; break;
			// case "PERMISSION_DENIED": http_status = 401; break;
			// case "UNAVAILABLE": http_status = 503; break;
			// case "UNKNOWN_ERROR": http_status = 400; break;
			// case "USER_CODE_EXCEPTION": http_status = 400; break;
			// case "WRITE_CANCELED": http_status = 400; break;
		// }
	}

	obj.status = http_status;
	obj.errorMessage = error.message;
	
	return obj;
}


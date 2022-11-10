
function FirebaseRemoteConfig_Initialize(milisecs)//3600
{
	firebase.remoteConfig().settings.minimumFetchIntervalMillis = milisecs;
	firebase.remoteConfig().setLogLevel("silent");
}

function FirebaseRemoteConfig_FetchAndActivate()
{
	firebase.remoteConfig().fetchAndActivate().then(() => 
	{
		GMS_API.send_async_event_social({
								"type":"FirebaseRemoteConfig_FetchAndActivate",
								"success":1.0});
	}).catch((err) => 
	{
		GMS_API.send_async_event_social({
								"type":"FirebaseRemoteConfig_FetchAndActivate",
								"success":0.0});
	});
}

function FirebaseRemoteConfig_Reset()
{
	console.log("FirebaseRemoteConfig_Reset() not exists on Web....");
}

function FirebaseRemoteConfig_SetDefaultsAsync(json)
{
	firebase.remoteConfig().defaultConfig = JSON.parse(json);
	GMS_API.send_async_event_social({
							"type":"FirebaseRemoteConfig_setDefaultsAsync",
							"success":1.0});
}

function FirebaseRemoteConfig_GetKeys()
{
	return JSON.stringify(Object.keys(firebase.remoteConfig().getAll()));
}

function FirebaseRemoteConfig_GetString(key)
{
	return firebase.remoteConfig().getString(key);
}

function FirebaseRemoteConfig_GetDouble(key)
{
	return firebase.remoteConfig().getNumber(key);
}


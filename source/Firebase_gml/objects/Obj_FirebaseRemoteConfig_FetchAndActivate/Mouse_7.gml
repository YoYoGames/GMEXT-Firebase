/// @description Fetch+Activate keys

// This will force fetch all the keys from the server and activate them.
// Activate the keys mean that their value becomes valid for the application
// and using 'FirebaseRemoteConfig_GetString' and 'FirebaseRemoteConfig_GetDouble'
// will successfully return the remote value instead of the local one.
FirebaseRemoteConfig_FetchAndActivate();

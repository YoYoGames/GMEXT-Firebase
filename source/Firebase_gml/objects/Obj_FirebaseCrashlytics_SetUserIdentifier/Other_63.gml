/// @description Set userId

// Early exit if ids don't match
if (request != async_load[?"id"]) exit;

// Early exit if cancel button was pressed
if(!async_load[?"status"]) exit;

// Early exit if result value is empty string
if(async_load[?"result"] == "") exit;

var str = async_load[?"result"];

// This function records a user ID (identifier) that's associated with subsequent
// fatal and non-fatal reports. The user ID is visible in the session view on
// the Firebase Crashlytics console.
FirebaseCrashlytics_SetUserIdentifier(str)
request = noone;
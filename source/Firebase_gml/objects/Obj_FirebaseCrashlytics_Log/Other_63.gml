/// @description Attach log

// Early exit if ids don't match
if (request != async_load[?"id"]) exit;

// Early exit if cancel button was pressed
if(!async_load[?"status"]) exit;

// Early exit if result value is empty string
if(async_load[?"result"] == "") exit;

var str = async_load[?"result"];

// This function logs a message that's included in the next fatal or non-fatal report.
// Logs are visible in the session view on the Firebase Crashlytics console.
FirebaseCrashlytics_Log(str);
request = noone;

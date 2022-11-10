/// @description Set AutoReport

if (request != async_load[? "id"]) exit;

if (!async_load[? "status"]) exit;

var enabled = async_load[? "value"];

// This function will set the automatic crash collection. When crashlytics collection
// is enabled the crash reporst will be automatically sent to the Crashlytics servers.
// Setting it to false means we need to manually manage them.
FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(enabled);
request = noone;
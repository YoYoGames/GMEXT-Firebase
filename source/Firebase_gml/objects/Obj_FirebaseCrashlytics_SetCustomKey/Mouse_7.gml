/// @description Attach keys

// These function calls set custom key/value pairs that are associated with subsequent
// fatal and non-fatal reports. Multiple calls to this method with the same key
// update the value for that key.
FirebaseCrashlytics_SetCustomKey("data0", "YoYoGames");
FirebaseCrashlytics_SetCustomKey("data1", "Opera");
FirebaseCrashlytics_SetCustomKey("data2", 123456789);

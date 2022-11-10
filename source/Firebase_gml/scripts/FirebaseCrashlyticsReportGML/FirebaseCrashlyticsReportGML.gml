/// @description Initialize variables

// We will use the create event to override the "exception unhandle handler"
// and make it so all the exceptions that are thrown from within the GML
// context are trigger a custom method where we send information to the
// Firebase Crashlytics server.
exception_unhandled_handler(function(json_exception)
{
	// We gather all the information from the exception
	show_debug_message("Firebase Crashlytics Reporting To Server");
	var errorStr = "---------------------------- GML ERROR REPORT START ----------------------------------"
	errorStr += "\n\n"
	errorStr += string(json_exception)
	errorStr += "\n"
	errorStr += "-------------------------------- GML ERROR REPORT END -------------------------------"
	show_debug_message(errorStr);
	
	// We report the exception providing all the information we had on the
	// error being thrown. This function records a non-fatal report to send to Crashlytics.
	FirebaseCrashlytics_RecordException(errorStr);
});


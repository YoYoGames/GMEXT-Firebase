
// @triggered by FirebaseCrashlytics_UnsentReports_Check()
if(async_load[?"type"] == "FirebaseCrashlytics_UnsentReports_Check")
{
	// We just checked if there are any unsent reports the key 'value' will contain
	// either 1 or 0. If 1 there are unsent reporst otherwise there are no unsent reports
	//
	// NOTE: The value 1 is only returned ONCE per app execution.
	// You should either delete or send the reports from within this callback.
	show_debug_message("FirebaseCrashlytics_UnsentReports_Check: " + string(async_load[?"value"]))
	show_message_async(async_load[?"value"]);
}


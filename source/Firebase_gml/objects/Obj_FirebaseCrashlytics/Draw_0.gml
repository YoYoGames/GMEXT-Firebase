/// @description Draw information

// Set text draw properties
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(Font_YoYo_20)
draw_set_color(c_white)

// If we are on an iOS device
if (os_type == os_ios)
{
	// FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check will return wheter or not the
	// auto crash collection is enabled ot not (this function is only available on iOS)
	draw_text(50,100,"CrashlyticsCollectionEnabled_Check: " + string(FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check()))
}

// FirebaseCrashlytics_DidCrashOnPreviousExecution will return wheter or not the
// the game had a fatal crash on a previous execution.
draw_text(50,130,"DidCrashOnPreviousExecution: " + string(FirebaseCrashlytics_DidCrashOnPreviousExecution()))
/// @description Check reports

// Checks a device for any fatal or non-fatal crash reports that
// haven't yet been sent to Crashlytics. If automatic data collection is enabled,
// then reports are uploaded automatically and this always returns false.
// Triggers Async Social Event.
FirebaseCrashlytics_UnsentReports_Check()

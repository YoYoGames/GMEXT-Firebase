
initialized = firebase_analytics_initialize();

if (!initialized)
{
    show_debug_message("Analytics initialization failed");
    exit;
}

show_debug_message("Firebase Analytics ready");

// Windows only: 1 when google_analytics.dll was found beside the executable and loaded,
// 0 when Analytics is running as the SDK's stub (and always 0 on every other platform).
show_debug_message("Firebase Analytics desktop library loaded: " + string(firebase_analytics_is_desktop_initialized()));

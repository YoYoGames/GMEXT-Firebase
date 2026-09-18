
initialized = firebase_analytics_initialize();

if (!initialized)
{
    show_debug_message("Analytics initialization failed");
    exit;
}

show_debug_message("Firebase Analytics ready");

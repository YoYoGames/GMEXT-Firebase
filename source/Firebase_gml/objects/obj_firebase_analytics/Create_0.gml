
if (!firebase_analytics_initialize())
{
    show_debug_message("Analytics initialization failed");
    exit;
}

show_debug_message("Firebase Analytics ready");

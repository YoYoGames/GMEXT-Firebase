
if (!firebase_app_initialize())
{
    show_debug_message("Firebase init failed: " + firebase_last_error_message());
    exit;
}

show_debug_message("Firebase App: " + firebase_app_get_name());

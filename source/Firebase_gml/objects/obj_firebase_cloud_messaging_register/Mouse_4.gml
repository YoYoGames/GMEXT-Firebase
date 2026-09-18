// ------------------------------------------------------------
// CLOUD MESSAGING - REGISTER
// ------------------------------------------------------------

// The installation id does not come back here: the SDK delivers it through
// firebase_messaging_poll_registration(), polled in obj_firebase_cloud_messaging's
// Step event, also when this app instance was already registered.

var _result = firebase_messaging_register(
    function(_error, _message)
    {
        show_debug_message({
            error: _error,
            message: _message
        });
    }
);

if (_result != FirebaseError.Ok)
{
    show_debug_message($"[ERROR] {firebase_last_error_code()}: {firebase_last_error_message()}");
}

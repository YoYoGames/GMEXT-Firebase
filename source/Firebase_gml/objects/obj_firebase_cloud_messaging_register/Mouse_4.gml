// ------------------------------------------------------------
// CLOUD MESSAGING - REGISTER
// ------------------------------------------------------------

// The installation id does not come back here: the SDK delivers it through
// the registration callback obj_firebase_cloud_messaging sets with
// firebase_messaging_set_registration_callback(), also when this app
// instance was already registered.

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

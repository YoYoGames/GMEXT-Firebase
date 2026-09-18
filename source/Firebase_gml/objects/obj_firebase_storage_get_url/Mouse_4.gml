
if (image_ref != 0)
{
    show_debug_message("Get URL already running");
    exit;
}

var _storage = firebase_storage_get_instance();

// Kept alive until the callback: on desktop the SDK's retry thread reads the
// reference it was started on.
image_ref = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");

var _result = firebase_storage_ref_get_download_url(
    image_ref,
    function(_error, _message, _url)
    {
        if (_error != 0)
        {
            show_debug_message($"URL error: {_message}");
        }
        else
        {
            show_debug_message($"Download URL: {_url}");
        }

        firebase_storage_ref_release(image_ref);
        image_ref = 0;
    }
);

if (_result != FirebaseError.Ok)
{
    show_debug_message($"[ERROR] {firebase_last_error_code()}: {firebase_last_error_message()}");

    firebase_storage_ref_release(image_ref);
    image_ref = 0;
}

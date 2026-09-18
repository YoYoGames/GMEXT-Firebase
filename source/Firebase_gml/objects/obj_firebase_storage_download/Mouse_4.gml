
if (image_ref != 0)
{
    show_debug_message("Download already running");
    exit;
}

var _storage = firebase_storage_get_instance();

// Kept alive until the callback: on desktop the SDK's retry thread reads the
// reference it was started on.
image_ref = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");

show_debug_message(working_directory)
var _result = firebase_storage_ref_get_file(image_ref, working_directory + "downloaded_avatar.png",
    function(_paused, _downloaded, _total)
    {
        if (_total > 0)
        {
            var _percent = (_downloaded / _total) * 100;
            show_debug_message($"Download:{round(_percent)} %");
        }
    },
    0,
    function(_error, _message, _bytes_read)
    {
        if (_error != 0)
        {
            show_debug_message($"Download failed: {_message}");
        }
        else
        {
            show_debug_message($"Downloaded {_bytes_read} bytes");
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

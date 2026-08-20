
var _storage = firebase_storage_get_instance();
var _image = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");

show_debug_message(working_directory)
firebase_storage_ref_get_file(_image, working_directory + "downloaded_avatar.png",
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
            return;
        }

        show_debug_message($"Downloaded {_bytes_read} bytes");
    }
);


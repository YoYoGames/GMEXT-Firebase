
var _storage = firebase_storage_get_instance();
var _image = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");

firebase_storage_ref_get_download_url(
    _image,
    function(_error, _message, _url)
    {
        if (_error != 0)
        {
            show_debug_message($"URL error: {_message}");
            return;
        }

        show_debug_message($"Download URL: {_url}");
    }
);


if (image_ref != 0)
{
    show_debug_message("Upload already running");
    exit;
}

var _storage = firebase_storage_get_instance();

// Kept alive until the callback: on desktop the SDK's retry thread reads the
// reference it was started on.
image_ref = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");

var _result = firebase_storage_ref_put_file(
	    image_ref,
	    working_directory + "img_close.png",
	    0,          // no custom metadata
	    function(
	        _paused,
	        _bytes_transferred,
	        _total_bytes
	    )
	    {
	        if (_total_bytes > 0)
	        {
	            var _percent =
	                (_bytes_transferred / _total_bytes)
	                * 100;

	            show_debug_message(
	                "Upload: "
	                + string(_percent)
	                + "%"
	            );
	        }
	    },

	    0,          // no transfer controller

	    function(_error, _message, _metadata)
	    {
	        if (_error != 0)
	        {
	            show_debug_message(_message);
	        }
	        else
	        {
	            show_debug_message(
	                "Upload complete"
	            );

	            // The callback owns this returned
	            // metadata handle.
	            if (_metadata != 0)
	            {
	                firebase_storage_metadata_release(
	                    _metadata
	                );
	            }
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

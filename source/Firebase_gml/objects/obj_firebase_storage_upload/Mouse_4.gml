
var _storage = firebase_storage_get_instance();
var _image = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");	
	
firebase_storage_ref_put_file(
	    _image,
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
	            return;
	        }

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
	);


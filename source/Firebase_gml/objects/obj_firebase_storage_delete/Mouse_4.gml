
var _storage = firebase_storage_get_instance();
var _image = firebase_storage_get_reference_path(_storage,"players/USER_123/img_close.png");	
	
firebase_storage_ref_delete(_image,
	    function(_error, _message)
	    {
	        if (_error != 0)
	        {
	            show_debug_message("Delete failed: " + _message);
	            return;
	        }

	        show_debug_message("File deleted");
	    }
	);
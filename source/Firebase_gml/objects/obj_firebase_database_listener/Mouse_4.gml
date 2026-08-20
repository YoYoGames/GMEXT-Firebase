
if(!listening)
{
	value_listener = firebase_database_ref_add_value_listener(_ref,
	        function(_snapshot)
	        {
				var _info = firebase_database_snapshot_get_info(_snapshot);
				var _value = firebase_database_snapshot_get_value(_snapshot);
				show_debug_message($"Change Ref: {_info}");
				show_debug_message($"Change Value: {_value}");
				firebase_database_ref_release(_info.reference);
	        },
	        function(_error, _message)
	        {
	            show_debug_message("Listener error: " + _message);
	        }
	    );
}
else
{
	firebase_database_ref_remove_value_listener(_ref,value_listener);
}

listening = !listening

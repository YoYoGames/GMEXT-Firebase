event_inherited();

var _db = firebase_database_get_instance();
var _player_presence = firebase_database_get_reference_at_path(_db,"presence/user123");


firebase_database_ref_set_value(_player_presence, {online: true,connected: firebase_database_server_timestamp()}, function(error_code, error_message) {
		if (error_code != FirebaseDatabaseError.None) {
			show_debug_message($"Realtime DB: set_value failed ({error_code}) {error_message}");
			return;
		}
	});


var _disconnect = firebase_database_ref_on_disconnect(_player_presence);

firebase_database_on_disconnect_remove_value(
    _disconnect,
    function(_error, _message)
    {
        if (_error == 0)
        {
            show_debug_message(
                "Player will disappear on disconnect"
            );
        }
    }
);


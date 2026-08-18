
var _db = firebase_database_get_instance();
var _ref = firebase_database_get_reference_at_path(_db, "demo/set");
firebase_database_ref_get_value(_ref, function(error_code, error_message, snapshot_ref) {
	if (error_code == FirebaseDatabaseError.None) {
		var _info = firebase_database_snapshot_get_info(snapshot_ref);
		var _value = firebase_database_snapshot_get_value(snapshot_ref);
		show_debug_message($"firebase_database_snapshot_get_info: {_info}");
		show_debug_message($"Realtime DB: read back click_count = {_value.value}");
		firebase_database_ref_release(_info.reference);
	} else {
		show_debug_message($"Realtime DB: get_value failed ({error_code}) {error_message}");
	}
	firebase_database_snapshot_release(snapshot_ref);
});
firebase_database_ref_release(_ref);
	
	

var _db = firebase_database_get_instance();
var _ref = firebase_database_get_reference_at_path(_db, "demo/click_count");

// A transaction adds one to whatever the server holds, so clicks from every
// device add up. The update callback runs once per attempt: the first time on
// the client's own copy of the location - undefined when it has never read it -
// and again with the server's value when that differs. Commit inside the
// callback: the Realtime Database client is paused until the attempt ends.
var _result = firebase_database_ref_run_transaction(_ref, false, function(data) {
	var _count = firebase_database_mutable_data_get_value(data);
	if (!is_real(_count)) _count = 0;
	show_debug_message($"Realtime DB: transaction attempt sees click_count = {_count}");
	firebase_database_mutable_data_set_value(data, _count + 1);
	firebase_database_transaction_commit(data);
}, function(error_code, error_message, snapshot_ref) {
	if (error_code != FirebaseDatabaseError.None) {
		show_debug_message($"Realtime DB: transaction failed ({error_code}) {error_message}");
		return;
	}

	click_count = firebase_database_snapshot_get_value(snapshot_ref);
	show_debug_message($"Realtime DB: transaction committed click_count = {click_count}");
	firebase_database_snapshot_release(snapshot_ref);
});

if (_result != FirebaseError.Ok) {
	show_debug_message($"Realtime DB: run_transaction failed ({_result}) {firebase_last_error_message()}");
}

firebase_database_ref_release(_ref);

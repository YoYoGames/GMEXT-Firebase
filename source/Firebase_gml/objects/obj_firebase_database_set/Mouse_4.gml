
firebase_database_ref_set_value(_ref, _value, function(error_code, error_message) {
		if (error_code != FirebaseDatabaseError.None) {
			show_debug_message($"Realtime DB: set_value failed ({error_code}) {error_message}");
			return;
		}
	});


//firebase_database_ref_set_value(_ref, [1,2,3,4,{k1:"v1",k2:{a: true,b: false},k3:[1,2,3]}], function(error_code, error_message) {
//		if (error_code != FirebaseDatabaseError.None) {
//			show_debug_message($"Realtime DB: set_value failed ({error_code}) {error_message}");
//			return;
//		}
//	});


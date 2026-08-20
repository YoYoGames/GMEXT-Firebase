
if(listening)
	firebase_database_ref_remove_value_listener(_ref,value_listener);
firebase_database_ref_release(_ref);

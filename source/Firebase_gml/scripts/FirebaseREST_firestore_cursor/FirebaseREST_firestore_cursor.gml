function FirebaseREST_firestore_cursor(_value, _before) {
	// https://firebase.google.com/docs/firestore/reference/rest/v1/StructuredQuery#Cursor
	_value = [ _value ];
	_value = __firebase_firestore_process_value(_value);
	_value.before = _before ? "true" : "false"; 
	return _value;
}

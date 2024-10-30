
/// @params {Struct.FirebaseFirestoreBuilder} _builder
/// @params {Struct} _json
function RESTFirebaseFirestore_Collection_Add(_builder, _json) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	var _body = __firebase_firestore_build_body(_json);
	
	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Collection_Add", Obj_FirebaseREST_Listener_Once_Firestore, _url, "POST", _header, _body);
	listener.path = _builder.build_path();
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Collection_Read(_builder) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	
	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Collection_Read", Obj_FirebaseREST_Listener_Once_Firestore, _url, "GET", _header);
	listener.path = _builder.build_path();
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Collection_Listener(_builder) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();

	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Collection_Listener", Obj_FirebaseREST_Listener_On_firestore_collection, _url, "GET", _header);
			
	listener.path = _builder.build_path();
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Collection_Query(_builder) {
	
	/// @function _direction_enum_to_string(_direction)
	/// @returns {String}
	static _direction_enum_to_string = function(_direction) {
		switch (_direction) {
			case FIREBASE_FIRESTORE_QUERY_SORT.ASCN:
				return "ASCENDING";
			case FIREBASE_FIRESTORE_QUERY_SORT.DESC:
				return "DESCENDING";
		}
	}
	
	/// @function _filter_enum_to_string(_filter)
	/// @returns {String}
	static _filter_enum_to_string = function(_filter) {
		switch (_filter) {
			case FIREBASE_FIRESTORE_QUERY_FILTER.LESS:
				return "LESS_THAN";
			case FIREBASE_FIRESTORE_QUERY_FILTER.LESS_EQ:
				return "LESS_THAN_OR_EQUAL";
			case FIREBASE_FIRESTORE_QUERY_FILTER.GREAT:
				return "GREATER_THAN";
			case FIREBASE_FIRESTORE_QUERY_FILTER.GREAT_EQ:
				return "GREATER_THAN_OR_EQUAL";
			case FIREBASE_FIRESTORE_QUERY_FILTER.EQ:
				return "EQUAL";
			case FIREBASE_FIRESTORE_QUERY_FILTER.NOT_EQ:
				return "NOT_EQUAL";
		}
	}
	
	with (_builder) {
		var _private = __;
		
		// https://firebase.google.com/docs/firestore/reference/rest/v1/StructuredQuery

		var _structured_query = {};

		/////////////////

		//From
		
		_structured_query.from = [ {
				collectionId: _builder.path_array[array_length(_builder.path_array) - 1],
				allDescendants: "false"		
		} ];
	
		// Where
		
		var _operations = _private.operations;
		var _operations_count = array_length(_operations);
		if (_operations_count > 0) {
			var _filters = array_create(_operations_count);
			for (var _i = 0 ; _i < _operations_count; _i++)
			{
				var _operation =  _operations[_i];
				var fieldFilter = {
					field: __firebase_firestore_build_field_reference(_operation.path),
					op: _filter_enum_to_string(_operation.operation),
					value: __firebase_firestore_process_value(_operation.value)
				}
				_filters[_i] = { fieldFilter: fieldFilter };
			}

			var _composite_filter = { op: "AND", filters: _filters };
			_structured_query.where = { compositeFilter: _composite_filter };
		}

		// orderBy
	
		if (!is_undefined(_private.sort) and !is_undefined(_private.orderBy))
		{
			_structured_query.orderBy = [ 
				{ 
					field: __firebase_firestore_build_field_reference(_private.orderBy), 
					direction: _direction_enum_to_string(_private.sort) 
				}
			];
		}
	
		// startAt

		if (!is_undefined(_private.startAt)) {
			_structured_query.startAt = __firebase_firestore_build_cursor(_private.startAt, true);
		} else if (!is_undefined(_private.startAfter)) {
			_structured_query.startAt = __firebase_firestore_build_cursor(_private.startAfter, false);
		}

		// endAt
		
		if (!is_undefined(_private.endAt)) {
			_structured_query.endAt = __firebase_firestore_build_cursor(_private.endAt, false);
		} else if (!is_undefined(_private.endBefore)) {
			_structured_query.endAt = __firebase_firestore_build_cursor(_private.endBefore, true);
		}

		// limit 
		
		if (!is_undefined(_private.limitToFirst)) {
			_structured_query.limit = _private.limitToFirst;
		}
			
		// request
		
		_private.path = string_join_ext("/", _builder.path_array, 0, array_length(_builder.path_array) - 1);
		
		var _url = __firebase_firestore_build_url(_builder);
		var _header = __firebase_firestore_build_header();
		var _body = json_stringify({ structuredQuery: _structured_query });

		_url = string_concat(_url, ":runQuery");

		var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Collection_Query", Obj_FirebaseREST_Listener_Once_Firestore, _url, "POST", _header, _body);
		listener.path = _builder.build_path();

		return listener;
	}

}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Document_Delete(_builder) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	
	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Document_Delete", Obj_FirebaseREST_Listener_Once_Firestore, _url, "DELETE", _header);
	listener.path = _builder.build_path();
	
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Document_Read(_builder) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	
	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Document_Read", Obj_FirebaseREST_Listener_Once_Firestore, _url, "GET", _header);
	listener.path = _builder.build_path();

	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
function RESTFirebaseFirestore_Document_Listener(_builder) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	
	var listener = FirebaseREST_asyncFunction_Firestore("FirebaseFirestore_Document_Listener", Obj_FirebaseREST_Listener_On_firestore_document, _url, "GET", _header);
	listener.path = _builder.build_path();
	
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
/// @params {Struct} _json
function RESTFirebaseFirestore_Document_Set(_builder, _json) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	var _body = __firebase_firestore_build_body(_json);
	
	var listener = FirebaseREST_asyncFunction_Firestore("RESTFirebaseFirestore_Document_Set", Obj_FirebaseREST_Listener_Once_Firestore, _url, "PATCH", _header, _body);
	listener.path = _builder.build_path();
	
	return listener;
}

/// @params {Struct.FirebaseFirestoreBuilder} _builder
/// @params {Struct} _json
function RESTFirebaseFirestore_Document_Update(_builder, _json) {
	
	var _url = __firebase_firestore_build_url(_builder);
	var _header = __firebase_firestore_build_header();
	var _body = __firebase_firestore_build_body(_json);
	
	_url = __firebase_firestore_build_update_mask_url(_url, _json);
	
	var listener = FirebaseREST_asyncFunction_Firestore("RESTFirebaseFirestore_Document_Update", Obj_FirebaseREST_Listener_Once_Firestore, _url, "PATCH", _header, _body);
	listener.path = _builder.build_path();
	
	return listener;
}

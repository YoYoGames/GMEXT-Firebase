
// feather ignore GM2017

#macro FIREBASE_FIRESTORE_END_POINT "https://firestore.googleapis.com/v1/projects/"

/// @description Cache the SDK usage option
function __firebase_firestore_should_use_sdk() {

	static _is_sdk_platform = function() { return os_type == os_android || os_type == os_ios || os_browser != browser_not_a_browser; }
	static _mode = extension_get_option_value("YYFirebaseFirestore", "mode");
	
	static _use_sdk = _mode == "SDKs Only" || (_mode == "SDKs When Available" && _is_sdk_platform());
						
	return _use_sdk;
}

/// @param {Struct.FirebaseFirestoreBuilder} _builder
/// @returns {String}
/// @pure
function __firebase_firestore_build_url(_builder) {

	static _default_url = extension_get_option_value("YYFirebaseFirestore", "projectId");

	with (_builder) {
		var _private = __;
		var _database = _private.database;
		var _path = _private.path;
		
		return string_concat(FIREBASE_FIRESTORE_END_POINT, _default_url, "/databases/", _database, "/documents/", _path);
	}
}

/// @returns {String}  
/// @pure
function __firebase_firestore_build_header() {
	
	var _header = {};
	
	if (asset_get_index("RESTFirebaseAuthentication_GetIdToken") != -1) {
	if (RESTFirebaseAuthentication_GetIdToken() != "")
		_header[$ "Authorization"] = string_concat("Bearer ", RESTFirebaseAuthentication_GetIdToken());
	}
	_header[$ "Content-Type"] = "application/json";

	return json_stringify(_header);
}

/// @returns {String}  
/// @pure
function __firebase_firestore_build_body(_struct) {
	// This body will always be a struct (and needs to be stringified)
	var _body = __firebase_firestore_process_value(_struct);
	return json_stringify(_body);
}

/// @returns {Struct}
/// @pure
function __firebase_firestore_build_cursor(_value, _before) {
	// https://firebase.google.com/docs/firestore/reference/rest/v1/StructuredQuery#Cursor
	var _cursor = __firebase_firestore_process_value([ _value ]);
	_cursor.before = _before ? "true" : "false"; 
	return _cursor;
}

/// @returns {Struct}
/// @pure
function __firebase_firestore_process_value(_value) {
	// https://firebase.google.com/docs/firestore/reference/rest/v1/Value
	switch (typeof(_value)) {
		case "number":
			// Store integer if number is integer
			if (frac(_value) == 0) {
				return { integerValue: string(int64(_value)) };
			}
			return { doubleValue: _value };
		case "string":
			return { stringValue: _value };
		case "bool":
			return { booleanValue: _value };
		case "int32":
		case "int64":
		case "ptr":
			return { integerValue: string(int64(_value)) };
		case "undefined":
		case "null":
			return { nullValue: pointer_null };
		case "array":
			var _length = array_length(_value);
			var _output_array = array_create(_length);
			for (var _i = 0; _i < _length; _i++) {
				_output_array[_i] = __firebase_firestore_process_value(_value[_i]);
			}
			return { values: _output_array };
		case "struct":
			var _names = struct_get_names(_value);
			var _count = array_length(_names);
			var _output_struct = { };
			for (var _i = 0; _i < _count; _i++) {
				var _name = _names[_i];
				_output_struct[$ _name] = __firebase_firestore_process_value(_value[$ _name]);
			}
			return { fields: _output_struct };
		case "method":
		case "ref":
			return { stringValue: string(_value) };
		default:
			return { stringValue: string(_value) };
	}
}

/// @returns {Array<String>}
/// @pure
function __firebase_firestore_flatten_struct_paths(_struct, _parent_key = "") {
    var _paths = [];
	var _paths_count = 0;
	
	var _keys = variable_struct_get_names(_struct);
	var _count = array_length(_keys);
	for (var _i = 0; _i < _count; _i++) {
		var _key = _keys[_i];
		var _new_key = (_parent_key != "") ? string_concat(_parent_key, ".", _key) : _key;
		
		var _value = _struct[$ _key];
		if (is_struct(_value)) {
			var _nested_keys = __firebase_firestore_flatten_struct_paths(_value, _new_key);
			var _nested_keys_count = array_length(_nested_keys);
			array_copy(_paths, _paths_count, _nested_keys, 0, _nested_keys_count);
			_paths_count += _nested_keys_count;
		}
		else {
			_paths[_paths_count] = _new_key;
			_paths_count++;
		}
	}
	
    return _paths;
}


function __firebase_firestore_build_field_reference(_field) 
{
	// https://firebase.google.com/docs/firestore/reference/rest/v1/StructuredQuery#fieldreference
	return { fieldPath: _field }
}


/// @param {String} _url
/// @param {Struct} _json
/// @returns {String}
function __firebase_firestore_build_update_mask_url(_url, _json) {
	var _paths_array = __firebase_firestore_flatten_struct_paths(_json);
	var _update_mask = string_join_ext("&updateMask.fieldPaths=", _paths_array);
	return string_concat(_url, "?updateMask.fieldPaths=", _update_mask);
}

function FirebaseFirestore(_path = undefined, _database = "(default)") {
	return new FirebaseFirestoreBuilder(_path, _database)
}

function FirebaseFirestoreBuilder(_path, _database) constructor {
	
	enum FIREBASE_FIRESTORE_QUERY_FILTER {
		LESS = 0,
		LESS_EQ,
		GREAT,
		GREAT_EQ,
		EQ,
		NOT_EQ,
	}
	
	enum FIREBASE_FIRESTORE_QUERY_SORT {
		ASCN = 0,
		DESC
	}
	
	enum FIREBASE_FIRESTORE_ACTION {
		ADD = 0,
		SET = 1,
		UPDATE = 2,
		READ = 3,
		LISTENER = 4,
		DELETE = 5,
		QUERY = 6,
		LISTENER_REMOVE = 7,
		LISTERER_REMOVE_ALL = 8,
	}
	
	#region PRIVATE
	
	/// @ignore
	__ = {
		database: _database,
		path: undefined,
		operations: [],
	
		orderBy: undefined,
		sort: FIREBASE_FIRESTORE_QUERY_SORT.ASCN,
	
		startAt: undefined,
		startAfter: undefined,
		endAt: undefined,
		endBefore: undefined,
		limitToFirst: undefined,
		limitToLast: undefined,
	
		action: undefined,
		value: undefined,
		
		isDocument: false
	}
	
	/// @ignore
	path_array = string_split(_path, "/", true);
	
	/// @function is_document()
	/// @returns {Bool}
	/// @ignore
	static is_document = function() {
		return (array_length(path_array) mod 2) == 0;
	}
	
	/// @function build_path()
	/// @returns {String}
	/// @ignore
	static build_path = function() {
		return string_join_ext("/", path_array);
	}
	
	/// @function process_value(value)
	/// @returns {Any}
	/// @ignore
	static process_value = function(_value) {
		if (is_string(_value)) {
			try {
				return json_parse(_value);
			}
			catch (_ex) {
				show_debug_message($"Firestore: Illegal type collection add ({typeof(_value)})");
			}
		}
		else if (is_handle(_value) && string_starts_with(string(_value),"ref ds_map"))
		{
			return json_parse(json_encode(_value));
		}
		
		return _value;
	}
	
	#endregion
	
	#region BUILDER
	
	/// @function Child(child_path)
	/// @param {string} _child_path
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Child = function(_child_path) {
		array_push(path_array, _child_path);
		return self;
	}
	
	/// @function Parent()
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Parent = function() {
		array_pop(path_array);
		return self;
	}
		
	/// @function OrderBy(path)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static OrderBy = function(_path, _sort = FIREBASE_FIRESTORE_QUERY_SORT.ASCN) {
		__.orderBy = _path
		__.sort = _sort;
		return self;
	}
	
	/// @function Where(path, op, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Where = function(_path, _op, _value) {
		array_push(__.operations, { operation: _op, path: _path, value: _value });
		return self;
	}

	/// @function WhereEqual(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereEqual = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.EQ, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereGreaterThan(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereGreaterThan = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.GREAT, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereGreaterThanOrEqual(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereGreaterThanOrEqual = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.GREAT_EQ, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereLessThan(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereLessThan = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.LESS, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereLessThanOrEqual(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereLessThanOrEqual = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.LESS_EQ, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereNotEqual(path, value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static WhereNotEqual = function(_path, _value) {
		array_push(__.operations, { operation: FIREBASE_FIRESTORE_QUERY_FILTER.NOT_EQ, path: _path, value: _value });
		return self;
	}
	
	/// @function StartAt(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static StartAt = function(_value) {
		__.startAt = _value;
		__.startAfter = undefined;
		return self;
    }
	
	/// @function StartAfter(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static StartAfter = function(_value) {
		__.startAfter = _value;
		__.startAt = undefined;
		return self;
    }
	
	/// @function EndAt(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static EndAt = function(_value) {
		__.endAt = _value;
		__.endBefore = undefined;
		return self;
    }

	/// @function EndBefore(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static EndBefore = function(_value) {
		__.endBefore = _value;
		__.endAt = undefined;
		return self;
    }
	
	/// @function Limit(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Limit = function(_value) {
		__.limitToFirst = _value;
		__.limitToLast = undefined;
		return self;
    }
	
	/// @function LimitToLast(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static LimitToLast = function(_value) {
		__.limitToLast = _value;
		__.limitToFirst = undefined;
		return self;
    }
	
	#endregion
	
	#region ACTIONS
		
	/// @function Set(value)
	/// @param {String|Id.DsMap} value
	/// @returns {Real}
    static Set = function(_value) {
		if (!is_document()) {
			return Add(_value);
		}
			
		_value = process_value(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Set :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.SET;
		__.value = _value;
		__.path = build_path();
		__.isDocument = is_document();
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Document_Set(self, _value)
    }
	
	/// @function Add(value)
	/// @param {String|Id.DsMap} value
	/// @returns {Real}
    static Add = function(_value) {
		
		if (is_document()) {
			show_debug_message("Firestore: You can't add to a document");
			return -1;
		}
		
		_value = process_value(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Add :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.ADD;
		__.value = _value;
		__.path = build_path();
		__.isDocument = is_document();
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Collection_Add(self, _value)
    }
	
	/// @function Update(value)
	/// @param {String|Id.DsMap} value
	/// @returns {Real}
    static Update = function(_value) {

		if (!is_document()) {
			show_debug_message("Firestore: You can't update a collection");
			return -1;
		}
		
		_value = process_value(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Set :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.UPDATE;
		__.path = build_path();
		__.isDocument = is_document();
		
		__.value = _value;
		
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Document_Update(self, _value)
    }
	
	/// @function Read()
	/// @returns {Real}
    static Read = function() {

		__.action = FIREBASE_FIRESTORE_ACTION.READ;
		__.path = build_path();
		__.isDocument = is_document();
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		if(is_document()) {
			return RESTFirebaseFirestore_Document_Read(self)
		}
		
		return RESTFirebaseFirestore_Collection_Read(self);
    }
	
	/// @function Query()
	/// @returns {Real}
	static Query = function() {
		
		if (is_document()) {
			show_debug_message("Firestore: You can't query documents");
			return -1;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.QUERY;
		__.path = build_path();
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}

		return RESTFirebaseFirestore_Collection_Query(self);
	}
	
	/// @function Listener()
	/// @returns {Real}
    static Listener = function() {

		__.action = FIREBASE_FIRESTORE_ACTION.LISTENER;	
		__.path = build_path();	
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		if(is_document())
			return RESTFirebaseFirestore_Document_Listener(self)
		
		return RESTFirebaseFirestore_Collection_Listener(self)
    }
	
	/// @function Listen()
	/// @returns {Real}
	static Listen = function() {
		return Listener();
	};
	
	/// @function Delete()
	/// @returns {Real}
	static Delete = function() {

		if (!is_document()) {
			show_debug_message("Firestore: You can't delete a collection");
			return -1;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.DELETE;
		__.path = build_path();
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}

		return RESTFirebaseFirestore_Document_Delete(self);
    }
	
	/// @function ListenerRemove()
	/// @returns {Real}
	static ListenerRemove = function(_listener) {
		
		__.action = FIREBASE_FIRESTORE_ACTION.LISTENER_REMOVE;
		__.value = _listener
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		with(_listener) {
		    instance_destroy()
		}
	}
	
	/// @function ListenerRemoveAll()
	/// @returns {Real}
	static ListenerRemoveAll = function() {
		
		__.action = FIREBASE_FIRESTORE_ACTION.LISTERER_REMOVE_ALL;
		
		if(__firebase_firestore_should_use_sdk()) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		with(Obj_FirebaseREST_Listener_Firestore) {
			if(string_count("Listener", event)) {
				instance_destroy()
			}
		}
	}
		
	#endregion

}

function FirebaseFirestore_Listener_Refresh(_id) {
	with(_id) {
		alarm[0] = -1;
		event_perform(ev_alarm, 0);
	}
}

function FirebaseFirestore_Listener_SetErrorCountLimit(_id, _value) {
	_id.errorCountLimit = _value;
}

function FirebaseFirestore_Listener_SetErrorResetSteps(_id, _value) {
	_id.errorResetAlarm = _value;
}

function FirebaseFirestore_Listener_SetRefreshSteps(_id, _value) {
	_id.refreshCall = _value;
}


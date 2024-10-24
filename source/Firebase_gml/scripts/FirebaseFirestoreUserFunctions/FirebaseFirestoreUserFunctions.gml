
#macro FirebaseFirestore_Library_useSDK ((extension_get_option_value("YYFirebaseFirestore","Config") == "SDKs_When_Available" and (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)) or extension_get_option_value("YYFirebaseFirestore","Config") == "SDKs_Only")

function FirebaseFirestore(_path = undefined) {
	return new FirebaseFirestoreBuilder(_path)
}

function FirebaseFirestoreBuilder(_path) constructor {
	
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
	pathArray = string_split(_path, "/", true);
	
	/// @function IsDocument()
	/// @returns {Bool}
	/// @ignore
	static IsDocument = function() {
		return (array_length(pathArray) mod 2) == 0;
	}
	
	/// @function BuildPath()
	/// @returns {String}
	/// @ignore
	static BuildPath = function() {
		return string_join_ext("/", pathArray);
	}
	
	/// @function ProcessValue(value)
	/// @returns {Any}
	/// @ignore
	static ProcessValue = function(_value) {
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
		array_push(pathArray, _child_path);
		return self;
	}
	
	/// @function Parent()
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Parent = function() {
		array_pop(pathArray);
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
	static EndBefore = function(_value)
    {
		__.endBefore = _value;
		__.endAt = undefined;
		return self;
    }
	
	/// @function Limit(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static Limit = function(_value)
    {
		__.limitToFirst = _value;
		__.limitToLast = undefined;
		return self;
    }
	
	/// @function LimitToLast(value)
	/// @returns {Struct.FirebaseFirestoreBuilder}
	static LimitToLast = function(_value)
    {
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
		__.isDocument = IsDocument();
		if (!__.isDocument) {
			return Add(_value);
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.SET;
		
		_value = ProcessValue(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Set :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.value = _value;
		__.path = BuildPath();
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Document_Set(__.path, _value)
    }
	
	/// @function Add(value)
	/// @param {String|Id.DsMap} value
	/// @returns {Real}
    static Add = function(_value) {
		__.action = FIREBASE_FIRESTORE_ACTION.ADD;
		__.isDocument = IsDocument();
		if (__.isDocument) {
			show_debug_message("Firestore: You can't add to a document");
			return -1;
		}
		
		_value = ProcessValue(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Add :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.value = _value;
		__.path = BuildPath();
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Collection_Add(__.path,_value)
    }
	
	/// @function Update(value)
	/// @param {String|Id.DsMap} value
	/// @returns {Real}
    static Update = function(_value) {
		__.isDocument = IsDocument();
		if (!__.isDocument) {
			show_debug_message("Firestore: You can't update a collection");
			return -1;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.UPDATE;
		
		_value = ProcessValue(_value);
		if (!is_struct(_value)) {
			show_debug_message($"Firestore.Set :: Illegal value type: ({typeof(_value)})");
			return -2;
		}
		
		__.value = _value;
		__.path = BuildPath();
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		return RESTFirebaseFirestore_Document_Update(__.path,_value)
    }
	
	/// @function Read()
	/// @returns {Real}
    static Read = function() {
		__.isDocument = IsDocument();
		__.path = BuildPath();
		__.action = FIREBASE_FIRESTORE_ACTION.READ;
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		if(__.isDocument) {
			return RESTFirebaseFirestore_Document_Read(__.path)
		}
		else {
			return RESTFirebaseFirestore_Collection_Read(__.path)
		}
    }
	
	/// @function Query()
	/// @returns {Real}
	static Query = function() {
		
		if (IsDocument()) {
			show_debug_message("Firestore: You can't query documents");
			return -1;
		}
		
		__.path = BuildPath();
		__.action = FIREBASE_FIRESTORE_ACTION.QUERY;
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}

		return RESTFirebaseFirestore_Collection_Query(self);
	}
	
	/// @function Listener()
	/// @returns {Real}
    static Listener = function() {
		__.isDocument = IsDocument();
		__.path = BuildPath();
		__.action = FIREBASE_FIRESTORE_ACTION.LISTENER;		
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		if(__.isDocument)
			return RESTFirebaseFirestore_Document_Listener(__.path)
		else
			return RESTFirebaseFirestore_Collection_Listener(__.path)
    }
	
	/// @function Listen()
	/// @returns {Real}
	static Listen = function() {
		return Listener();
	};
	
	/// @function Delete()
	/// @returns {Real}
	static Delete = function() {
		__.isDocument = IsDocument();
		if (!__.isDocument) {
			show_debug_message("Firestore: You can't delete a collection");
			return -1;
		}
		
		__.action = FIREBASE_FIRESTORE_ACTION.DELETE;
		__.path = BuildPath();
		
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}

		return RESTFirebaseFirestore_Document_Delete(__.path);
    }
	
	/// @function ListenerRemove()
	/// @returns {Real}
	static ListenerRemove = function(_listener) {
		__.action = FIREBASE_FIRESTORE_ACTION.LISTENER_REMOVE;
				
		__.value = _listener
		
		if(FirebaseFirestore_Library_useSDK) {
			return FirebaseFirestore_SDK(json_stringify(__));
		}
		
		with(_listener)
		    instance_destroy()
	}
	
	/// @function ListenerRemoveAll()
	/// @returns {Real}
	static ListenerRemoveAll = function() {
		__.action = FIREBASE_FIRESTORE_ACTION.LISTERER_REMOVE_ALL;
		
		if(FirebaseFirestore_Library_useSDK) {
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


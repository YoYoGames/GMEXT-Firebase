
#macro FirebaseFirestore_Library_useSDK ((extension_get_option_value("YYFirebaseFirestore","Config") == "SDKs_When_Available" and (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)) or extension_get_option_value("YYFirebaseFirestore","Config") == "SDKs_Only")
#macro Firestore_Query_less_than "LESS_THAN"
#macro Firestore_Query_less_than_or_equal "LESS_THAN_OR_EQUAL"
#macro Firestore_Query_greater_than "GREATER_THAN"
#macro Firestore_Query_greater_than_or_equal "GREATER_THAN_OR_EQUAL"
#macro Firestore_Query_equal "EQUAL"
#macro Firestore_Query_not_equal "NOT_EQUAL"
#macro Firestore_Query_ASCENDING "ASCENDING"
#macro Firestore_Query_DESCENDING "DESCENDING"

function FirebaseFirestore(path = undefined)
{
	return new FirebaseFirestoreBuilder(path)
}

function FirebaseFirestore_updatedPath(path)
{
	if(is_undefined(path))
	{
		__.isDocument = 0.0//false
		__.isCollection = 0.0//false
	}	
	else if(FirebaseREST_Firestore_path_isDocument(path))
	{
		__.isDocument = 1.0//true
		__.isCollection = 0.0//false
	}
	else
	{
		__.isDocument = 0.0//false
		__.isCollection = 1.0//true
	}
}

function FirebaseFirestoreBuilder(_path) constructor
{
	__ = {
		path: _path,
	
		operations: [],
	
		orderBy: undefined,
		orderDirection: undefined,
	
		startAt: undefined,
		startAfter: undefined,
		endAt: undefined,
		endBefore: undefined,
		limitToFirst: undefined,
		limitToLast: undefined,
	
		action: "",
		value: undefined,
	}
	
	FirebaseFirestore_updatedPath(_path)
	
	/// @function Child(child_path)
	static Child = function(_child_path)
	{
		__.path = FirebaseFirestore_Path_Join(__.path, _child_path)
		FirebaseFirestore_updatedPath(__.path)
		
		return self
	}
	
	/// @function Parent()
	static Parent = function()
	{
		__.path = FirebaseFirestore_Path_Back(__.path, 1);
		return self
	}
		
	/// @function OrderBy(path)
	static OrderBy = function(_path, _direction = 0)
	{
		__.orderBy = _path
		__.orderDirection = _direction;

		return self;
	}
	
	/// @function Where(path, op, value)
	static Where = function(_path, _op, _value) 
	{	
		_op = FirebaseFirestore_operationFromSymbol(_op);
			
		array_push(__.operations, { operation: _op, path: _path, value: _value });
		return self;
	}

	/// @function WhereEqual(path, value)
	static WhereEqual = function(_path, _value)
	{
		array_push(__.operations, { operation: Firestore_Query_equal, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereGreaterThan(path, value)
	static WhereGreaterThan = function(_path, _value)
	{
		array_push(__.operations, { operation: Firestore_Query_greater_than, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereGreaterThanOrEqual(path, value)
	static WhereGreaterThanOrEqual = function(_path, _value)
	{
		array_push(__.operations,{ operation: Firestore_Query_greater_than_or_equal, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereLessThan(path, value)
	static WhereLessThan = function(_path, _value)
	{
		array_push(__.operations, { operation: Firestore_Query_less_than_or_equal, path: _path, value: _value });
		return self;
	}
	
	/// @function WhereLessThanOrEqual(path, value)
	static WhereLessThanOrEqual = function(_path, _value)
	{
		array_push(__.operations, { operation: Firestore_Query_equal, path: _path, value: _value }):
		return self;
	}
	
	/// @function WhereNotEqual(path, value)
	static WhereNotEqual = function(_path, _value)
	{
		array_push(__.operations, { operation: Firestore_Query_not_equal, path: _path, value: _value });
		return self;
	}
	
	/// @function Start(value)
	static Start = function(_value)
    {
		__.startAt = _value;
		__.startAfter = undefined;
		return self;
    }
	
	/// @function StartAfter(value)
	static StartAfter = function(_value)
    {
		__.startAfter = _value;
		__.startAt = undefined;
		return self;
    }
	
	/// @function End(value)
	static End = function(_value)
    {
		__.endAt = _value;
		__.endBefore = undefined;
		return self;
    }

	/// @function EndBefore(value)
	static EndBefore = function(_value)
    {
		__.endBefore = _value;
		__.endAt = undefined;
		return self;
    }
	
	/// @function Limit(value)
	static Limit = function(_value)
    {
		__.limitToFirst = _value;
		__.limitToLast = undefined;
		return self;
    }
	
	/// @function LimitToLast(value)
	static LimitToLast = function(_value)
    {
		__.limitToLast = _value;
		__.limitToFirst = undefined;
		return self;
    }
	
	//Actions
	
	/// @function Set(value)
    static Set = function(_value)
    {
		__.action = "Set"
		
		if (is_handle(_value) && string_starts_with(string(_value),"ref ds_map"))
		{
			_value = json_parse(json_encode(_value))
		}
		else if(!is_struct(_value) && !is_array(_value))
		{
			show_debug_message($"Firestore: type error Set({typeof(_value)})");
			exit;
		}
		
		__.value = _value;
		
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		if(FirebaseREST_Firestore_path_isDocument(_path))
			return RESTFirebaseFirestore_Document_Set(_path,_value)
		else
			return RESTFirebaseFirestore_Collection_Add(_path,_value)
    }
	
	/// @function Update(value)
    static Update = function(_value)
    {
		__.action = "Update"
		
		if (is_handle(_value) && string_starts_with(string(_value),"ref ds_map"))
		{
			_value = json_parse(json_encode(_value))
		}
		else if(!is_struct(_value) && !is_array(_value))
		{
			show_debug_message($"Firestore: type error Set({typeof(_value)})");
			exit;
		}
		
		__.value = _value;
		
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		if(FirebaseREST_Firestore_path_isDocument(_path))
			return RESTFirebaseFirestore_Document_Update(_path,_value)
		else
		{
			show_debug_message("Firestore: You can't update a Collection")
			exit
		}
    }
	
	/// @function Read()
    static Read = function()
    {
		__.action = "Read"
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		if(FirebaseREST_Firestore_path_isDocument(_path))
			return RESTFirebaseFirestore_Document_Read(_path)
		else
			return RESTFirebaseFirestore_Collection_Read(_path)
    }
	
	/// @function Query()
	static Query = function()
	{
		__.action = "Query"
		if(FirebaseFirestore_Library_useSDK)
		{
			return FirebaseFirestore_SDK(json_stringify(__))
		}
		if(FirebaseREST_Firestore_path_isCollection(_path))
			return RESTFirebaseFirestore_Collection_Query(self)
		else
			show_debug_message("Firestore: You can't query documents")
	}
	
	/// @function Listener()
    static Listener = function()
    {
		__.action = "Listener"
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		if(FirebaseREST_Firestore_path_isDocument(_path))
			return RESTFirebaseFirestore_Document_Listener(_path)
		else
			return RESTFirebaseFirestore_Collection_Listener(_path)
    }
	
	/// @function Delete()
	static Delete = function()
    {
		__.action = "Delete"
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		if(FirebaseREST_Firestore_path_isDocument(_path))
			return RESTFirebaseFirestore_Document_Delete(_path)
		else
		{
			show_debug_message("Firestore: You can't delete a Collection")
			exit
		}
    }
	
	static ListenerRemove = function(listener)
	{
		__.action = "ListenerRemove"
		__.value = listener
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		with(listener)
		    instance_destroy()
	}
	
	static ListenerRemoveAll = function()
	{
		__.action = "ListenerRemoveAll"
		if(FirebaseFirestore_Library_useSDK)
			return FirebaseFirestore_SDK(json_stringify(__))
		with(Obj_FirebaseREST_Listener_Firestore)
		if(string_count("Listener",event))
			instance_destroy()
	}
}


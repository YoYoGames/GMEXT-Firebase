
#macro FirebaseRealTime_Library_useSDK ((extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_When_Available" and (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)) or extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_Only")

#macro Firebase_OrderBy_Child 0
#macro Firebase_OrderBy_Key 1
#macro Firebase_OrderBy_Value 2
#macro Firebase_Filter_StartAt 0
#macro Firebase_Filter_EndAt 1
#macro Firebase_Filter_EqualTo 2
#macro Firebase_LimitTo_First 0
#macro Firebase_LimitTo_Last 1

function FirebaseRealTime(_database = undefined)
{
	return new FirebaseRealTimeBuilder(_database)
}

function FirebaseRealTimeBuilder(_database) constructor
{
	enum FIREBASE_DATABASE_ACTION {
		SET = 0,
		READ = 1,
		LISTENER = 2,
		EXISTS = 3,
		DELETE = 4,
		LISTENER_REMOVE = 5,
		LISTERER_REMOVE_ALL = 6,
	}
	
	__ = {
		push: undefined,
		path: "",
		orderBy: undefined,
		
		equalTo: undefined,
		startAt: undefined,
		startAfter: undefined,
		endAt: undefined,
		endBefore: undefined,
		
		limitToFirst: undefined,
		limitToLast: undefined,
		
		database: _database,
		action: "",
		value: undefined,
		priority: undefined,
	};
	
	/// @function Path(child_path)
	static Path = function(path)
	{
		__.path = path;
		return self
	}
	
	/// @function Child(child_path)
	static Child = function(_child_path)
	{
		__.path = FirebaseRealTime_Path_Join(__.path, _child_path);
		return self
	}
	
	/// @function Parent(child_path)
	static Parent = function()
	{
		__.path = FirebaseRealTime_Path_Back(_path, 1);
		return self
	}
	
	/// @function Push(child_path)
	static Push = function()
	{
		__.push = true;
		return self
	}

	/// @function OrderByKey(child_path)
	static OrderByKey = function()
    {
		__.orderBy = "$key";
		return self
    }
	
	/// @function OrderByValue(child_path)
	static OrderByValue = function()
    {
		__.orderBy = "$value";
		return self
    }
	
	/// @function OrderByPriority(child_path)
	static OrderByPriority = function()
    {
		__.orderBy = "$priority";
		return self
    }
	
	/// @function OrderByChild(child_path)
	static OrderByChild = function(_path)
    {
		__.orderBy = _path;
		return self
    }
	
	/// @function EqualTo(child_path)
	static EqualTo = function(_equal_to)
    {
		__.equalTo = _equal_to;
		return self
    }
	
	/// @function StartAt(child_path)
	static StartAt = function(_start_at)
    {
		__.startAt = _start_at;
		__.startAfter = undefined;
		return self
    }
	
	/// @function StartAfter(child_path)
	static StartAfter = function(_start_after)
    {
		__.startAfter = _start_after;
		__.startAt = undefined;
		return self
    }
	
	/// @function EndAt(child_path)
	static EndAt = function(_end_at)
    {
		__.endAt = _end_at
		__.endBefore = undefined;
		return self
    }
	
	/// @function EndBefore(child_path)
	static EndBefore = function(_end_before)
    {
		__.endBefore = _end_before
		__.endAt = undefined;
		return self
    }
		
	/// @function LimitToLast(child_path)
	static LimitToLast = function(_count)
	{
		__.limitToLast = _count;
		__.limitToFirst = undefined;
		return self
	}
	
	/// @function LimitToFirst(child_path)
	static LimitToFirst = function(_count)
	{
		__.limitToFirst = _count;
		__.limitToLast = undefined;
		return self
	}
	
	//Actions

    static Set = function(_value, _priority = undefined, _try_parse = true)
    {
		__.action = FIREBASE_DATABASE_ACTION.SET;
		
		if (is_string(_value) && _try_parse)
		{
			try {
				_value = json_parse(_value);
			}
			catch (_e) {}
		}
		else if (is_handle(_value)) {
			var _handle_type = string(_value);
			if (string_starts_with(_handle_type, "ref ds_map")) {
				_value = json_parse(json_encode(_value));
			}
			else if (string_starts_with(_handle_type, "ref ds_list")) {
				var _map = ds_map_create();
				ds_map_add_list(_map, "list", _value);
				var _struct = json_parse(json_encode(_map));
				ds_map_delete(_map, "list");
				ds_map_destroy(_map);
				_value = _struct.list;
			}
			else {
				_value = _handle_type;
			}
		}
		
		__.value = _value;
		__.priority = _priority;
		
		var listener = undefined

		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__));
				
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Set",
						Obj_FirebaseREST_Listener_Once_RealTime,
						FirebaseREST_RealTime_getURL(_path,_database),
						FirebaseREST_RealTime_getWriteHTTPMethod(_push),
						"{}",
						__.value
					)
		listener.path = __.path
		
	
		return listener
    }
	
    static Read = function()
    {
		__.action = FIREBASE_DATABASE_ACTION.READ;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Read",Obj_FirebaseREST_Listener_Once_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }
	
    static Listener = function()
    {
		__.action = FIREBASE_DATABASE_ACTION.LISTENER;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Listener",Obj_FirebaseREST_Listener_On_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }

    static Exists = function()
    {
		__.action = FIREBASE_DATABASE_ACTION.EXISTS;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Exists",
						Obj_FirebaseREST_Listener_Once_RealTime,
						FirebaseREST_RealTime_getURL(_path,_database),
						"GET",
						"{}",
						""
					)
	
		listener.path = _path

		return(listener)
    }
	
	static Delete = function()
    {
		__.action = FIREBASE_DATABASE_ACTION.DELETE;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Delete",
						Obj_FirebaseREST_Listener_Once_RealTime,
						FirebaseREST_RealTime_getURL(_path,_database),
						"DELETE",
						"{}",
						""
					)
	
		listener.path = _path
		return listener;
    }
	
    static ListenerRemove = function(_listener)
    {
		__.action = FIREBASE_DATABASE_ACTION.LISTENER_REMOVE;
		
		__.value = _listener;
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(_listener)
		    instance_destroy()
    }
	
    static ListenerRemoveAll = function()
    {
		__.action = FIREBASE_DATABASE_ACTION.LISTERER_REMOVE_ALL;
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(Obj_FirebaseREST_Listener_RealTime) {
			if(string_count("Listener", event))
				instance_destroy()
		}
    }
}


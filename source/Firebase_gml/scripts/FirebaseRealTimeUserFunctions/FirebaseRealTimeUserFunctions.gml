
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
	__ = {
		push: undefined,
		path: "",
		order_by: undefined,
		
		equal_to: undefined,
		start_at: undefined,
		start_after: undefined,
		end_at: undefined,
		end_before: undefined,
		
		limit: undefined,
		
		database: _database,
		action: "",
		value: undefined,
	};
	
	static Path = function(path)
	{
		__.path = path;
		return self
	}
	
	static Child = function(_child_path)
	{
		__.path = FirebaseRealTime_Path_Join(__.path, _child_path);
		return self
	}
	
	static Parent = function()
	{
		__.path = FirebaseRealTime_Path_Back(_path, 1);
		return self
	}
	
	static Push = function()
	{
		__.push = true;
		return self
	}
	
	static OrderByValue = function()
    {
		__.order_by = { value: pointer_null }
		return self
    }
	
	static OrderByKey = function()
    {
		__.order_by = { key: pointer_null }
		return self
    }
	
	static OrderByChild = function(_path)
    {
		__.order_by = { child: _path };
		return self
    }
	
	static EqualTo = function(_equal_to)
    {
		__.equal_to = _equal_to;
		return self
    }
	
	static StartAt = function(_start_at)
    {
		__.start_at = _start_at
		return self
    }
	
	static StartAfter = function(_start_after)
    {
		__.start_after = _start_after
		return self
    }
	
	static EndAt = function(_end_at)
    {
		__.end_at = _end_at
		return self
    }
	
	static EndBefore = function(_end_before)
    {
		__.end_before = _end_before
		return self
    }
		
	static LimitToLast = function(_count)
	{
		__.limit = { last: _count };
		return self
	}
	
	static LimitToFirst = function(_count)
	{
		__.limit = { first: _count };
		return self
	}
	
	//Actions

    static Set = function(_value, _try_parse = true)
    {
		__.action = "Set"
		
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
		
		var listener = undefined

		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__));
				
		var listener = FirebaseREST_asyncFunction_RealTime(
						"FirebaseRealTime_Set",
						Obj_FirebaseREST_Listener_Once_RealTime,
						FirebaseREST_RealTime_getURL(_path,_database),
						FirebaseREST_RealTime_getWriteHTTPMethod(_push),
						"{}",
						value
					)
		listener.path = __.path
		
	
		return listener
    }
	
    static Read = function()
    {
		__.action = "Read"
		show_debug_message(json_stringify(__));
		
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Read",Obj_FirebaseREST_Listener_Once_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }
	
    static Listener = function()
    {
		__.action = "Listener"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Listener",Obj_FirebaseREST_Listener_On_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }

    static Exists = function()
    {
		__.action = "Exists"
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
		__.action = "Delete"
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
		__.value = _listener
		__.action = "ListenerRemove"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(_listener)
		    instance_destroy()
    }
	
    static ListenerRemoveAll = function()
    {
		__.action = "ListenerRemoveAll"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(__))
		with(Obj_FirebaseREST_Listener_RealTime) {
			if(string_count("Listener", event))
				instance_destroy()
		}
    }
}


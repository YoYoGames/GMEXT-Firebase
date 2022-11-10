
#macro FirebaseRealTime_Library_useSDK ((extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_When_Available" and (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)) or extension_get_option_value("YYFirebaseRealTime","Config") == "SDKs_Only")

#macro Firebase_OrderBy_Child 0
#macro Firebase_OrderBy_Key 1
#macro Firebase_OrderBy_Value 2
#macro Firebase_Filter_StartAt 0
#macro Firebase_Filter_EndAt 1
#macro Firebase_Filter_EqualTo 2
#macro Firebase_LimitTo_First 0
#macro Firebase_LimitTo_Last 1

function FirebaseRealTime(database = undefined)
{
	return new Firebase_RealTime_builder(database)
}

function Firebase_RealTime_builder(database) constructor
{
	_push = undefined;
	_path = ""
	
	_OrderBy = undefined
	_EqualTo = undefined
	_StartValue = undefined
	_EndValue = undefined
	_LimitKind = undefined
	_LimitValue = undefined
	_database = database

	_action = ""
	_value = undefined
	
	static Path = function(path)
	{
		_path = path
		return self
	}
	
	static Child = function(child_path)
	{
		_path = FirebaseRealTime_Path_Join(_path,child_path)
		return self
	}
	
	static Parent = function()
	{
		_path = FirebaseRealTime_Path_Back(_path,1)
		return self
	}
	
	static Push = function()
	{
		_push = true
		return self
	}
	
	static OrderByValue = function()
    {
		_OrderBy = Firebase_OrderBy_Value
		return self
    }
	
	static OrderByKey = function()
    {
		_OrderBy = Firebase_OrderBy_Key
		return self
    }
	
	static OrderByChild = function(path)
    {
		_OrderBy = path//Firebase_OrderBy_Child
		return self
    }
	
	static EqualTo = function(EqualTo)
    {
		_EqualTo = EqualTo
		return self
    }
	
	static StartAt = function(StartValue)
    {
		_StartValue = StartValue
		return self
    }
	
	static EndAt = function(EndValue)
    {
		_EndValue = EndValue
		return self
    }
	
	//static Limit = function(LimitKind,LimitValue)
    //{
	//	_LimitKind = LimitKind
	//	_LimitValue = LimitValue
	//	return self
    //}
	
	static LimitToLast = function(LimitValue)
	{
		_LimitKind = Firebase_LimitTo_Last
		_LimitValue = LimitValue
		return self
	}
	
	static LimitToFirst = function(LimitValue)
	{
		_LimitKind = Firebase_LimitTo_First
		_LimitValue = LimitValue
		return self
	}
	
	//Actions

    static Set = function(value)
    {
		_action = "Set"
		_value = value
		
		var ok = false
		if(is_real(value))
		{
			ok = true
			value = string(value)
		}
		else
		if(is_struct(value))
			ok = true
		else
		if(is_string(value))
		{
			var map = json_decode(value)
			var value_ = json_encode(map)
			ds_map_destroy(map)
		
			if(!string_count("default",value) and string_count("default",value_))
			{
				ok = true
				value = "\"" + value + "\""
			}
			else
				ok = true
		}
	
		var listener = undefined
		if(ok)
		{
			if(FirebaseRealTime_Library_useSDK)
				return FirebaseRealTime_SDK(json_stringify(self))
			var listener = FirebaseREST_asyncFunction_RealTime(
							"FirebaseRealTime_Set",
							Obj_FirebaseREST_Listener_Once_RealTime,
							FirebaseREST_RealTime_getURL(_path,_database),
							FirebaseREST_RealTime_getWriteHTTPMethod(_push),
							"{}",
							value
						)
			listener.path = _path
		}
	
		return listener
    }
	
    static Read = function()
    {
		_action = "Read"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Read",Obj_FirebaseREST_Listener_Once_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }
	
    static Listener = function()
    {
		_action = "Listener"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
		return FirebaseRealTime_List_Builder("FirebaseRealTime_Listener",Obj_FirebaseREST_Listener_On_RealTime,_path,_OrderBy,_EqualTo,_StartValue,_EndValue,_LimitKind,_LimitValue,_database)
    }

    static Exists = function()
    {
		_action = "Exists"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
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
		_action = "Delete"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
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
	
    static ListenerRemove = function(listener)
    {
		_value = listener
		_action = "ListenerRemove"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
		with(listener)
		    instance_destroy()
    }
	
    static ListenerRemoveAll = function()
    {
		_action = "ListenerRemoveAll"
		if(FirebaseRealTime_Library_useSDK)
			return FirebaseRealTime_SDK(json_stringify(self))
		with(Obj_FirebaseREST_Listener_RealTime)
		if(string_count("Listener",event))
			instance_destroy()
    }
}


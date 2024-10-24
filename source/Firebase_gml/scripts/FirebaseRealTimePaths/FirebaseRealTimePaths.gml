
function FirebaseRealTime_Path_Join()
{
	var path = argument[0]
	for(var a = 1 ; a < argument_count ; a ++)
		path = FirebaseRealTime_Path_Join_Pair(path,argument[a])
	
	return path
}

function FirebaseRealTime_Path_GetName(_path, _offset) {
	var _array = FirebaseRealTime_Path_ToArray(_path)
	var _name = _array[array_length(_array) - _offset - 1];

	return _name
}

function FirebaseRealTime_Path_ToArray(_path)
{	
	return string_split(_path, "/");
}

function FirebaseRealTime_Path_Back(_path, _count)
{
	var _array = FirebaseRealTime_Path_ToArray(_path)
	repeat(_count) array_pop(_array);
	
	return string_join("/", _array);
}


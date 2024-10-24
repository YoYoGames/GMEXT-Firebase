function FirebaseREST_RealTime_getURL(_path, _database)
{
	var _url;
	if(is_undefined(_database)) {
		static _default_url = extension_get_option_value("YYFirebaseRealTime", "DatabaseURL");
		_url = _default_url;
	}
	else {
		_url = _database
	}
	
	var _delimiter = string_ends_with(_url, "/") ? "" : "/"

	_url =  string_join(_delimiter, _url, _path)
		
	static _auth_function_index = asset_get_index("RESTFirebaseAuthentication_GetIdToken")
	if (_auth_function_index == -1) {
		_url += ".json"
	}
	else {
		var _auth_token_id = RESTFirebaseAuthentication_GetIdToken();
		_url += _auth_token_id == "" ? ".json" : (".json?auth=" + _auth_token_id);
	}
	
	return _url;
}

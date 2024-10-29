

// feather ignore GM2017
// feather ignore GM1035

/// @description Cache the SDK usage option
function __firebase_functions_should_use_sdk() {

	static _is_sdk_platform = function() { return os_type == os_android || os_type == os_ios || os_browser != browser_not_a_browser; }
	static _mode = extension_get_option_value("YYFirebaseCloudFunctions", "mode");
	
	static _use_sdk = _mode == "SDKs Only" || (_mode == "SDKs When Available" && _is_sdk_platform());
						
	return _use_sdk;
}

function __firebase_function_build_url(_func_name) {
	
	static _base_url = extension_get_option_value("YYFirebaseCloudFunctions", "serverUrl");
	
	return string_concat(_base_url, "/", _func_name);
}

/// @params {String} _func_name
/// @params {Any} _params
/// @params {Real} _timeout
function FirebaseCloudFunctions_Call(_func_name, _params, _timeout = 0) {
	
	if (__firebase_functions_should_use_sdk()) {
		return SDKFirebaseCloudFunctions_Call(_func_name, json_stringify(_params), _timeout);
	}
	
	var _url = __firebase_function_build_url(_func_name);
	var _header_map = ds_map_create();
	_header_map[? "Content-Type"] = "application/json";
	
	var _id = http_request(_url, "POST", _header_map, json_stringify(_params));
		
	return instance_create_depth(0, 0, 0, FirebaseREST_asyncCall_Functions, {
		type: "FirebaseCloudFunctions_Call",
		request_id: _id,
		func_name: _func_name,
		timeout: _timeout
	});
}
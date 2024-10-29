

// feather ignore GM2017

/// @description Cache the SDK usage option
function __firebase_functions_should_use_sdk() {

	static _is_sdk_platform = function() { return os_type == os_android || os_type == os_ios || os_browser != browser_not_a_browser; }
	static _mode = extension_get_option_value("YYFirebaseCloudFunctions", "mode");
	
	static _use_sdk = _mode == "SDKs Only" || (_mode == "SDKs When Available" && _is_sdk_platform());
						
	return _use_sdk;
}

function FirebaseCloudFunctions_Call(_function, _params, _timeout = 0) {
	
	if (__firebase_functions_should_use_sdk()) {
		return SDKFirebaseCloudFunctions_Call(_function, _params, _timeout);
	}
	
	return 
	
}
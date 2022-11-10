
//TODO::FIX obfuscated internal calls...
//debug() ds_list_, ds_map_ functions... etc...

//+Instead of returning graph request data in user-created ds_maps, we should trigger Social Async events for consistency with other extensions/APIs.
//-to which functions does this apply? facebook_dialog, facebook_graph_request, facebook_login 




// -----------------------------------------
var GMS2_FB_EXTENSION = true;   //

// State
var FBEXT_STATE_IDLE = "IDLE";
var FBEXT_STATE_PROCESSING = "PROCESSING";
var FBEXT_STATE_AUTHORISED = "AUTHORISED";
var FBEXT_STATE_FAILED = "FAILED";

// App Events (re-defined from extension macros)
var FacebookExtension2_EVENT_ACHIEVED_LEVEL = 			101;
var FacebookExtension2_EVENT_ADDED_PAYMENT_INFO = 		102;
var FacebookExtension2_EVENT_ADDED_TO_CART = 			103;
var FacebookExtension2_EVENT_ADDED_TO_WISHLIST = 		104;
var FacebookExtension2_EVENT_COMPLETED_REGISTRATION = 	105;
var FacebookExtension2_EVENT_COMPLETED_TUTORIAL = 		106;
var FacebookExtension2_EVENT_INITIATED_CHECKOUT = 		107;
var FacebookExtension2_EVENT_RATED = 					109;
var FacebookExtension2_EVENT_SEARCHED = 				110;
var FacebookExtension2_EVENT_SPENT_CREDITS = 			111;
var FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT = 	112;
var FacebookExtension2_EVENT_VIEWED_CONTENT = 			113;

// App event parameters (re-defined from extension macros)
var FacebookExtension2_PARAM_CONTENT_ID = 				1003;
var FacebookExtension2_PARAM_CONTENT_TYPE = 			1004;
var FacebookExtension2_PARAM_CURRENCY = 				1005;
var FacebookExtension2_PARAM_DESCRIPTION = 				1006;
var FacebookExtension2_PARAM_LEVEL = 					1007;
var FacebookExtension2_PARAM_MAX_RATING_VALUE = 		1008;
var FacebookExtension2_PARAM_NUM_ITEMS = 				1009;
var FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE = 	1010;
var FacebookExtension2_PARAM_REGISTRATION_METHOD = 		1011;
var FacebookExtension2_PARAM_SEARCH_STRING = 			1012;
var FacebookExtension2_PARAM_SUCCESS = 					1013;

// Globals
var g_fbExtPermissions = [];
var g_fbExtPermissionsRequested;
var g_fbExtRequestId = 0;
var g_fbExtOAuthToken = "";
var g_fbExtAppId = undefined;
var g_fbExtUserId = "";
var g_fbExtLoginStatus = FBEXT_STATE_IDLE;

var g_fbExtInitCalled = false;
var g_FB_SDKReady = false;

//extension init function - load the facebook sdk
function fb_init()
{
	if(!g_fbExtInitCalled)
	{
		if( typeof( GMS_API ) == "undefined" )
		{
			//TODO::ideally output minimum runtime version required
			alert("Facebook extension is not supported in current Runtime\nUpdate your Runtime to use this extension");
			return;
		}
		
		var appId = GMS_API.get_facebook_app_id();
		if( appId == undefined || appId == "" )
		{
			alert("Facebook AppID has not been defined\nEnsure 'Use Facebook' is checked in HTML5 Game Options");
			return;
		}
		
		FBExt_FBInit( appId );
		g_fbExtInitCalled = true;
	}
}

function FBExt_FBInit(appid) {

    var root = document.getElementById("canvas");
    var pParent = root.parentNode;
    var div = document.createElement("div");
    div.setAttribute("id", "fb-root");
    pParent.insertBefore(div, root.nextSibling);

    g_fbExtAppId = appid;
    window.fbAsyncInit = FBExt_FBASyncInit;

    FBExt_LoadFBSDK(document);
}

function FBExt_LoadFBSDK(d) {
    var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement('script');
    js.id = id;
    js.async = true;

    //js.src = "https://connect.facebook.net/en_US/sdk/debug.js";	
	js.src = "https://connect.facebook.net/en_US/sdk.js";
    ref.parentNode.insertBefore(js, ref);
}

var fbext_json_obj = {
    appId: 0, // App ID
    status: true, // check login status
    cookie: true, // enable cookies to allow the server to access the session
    xfbml: true, //,  // parse XFBML
	version    : 'v3.0'
};

function FBExt_FBASyncInit()
{
    fbext_json_obj.appId = g_fbExtAppId;
    FB.init(fbext_json_obj);
    g_FB_SDKReady = true;	//sdk has loaded
	
	// Update app version
	if(GMS_API)
	{
		var appVersion = GMS_API.get_app_version_string(); 
		FB.AppEvents.setAppVersion(appVersion);
	}

	// Log page view
    FB.AppEvents.logPageView();
	
    FB.Canvas.setAutoGrow(100);
	g_fbExtLoginStatus = FBEXT_STATE_IDLE;
}

function FBExt_HandleFBLogin(requestId, requestedPermissions, response) 
{
	//fill response map 
	var map = {};
	map["type"] = "facebook_login_result";
	map["requestId"] = requestId;
	
	if(response.status == "connected" && response.authResponse)
	{
		// Login successful
		map["status"] = "success";
		
		// Update ext details
		g_fbExtUserId = response.authResponse.userID;
        g_fbExtOAuthToken = response.authResponse.accessToken;
        g_fbExtLoginStatus = FBEXT_STATE_AUTHORISED;
		
		// Granted scopes
		var grantedPermissionsArray = null;
		if(response.authResponse.grantedScopes)
		{
			grantedPermissionsArray = response.authResponse.grantedScopes.split(',');
			g_fbExtPermissions = grantedPermissionsArray;
			
			var permIdx;
			var permLength = g_fbExtPermissions.length;
			
			for(permIdx = 0; permIdx < permLength; ++permIdx)
			{
				map[g_fbExtPermissions[permIdx]] = "granted";
			}
		}
		
		// Declined scopes
		if(requestedPermissions)
		{
			var requestedPermsArray = requestedPermissions.split(',');
			permLength = requestedPermsArray.length;
			
			for(permIdx = 0; permIdx < permLength; ++permIdx)
			{
				if(!grantedPermissionsArray || grantedPermissionsArray.indexOf(requestedPermsArray[permIdx]) == -1)
					map[requestedPermsArray[permIdx]] = "declined";
			}
		}
	}
	else if(response.status == "not_authorized")
	{
		// Login cancelled
		map["status"] = "cancelled";
        g_fbExtLoginStatus = FBEXT_STATE_IDLE;
	}
	else
	{
		// Error
		map["status"] = "error";
		 g_fbExtLoginStatus = FBEXT_STATE_FAILED;
		 
		if(response.error_message)
			map["exception"] = response.error_message;
		else
			map["exception"] = "Unknown error.";
		
	}
	
	// Send async social map to runner
	GMS_API.send_async_event_social(map);
}

function fbQueryPermissions()
{
    FB.api( '/me/permissions', function (response) 
    {
        GMS_API.debug_msg("fbQueryPermissions response:");
        try{
            var text = JSON.stringify(response);
            GMS_API.debug_msg( text );
        }catch( e ){}
        
        g_fbExtPermissions = [];
        var data = response["data"];
        if( data != undefined )
        {
            var length = data.length;
			for (var i = 0; i < length; i++) 
			{
				var item = data[i];
				var perm = item["permission"];
				var status = item["status"];
				if( perm != undefined && status == "granted" )
				{
				    g_fbExtPermissions.push( perm );
				}
			}
        }
        GMS_API.debug_msg( "current permissions: " + g_fbExtPermissions );
    });
}

function FBExt_CheckSDKReady( _funcname )
{
	if(!g_FB_SDKReady )
		GMS_API.debug_msg( _funcname + ": facebook SDK is not ready");
	return g_FB_SDKReady;
}

//API ------------------------------------------------
function facebook_test(_arg0)
{
	GMS_API.debug_msg("api test!");
}

function fb_accesstoken() {
	if( !FBExt_CheckSDKReady( "fb_accesstoken" )) return "";
    return g_fbExtOAuthToken;
}


function fb_ready()
{
	return g_FB_SDKReady;
}

function fb_status() {
	if( !FBExt_CheckSDKReady( "fb_status" )) return "";
	return g_fbExtLoginStatus;
}

function fb_logout() {
	if( !FBExt_CheckSDKReady( "fb_logout" )) return 0;
	
    GMS_API.debug_msg("facebook_logout");
    FB.logout(function(response) {
        if( response.status != 'connected')
        {
            g_fbExtLoginStatus = FBEXT_STATE_IDLE;
            g_fbExtUserId = "";
            g_fbExtOAuthToken = "";
        }
    });
 	return 1;
}

function fb_user_id() {

    if( !FBExt_CheckSDKReady( "fb_user_id" )) return "0";
	
	if (typeof (g_fbExtUserId) == "undefined")
        return "0";
        
    return g_fbExtUserId;
}


function fb_login(_permissions) {

    if( !FBExt_CheckSDKReady( "fb_login" )) return 0;
	
    //If we're on spotify we don't have an FB...
    if (typeof (FB) == 'undefined') {
        GMS_API.debug_msg("Facebook initialisation has not completed");
        return;
    }
    
    //extract permissions from _permissions list
    g_fbExtLoginStatus = FBEXT_STATE_PROCESSING;
	var currentRequestId = g_fbExtRequestId++;
  
    var len = 0;
    var perms = '';
    if (_permissions >= 0) {
        len = GMS_API.ds_list_size(_permissions);
        for (var i = 0; i < len; i++) {
            var str = GMS_API.ds_list_find_value(_permissions, i);
            perms += str;
            if (i < len - 1) {
                perms += ',';
            }
        }

        FB.login(FBExt_HandleFBLogin.bind(null, currentRequestId, perms), { scope: perms, return_scopes: true });
    }
    else {
        FB.login(FBExt_HandleFBLogin.bind(null, currentRequestId, null), { return_scopes: true });
    }
	
    return currentRequestId;
}

function fb_check_permission(_permission)
{
    if( !FBExt_CheckSDKReady( "fb_check_permission" )) return false;
	if( g_fbExtLoginStatus != FBEXT_STATE_AUTHORISED ) return false;
    return (g_fbExtPermissions.indexOf(_permission) != -1);
}

function fb_request_read_permissions(_dsList )
{
    if( !FBExt_CheckSDKReady( "fb_request_read_permissions" )) return 0;
	return fbRequestPermissions( _dsList );
}

function fb_request_publish_permissions(_dsList)
{
    if( !FBExt_CheckSDKReady( "fb_request_publish_permissions" )) return 0;
	return fbRequestPermissions( _dsList );
}

function fbRequestPermissions( _dsList )
{
    var requestId = g_fbExtRequestId++;  
	
    //make comma separated list of permissions to request
    var perms = '';
    if (_dsList >= 0) 
    {
        var len = GMS_API.ds_list_size(_dsList);
        for (var i = 0; i < len; i++) 
        {
            var str = GMS_API.ds_list_find_value(_dsList, i);
            perms += str;
            if (i < len - 1) {
                perms += ',';
            }
        }
    }
    
    var fbPermissionsRequested = perms.split(','); 
    GMS_API.debug_msg("Requesting permissions:" + perms);
    
    //permissions request is just another call to FB.login...
    FB.login(FBExt_HandleFBLogin.bind(null, requestId, perms), 
    {
       scope: perms,
       return_scopes: true 
    });
    
    return requestId;
}


function fb_graph_request(_graphPath, _httpVerb, _dsMapParams ) 
{
    if( !FBExt_CheckSDKReady( "fb_graph_request" )) return 0;
	
	//convert params dsmap to object
	var jsonString = GMS_API.json_encode( _dsMapParams );
	var obj = JSON.parse( jsonString );

	++g_fbExtRequestId;
    var requestId = g_fbExtRequestId;   
	
    FB.api(_graphPath, _httpVerb, obj, function(data)
	{
		var map = {};
		map["type"] = "fb_graph_request";
		map["requestId"] = requestId;
		
		if(data.error)
		{
			// Request failed
			map["status"] = "error";
			map["exception"] = data.error.message;
		}
		else
		{
			// Request successful
			map["status"] = "success";
			map["response_text"] = JSON.stringify(data);
		}
		
		GMS_API.send_async_event_social( map );
	
	});
	
	return requestId;
}

//show open graph share dialog
function fb_dialog(_link)
{
	if( !FBExt_CheckSDKReady( "fb_dialog" )) return 0;
	
	++g_fbExtRequestId;
    var requestId = g_fbExtRequestId;   
	
	FB.ui(
		{
			method: 'feed',
			link: _link
		}, 
		function(_response)
		{
			var map = {};
			map["type"] = "fb_dialog";
			map["requestId"] = requestId;
			
			if(!_response || _response.error_code == 4201)
			{
				// Cancelled
				map["status"] = "cancelled";
			}
			else if( _response.error_message)
			{
				// Error
				map["status"] = "error";
				map["exception"] = _response.error_message;
			}
			else
			{
				// Success
				map["status"] = "success";
			}

			GMS_API.send_async_event_social( map );
		}
	);
	
	return requestId;
}

function fb_refresh_accesstoken()
{
	if( !FBExt_CheckSDKReady( "fb_refresh_accesstoken" )) return 0;
	return 1;
}

function fb_send_event( _event, _valueToSum, _parametersDsList )
{
	if( !FBExt_CheckSDKReady( "fb_send_event" )) return 0;
	
	// Parse event type
	var eventTypeParsed = null;
	switch(_event)
	{
		case FacebookExtension2_EVENT_ACHIEVED_LEVEL: 			eventTypeParsed = FB.AppEvents.EventNames.ACHIEVED_LEVEL; break;
		case FacebookExtension2_EVENT_ADDED_PAYMENT_INFO: 		eventTypeParsed = FB.AppEvents.EventNames.ADDED_PAYMENT_INFO; break;
		case FacebookExtension2_EVENT_ADDED_TO_CART: 			eventTypeParsed = FB.AppEvents.EventNames.ADDED_TO_CART; break;
		case FacebookExtension2_EVENT_ADDED_TO_WISHLIST: 		eventTypeParsed = FB.AppEvents.EventNames.ADDED_TO_WISHLIST; break;
		case FacebookExtension2_EVENT_COMPLETED_REGISTRATION: 	eventTypeParsed = FB.AppEvents.EventNames.COMPLETED_REGISTRATION; break;
		case FacebookExtension2_EVENT_COMPLETED_TUTORIAL: 		eventTypeParsed = FB.AppEvents.EventNames.COMPLETED_TUTORIAL; break;
		case FacebookExtension2_EVENT_INITIATED_CHECKOUT: 		eventTypeParsed = FB.AppEvents.EventNames.INITIATED_CHECKOUT; break;
		case FacebookExtension2_EVENT_RATED: 					eventTypeParsed = FB.AppEvents.EventNames.RATED; break;
		case FacebookExtension2_EVENT_SEARCHED: 				eventTypeParsed = FB.AppEvents.EventNames.SEARCHED; break;
		case FacebookExtension2_EVENT_SPENT_CREDITS: 			eventTypeParsed = FB.AppEvents.EventNames.SPENT_CREDITS; break;
		case FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT: 	eventTypeParsed = FB.AppEvents.EventNames.UNLOCKED_ACHIEVEMENT; break;
		case FacebookExtension2_EVENT_VIEWED_CONTENT: 			eventTypeParsed = FB.AppEvents.EventNames.VIEWED_CONTENT; break;
		
		default: 
			GMS_API.debug_msg( "Invalid event type passed to fb_send_event data: " + _event); 
			return 0;
	}
	
	// Parse params list to JSON
	var paramsJson = {}
	if (_parametersDsList >= 0) 
	{
		// Check if the list contains key/value pairs
        var len = GMS_API.ds_list_size(_parametersDsList);
		if(len >= 2 && len % 2 == 0)
		{
			for (var i = 0; i < len; i += 2) 
			{
				var paramKey = GMS_API.ds_list_find_value(_parametersDsList, i);
				var paramVal = GMS_API.ds_list_find_value(_parametersDsList, i + 1);
				var paramKeyParsed = null;
				
				// Parse param key
				switch(paramKey)
				{
					case FacebookExtension2_PARAM_CONTENT_ID: 				paramKeyParsed = FB.AppEvents.ParameterNames.CONTENT_ID; break;
					case FacebookExtension2_PARAM_CONTENT_TYPE: 			paramKeyParsed = FB.AppEvents.ParameterNames.CONTENT_TYPE; break;
					case FacebookExtension2_PARAM_CURRENCY: 				paramKeyParsed = FB.AppEvents.ParameterNames.CURRENCY; break;
					case FacebookExtension2_PARAM_DESCRIPTION:			 	paramKeyParsed = FB.AppEvents.ParameterNames.DESCRIPTION; break;
					case FacebookExtension2_PARAM_LEVEL: 					paramKeyParsed = FB.AppEvents.ParameterNames.LEVEL; break;
					case FacebookExtension2_PARAM_MAX_RATING_VALUE: 		paramKeyParsed = FB.AppEvents.ParameterNames.MAX_RATING_VALUE; break;
					case FacebookExtension2_PARAM_NUM_ITEMS: 				paramKeyParsed = FB.AppEvents.ParameterNames.NUM_ITEMS; break;
					case FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE: 	paramKeyParsed = FB.AppEvents.ParameterNames.PAYMENT_INFO_AVAILABLE; break;
					case FacebookExtension2_PARAM_REGISTRATION_METHOD: 		paramKeyParsed = FB.AppEvents.ParameterNames.REGISTRATION_METHOD; break;
					case FacebookExtension2_PARAM_SEARCH_STRING: 			paramKeyParsed = FB.AppEvents.ParameterNames.SEARCH_STRING; break;
					case FacebookExtension2_PARAM_SUCCESS: 					paramKeyParsed = FB.AppEvents.ParameterNames.SUCCESS; break;
					
					default: GMS_API.debug_msg( "Invalid parameter passed to fb_send_event data: " + paramKey); break;
				}
				
				if(paramKeyParsed)
					paramsJson[paramKeyParsed] = paramVal;
			}
		}
    }
	
	// Send out the event
	FB.AppEvents.logEvent( eventTypeParsed, _valueToSum, paramsJson );
	return 1;
}

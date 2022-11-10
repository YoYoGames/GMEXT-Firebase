//
//  
//  Copyright YoYo Games Ltd., 2015.
//  For support please submit a ticket at help.yoyogames.com
//
//

#import "FacebookExtension2.h"
#import <FBSDKLoginKit/FBSDKLoginManager.h>

extern UIViewController *g_controller;

extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

// App Events (re-defined from extension macros)
const int FacebookExtension2_EVENT_ACHIEVED_LEVEL = 		101;
const int FacebookExtension2_EVENT_ADDED_PAYMENT_INFO = 	102;
const int FacebookExtension2_EVENT_ADDED_TO_CART = 			103;
const int FacebookExtension2_EVENT_ADDED_TO_WISHLIST = 		104;
const int FacebookExtension2_EVENT_COMPLETED_REGISTRATION = 105;
const int FacebookExtension2_EVENT_COMPLETED_TUTORIAL = 	106;
const int FacebookExtension2_EVENT_INITIATED_CHECKOUT = 	107;
const int FacebookExtension2_EVENT_RATED = 					109;
const int FacebookExtension2_EVENT_SEARCHED = 				110;
const int FacebookExtension2_EVENT_SPENT_CREDITS = 			111;
const int FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT = 	112;
const int FacebookExtension2_EVENT_VIEWED_CONTENT = 		113;

// App event parameters (re-defined from extension macros)
const int FacebookExtension2_PARAM_CONTENT_ID = 			1003;
const int FacebookExtension2_PARAM_CONTENT_TYPE = 			1004;
const int FacebookExtension2_PARAM_CURRENCY = 				1005;
const int FacebookExtension2_PARAM_DESCRIPTION = 			1006;
const int FacebookExtension2_PARAM_LEVEL = 					1007;
const int FacebookExtension2_PARAM_MAX_RATING_VALUE = 		1008;
const int FacebookExtension2_PARAM_NUM_ITEMS = 				1009;
const int FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE = 1010;
const int FacebookExtension2_PARAM_REGISTRATION_METHOD = 	1011;
const int FacebookExtension2_PARAM_SEARCH_STRING = 			1012;
const int FacebookExtension2_PARAM_SUCCESS = 				1013;

// Login types
const int FacebookExtension2_LOGIN_TYPE_NATIVE = 			10001;
const int FacebookExtension2_LOGIN_TYPE_BROWSER = 			10002;
const int FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT = 	10003;
const int FacebookExtension2_LOGIN_TYPE_WEB_VIEW = 			10004;

///////////////////////////////////////
// Share dialog
///////////////////////////////////////
@implementation FacebookExtension2ShareDialog

-(void)setRequestId:(int)_requestId
{
	mRequestId = _requestId;
}

-(int)getRequestId
{
	return mRequestId;
}

-(void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
	FacebookExtension2ShareDialog* dialog = sharer;
	NSLog(@"sharer completed");
	
	int dsMapIndex = dsMapCreate();
	dsMapAddString(dsMapIndex, "type", "fb_dialog");
	dsMapAddString(dsMapIndex, "status", "success");
	dsMapAddInt(dsMapIndex, "requestId", [dialog getRequestId]);
	createSocialAsyncEventWithDSMap(dsMapIndex);
}

-(void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
	NSLog(@"sharer fail %@", error.description);
}

-(void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
	NSLog(@"sharer cancel");
}

@end

///////////////////////////////////////
// Facebook extension
///////////////////////////////////////
@implementation FacebookExtension2

- (id)init
{
	self = [super init];
	if (self)
	{
		mRequestIdCounter = 1;
		mIsReady = 0;
		
		mLoginManager = [[FBSDKLoginManager alloc] init];
	}
	
	return self;
}

- (void) onLaunch:(NSDictionary *)launchOptions
{
	[[FBSDKApplicationDelegate sharedInstance] application:[UIApplication sharedApplication]
	didFinishLaunchingWithOptions:launchOptions];

	[FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
}

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog
   didCompleteWithResults:(NSDictionary *)results
{
	//User has done something.
	//Check "results" and do something.
	NSString *userData = gameRequestDialog.content.data;
	int map = [userData intValue];
	int dsListIndex = dsListCreate();

	NSString* to = @"to";
	dsMapAddInt(map, (char*)[to UTF8String], dsListIndex);

	NSArray *toarray = [ results objectForKey:@"to"];

	for (NSString* item  in toarray)
	{
		char *it8 =(char*)[item UTF8String];
		dsListAddString(dsListIndex, it8 );
	}
	
	NSLog(@"gamerequestdialog completed with results for map %d",map);
}

- (void)gameRequestDialogDidCancel:(FBSDKGameRequestDialog *)gameRequestDialog
{
	//User has cancelled
	NSLog(@"gamerequestdialog was cancelled");
}

- (void)gameRequestDialog:(FBSDKGameRequestDialog *)gameRequestDialog didFailWithError:(NSError *)error
{
	//An error happened
	NSLog(@"gamerequestdialog error: %@", error);
}

- (double) fb_ready
{
	return mIsReady;
}

- (void)fb_init;
{
	mIsReady = 1;
	
	NSLog(@"fb_init: Access token %@", [FBSDKAccessToken currentAccessToken]);
	if([FBSDKAccessToken currentAccessToken] != nil)
	{
		NSLog(@"fb_init: session already open");
		[self fb_set_status:@"AUTHORISED"];
	}
	else
	{
		NSLog(@"fb_init: no session open");
		[self fb_set_status: @"IDLE"];
	}
}

-(void)onResume
{
	[FBSDKAppEvents activateApp];
}

-(BOOL)onOpenURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
{
	BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:[UIApplication sharedApplication]
															  openURL:url
															  sourceApplication:sourceApplication
															  annotation:annotation];
	// Add any custom logic here.
	return handled;
}

////////////////////////////
// fb_login
////////////////////////////
- (double)fb_login:(double)_permissions
		 loginType:(double)_loginType
{
	// Check if we're alredy logged in
    if([FBSDKAccessToken currentAccessToken] != nil)
    {
        NSLog(@"fb_login: session already open");
        [self fb_set_status:@"AUTHORISED"];
        return 0;
    }
	
    /*
	// Parse login type
	FBSDKLoginBehavior eType = FBSDKLoginBehaviorNative;
	switch((int)_loginType)
	{
		case FacebookExtension2_LOGIN_TYPE_WEB_VIEW:
			eType = FBSDKLoginBehaviorWeb; 
			break;
			
		case FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT:
			eType = FBSDKLoginBehaviorSystemAccount; 
			break;
			
		case FacebookExtension2_LOGIN_TYPE_BROWSER:
			eType = FBSDKLoginBehaviorBrowser;
			break;
	}
	*/
    
	// Start login process
	[self fb_set_status:@"PROCESSING"];
	int currentRequestId = [self getRequestId];
	//mLoginManager.loginBehavior = eType;
	
	// Parse permissions
	NSMutableArray * permissions = [self dsListToArray: _permissions];
	
	// Show login dialog
    /*
	[mLoginManager logInWithReadPermissions: permissions
						 fromViewController: g_controller
									handler: [self getHandlerForLoginRequest: currentRequestId]];
	*/
    
    [mLoginManager logInWithPermissions:permissions fromViewController:g_controller handler: [self getHandlerForLoginRequest:currentRequestId]];
    
	return currentRequestId;
}

- (void)fb_logout
{
	[mLoginManager logOut];
	[self fb_set_status: @"IDLE"];
}

- (NSString*)fb_status
{
    return mLoginStatus;
}

- (void)fb_set_status:(NSString*)_status
{
    NSLog(@"Setting login status to %@\n", _status);
    mLoginStatus = _status;
}

- (NSString *)fb_accesstoken
{
	if ([FBSDKAccessToken currentAccessToken] != nil) 
	{
		return [[FBSDKAccessToken currentAccessToken]  tokenString];
	}

	return @"";
}

- (NSString *)fb_user_id
{
	if ([FBSDKAccessToken currentAccessToken] == nil)  
	{
		return @"";
	}
	
	return [[FBSDKAccessToken currentAccessToken] userID];
}

////////////////////////////
// fb_dialog
////////////////////////////
- (double)fb_dialog:(NSString*)_link
{
	// Set up object
	NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
	[properties setObject:@"object" forKey:@"og:type"];
	
	FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
	content.contentURL = [NSURL URLWithString:_link];
	
	// Show share dialog
	FacebookExtension2ShareDialog *dialog = [[FacebookExtension2ShareDialog alloc] init];
	dialog.fromViewController = g_controller;
	dialog.shareContent = content;
	dialog.mode = FBSDKShareDialogModeAutomatic;
	dialog.delegate = dialog;
	
	[dialog setRequestId:[self getRequestId]];
	[dialog show];
	
	return [dialog getRequestId];
}

//graphRequest:nsGraphPath httpMethod:nsHttpMethod params:params dsMap:_dsMapIndex ];
-(double)fb_graph_request:(NSString*)_graphPath
			   httpMethod:(NSString*)_httpMethod
				   params:(int)_params
{
	if ([FBSDKAccessToken currentAccessToken] == nil)
	{
		NSLog(@"facebook graph request error: user not logged in");
		return -1;
	}
	
	NSMutableDictionary* arrayParams = [self dsListToDictionary:_params];
	int currentRequestId = [self getRequestId];

	//OR-if we want to set graph API version...
	//FBRequest *request = [FBRequest requestWithGraphPath:_graphPath parameters:_params HTTPMethod:_httpMethod];
	FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:_graphPath
																   parameters:arrayParams
																   HTTPMethod:_httpMethod];
	
	[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, "type", "fb_graph_request");
		dsMapAddInt(dsMapIndex, "requestId", currentRequestId);
		
		if(!error)
		{
			NSLog(@"graphRequest Result: %@", result);
			dsMapAddString(dsMapIndex, "status", "success");
			
			NSError* error;
			NSString* resultString = nil;
			NSData* jsonData = [NSJSONSerialization dataWithJSONObject:result
															   options:0
																 error:&error];
			if (!jsonData)
			{
				if ([result isKindOfClass:[NSString class]])
					resultString = (NSString*)result;
			}
			else
			{
				resultString = [[NSString alloc] initWithData:jsonData
													 encoding:NSUTF8StringEncoding];
			}
			
			if(resultString != nil)
				dsMapAddString(dsMapIndex, "response_text", (char*)[resultString UTF8String]);
		}
		else
		{
			NSLog(@"error %@", error.description);
			dsMapAddString(dsMapIndex, "status", "error");
			dsMapAddString(dsMapIndex, "exception", (char*)[error.description UTF8String]);
		}
		
		createSocialAsyncEventWithDSMap(dsMapIndex);
	}];
	
	return currentRequestId;
}

// A function for parsing URL parameters returned by the Feed Dialog.
- (NSMutableDictionary*)parseURLParams:(NSString *)query
{
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	
    for (NSString *pair in pairs) 
	{
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =[kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString*key = [kv[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[key] = val;
    }
	
    return params;
}

// Handles the situation where an array is found within the json data
- (void)extractJSONDataArray:(NSArray*)objArray dsListIndex:(int)dsListIndex
{
    for (int arrayIndex = 0; arrayIndex < [objArray count]; ++arrayIndex)
    {
        NSObject* arrayObj = [objArray objectAtIndex:arrayIndex];
        if ([arrayObj isKindOfClass:[NSArray class]])
        {
            // Create a new ds_list for the array
            int dsNewListIndex = dsListCreate();
            
            // Add this map index to the list
            dsListAddInt(dsListIndex, dsNewListIndex);
            
            NSLog(@"Added ds_list %d to ds_list %d", dsNewListIndex, dsListIndex);
            
            // Add the ds_list index to the ds_map for the current key
            NSArray* objArray = (NSArray*)arrayObj;
            [self extractJSONDataArray:objArray dsListIndex:dsNewListIndex];
        }
        else if ([arrayObj isKindOfClass:[NSDictionary class]])
        {
            // Create a new ds_map and get the index for it...
            int subDsMap = dsMapCreate();
            
            // Add this map index to the list
            dsListAddInt(dsListIndex, subDsMap);
            
            // Recurse to parse the new dictionary
            NSDictionary* dictObj = (NSDictionary*)arrayObj;
            [self extractJSONData:dictObj dsMapIndex:subDsMap];
            
            NSLog(@"Added ds_map %d to ds_list %d", subDsMap, dsListIndex);
        }
        else if ([arrayObj isKindOfClass:[NSString class]])
        {
            // Add the string to the list
            NSString* str = (NSString*)arrayObj;
            char currentVal[256];
            [str getCString:currentVal maxLength:256 encoding:NSUTF8StringEncoding];
            dsListAddString(dsListIndex, currentVal);
            
            NSLog(@"Added %@ to ds_list %d", str, dsListIndex);
        }
    }
}

// Builds a ds_map from the jsonData contained in the given dictionary
- (void)extractJSONData:(NSDictionary*)jsonData dsMapIndex:(int)dsMapIndex
{
    NSArray* keys = [jsonData allKeys];
    for (int n = 0; n < [keys count]; ++n)
    {
        // Extract the current key in a form the C++ can use
        NSString* nsKey = [keys objectAtIndex:n];
        char currentKey[256];
        [nsKey getCString:currentKey maxLength:256 encoding:NSUTF8StringEncoding];
        
        NSObject* obj = [jsonData objectForKey:[keys objectAtIndex:n]];
        if ([obj isKindOfClass:[NSArray class]])
        {
            // Create a new ds_list for the array
            int dsListIndex = dsListCreate();
            
            // Add this map index to the list
            dsMapAddInt(dsMapIndex, currentKey, dsListIndex);
            
            NSLog(@"Added ds_list %d to ds_map %d for key %@", dsListIndex, dsMapIndex, nsKey);
            
            // Add the ds_list index to the ds_map for the current key
            NSArray* objArray = (NSArray*)obj;
            [self extractJSONDataArray:objArray dsListIndex:dsListIndex];
        }
        else if ([obj isKindOfClass:[NSDictionary class]])
        {
            // Create a new ds_map and get the index for it...
            int subDsMap = dsMapCreate();
            
            // Add this to the current ds_map
            dsMapAddInt(dsMapIndex, currentKey, subDsMap);
            
            // And recurse to parse the new dictionary
            NSDictionary* dictObj = (NSDictionary*)obj;
            [self extractJSONData:dictObj dsMapIndex:subDsMap];
            
            NSLog(@"Added new ds_map %d to ds_map %d for key %@", subDsMap, dsMapIndex, nsKey);
        }
        else if ([obj isKindOfClass:[NSString class]])
        {
            // Add the string to the map with the current key
            NSString* str = (NSString*)obj;
            char currentVal[256];
            [str getCString:currentVal maxLength:256 encoding:NSUTF8StringEncoding];
            dsMapAddString(dsMapIndex, currentKey, currentVal);
            
            NSLog(@"Added %@ to ds_map %d for key %@", str, dsMapIndex, nsKey);
        }
        else if([obj isKindOfClass:[NSNumber class] ])
        {
            NSNumber *num = (NSNumber *)obj;
            NSInteger val = [num integerValue];
            dsMapAddInt(dsMapIndex, currentKey, val);
            NSLog(@"Added %ld to ds_map %d for key %@", (long)val, dsMapIndex, nsKey);
        }
    }
}

-(bool)fb_check_permission:(NSString*)permission
{
	if ([FBSDKAccessToken currentAccessToken] != nil)
    {
		if ([[FBSDKAccessToken currentAccessToken] hasGranted:permission]) 
		{
			return true;
		}
    }
    else
    {
        NSLog(@"Facebook User must be logged in to query permissions");
    }
	
    return false;
}


-(double)fb_request_publish_permissions:(double)_permissions
{
	int currentRequestId = [self getRequestId];
    /*
	[mLoginManager logInWithPublishPermissions: [self dsListToArray:_permissions]
				   fromViewController:g_controller
				   handler:[self getHandlerForLoginRequest:currentRequestId]];
     */
    
    [mLoginManager logInWithPermissions:[self dsListToArray:_permissions] fromViewController:g_controller handler: [self getHandlerForLoginRequest:currentRequestId]];
	
	NSLog(@"requestPublishPermissions: %d", currentRequestId);
	return currentRequestId;
}

-(double)fb_request_read_permissions:(double)_permissions
{
	int currentRequestId = [self getRequestId];
    /*
	[mLoginManager logInWithReadPermissions: [self dsListToArray:_permissions]
				   fromViewController:g_controller
				   handler:[self getHandlerForLoginRequest:currentRequestId]];
	*/
    [mLoginManager logInWithPermissions:[self dsListToArray:_permissions] fromViewController:g_controller handler: [self getHandlerForLoginRequest:currentRequestId]];
    
	NSLog(@"requestReadPermissions: %d", currentRequestId);
	return currentRequestId;
}

-(double)fb_request_permissions:(double)_permissions publish:(bool)_bPublish
{
    //session must be open: think we are fine since we login if necessary...
	double requestId;
	if(_bPublish)
	{
		requestId = [self fb_request_publish_permissions:_permissions];
	}
	else
	{
		requestId = [self fb_request_read_permissions:_permissions];
	}

    return requestId;
}


-(double)fb_refresh_accesstoken
{
	int currentRequestId = [self getRequestId];
	if ([FBSDKAccessToken currentAccessToken] != nil)
    {
		[FBSDKAccessToken refreshCurrentAccessToken: ^(FBSDKGraphRequestConnection *result, id res, NSError *error) 
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type", "fb_refresh_accesstoken");
			dsMapAddInt(dsMapIndex, "requestId", currentRequestId);
			
			if(error)
			{
				dsMapAddString(dsMapIndex, "status", "error");
				dsMapAddString(dsMapIndex, "exception", (char*)[error.description UTF8String]);
				[self fb_set_status: @"FAILED"];
			}
			else
			{
				dsMapAddString(dsMapIndex, "status", "success");
				[self fb_set_status: @"AUTHORISED"];
			}
			
			createSocialAsyncEventWithDSMap(dsMapIndex);
        }];
    }
	else
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, "type", "fb_refresh_accesstoken");
		dsMapAddInt(dsMapIndex, "requestId", currentRequestId);
		dsMapAddString(dsMapIndex, "status", "error");
		dsMapAddString(dsMapIndex, "exception", "User must be logged in before access token can be refreshed.");
		createSocialAsyncEventWithDSMap(dsMapIndex);
		
		[self fb_set_status: @"IDLE"];
	}
	
	return currentRequestId;
}

-(double)fb_send_event:(double)_eventId
	    withEventValue:(double)_eventValue
	   withEventParams:(double)_eventParamsDsList
{
	// Parse event type
	NSString* eventTypeParsed = @"";
	switch((int)(_eventId))
	{
		case FacebookExtension2_EVENT_ACHIEVED_LEVEL: 			eventTypeParsed = FBSDKAppEventNameAchievedLevel; break;
		case FacebookExtension2_EVENT_ADDED_PAYMENT_INFO: 		eventTypeParsed = FBSDKAppEventNameAddedPaymentInfo; break;
		case FacebookExtension2_EVENT_ADDED_TO_CART: 			eventTypeParsed = FBSDKAppEventNameAddedToCart; break;
		case FacebookExtension2_EVENT_ADDED_TO_WISHLIST: 		eventTypeParsed = FBSDKAppEventNameAddedToWishlist; break;
		case FacebookExtension2_EVENT_COMPLETED_REGISTRATION: 	eventTypeParsed = FBSDKAppEventNameCompletedRegistration; break;
		case FacebookExtension2_EVENT_COMPLETED_TUTORIAL: 		eventTypeParsed = FBSDKAppEventNameCompletedTutorial; break;
		case FacebookExtension2_EVENT_INITIATED_CHECKOUT: 		eventTypeParsed = FBSDKAppEventNameInitiatedCheckout; break;
		case FacebookExtension2_EVENT_RATED: 					eventTypeParsed = FBSDKAppEventNameInitiatedCheckout; break;
		case FacebookExtension2_EVENT_SEARCHED: 				eventTypeParsed = FBSDKAppEventNameSearched; break;
		case FacebookExtension2_EVENT_SPENT_CREDITS: 			eventTypeParsed = FBSDKAppEventNameSpentCredits; break;
		case FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT: 	eventTypeParsed = FBSDKAppEventNameSpentCredits; break;
		case FacebookExtension2_EVENT_VIEWED_CONTENT: 			eventTypeParsed = FBSDKAppEventNameViewedContent; break;
		
		default: 
			NSLog(@"Invalid event type passed to fb_send_event data: %d", (int)_eventId);
			return 0.0;
	}
	
	// Parse parameters
	NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] init];
	if (_eventParamsDsList >= 0.0)
	{
		// Check if the list contains key/value pairs
		int len = dsListGetSize((int)_eventParamsDsList);
		if(len >= 2 && len % 2 == 0)
		{
			for (int i = 0; i < len; i += 2) 
			{
				// Parse ds list key as double
				int paramKey = (int)(dsListGetValueDouble((int)_eventParamsDsList, i));
				NSString* paramKeyParsed = nullptr;
				
				// Parse param key
				switch(paramKey)
				{
					case FacebookExtension2_PARAM_CONTENT_ID: 				paramKeyParsed = FBSDKAppEventParameterNameContentID; break;
					case FacebookExtension2_PARAM_CONTENT_TYPE: 			paramKeyParsed = FBSDKAppEventParameterNameContentType; break;
					case FacebookExtension2_PARAM_CURRENCY: 				paramKeyParsed = FBSDKAppEventParameterNameCurrency; break;
					case FacebookExtension2_PARAM_DESCRIPTION:			 	paramKeyParsed = FBSDKAppEventParameterNameDescription; break;
					case FacebookExtension2_PARAM_LEVEL: 					paramKeyParsed = FBSDKAppEventParameterNameLevel; break;
					case FacebookExtension2_PARAM_MAX_RATING_VALUE: 		paramKeyParsed = FBSDKAppEventParameterNameMaxRatingValue; break;
					case FacebookExtension2_PARAM_NUM_ITEMS: 				paramKeyParsed = FBSDKAppEventParameterNameNumItems; break;
					case FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE: 	paramKeyParsed = FBSDKAppEventParameterNamePaymentInfoAvailable; break;
					case FacebookExtension2_PARAM_REGISTRATION_METHOD: 		paramKeyParsed = FBSDKAppEventParameterNameRegistrationMethod; break;
					case FacebookExtension2_PARAM_SEARCH_STRING: 			paramKeyParsed = FBSDKAppEventParameterNameSearchString; break;
					case FacebookExtension2_PARAM_SUCCESS: 					paramKeyParsed = FBSDKAppEventParameterNameSuccess; break;
					
					default: NSLog( @"Invalid parameter passed to fb_send_event data: %d", paramKey); break;
				}
				
				if(paramKeyParsed != nullptr)
				{
					// Parse param value
					const char* paramValAsStr = dsListGetValueString((int)_eventParamsDsList, i + 1);
					if(paramValAsStr != nullptr)
					{
						[dictionary setObject:[[NSString alloc] initWithUTF8String:paramValAsStr] forKey:paramKeyParsed];
					}
					else
					{
						double paramValAsDouble = dsListGetValueDouble((int)_eventParamsDsList, i + 1);
						[dictionary setObject:[NSNumber numberWithDouble:paramValAsDouble] forKey:paramKeyParsed];
					}
				}
			}
		}
	}
	
	// Send FB event
	[FBSDKAppEvents logEvent:eventTypeParsed
				  valueToSum:_eventValue
				  parameters:dictionary];
	return 1.0;
}

- (int) getRequestId
{
	return mRequestIdCounter++;
}


-(id) getHandlerForLoginRequest:(int)_requestId
{
    return [^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error)
    {
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, "type", "facebook_login_result");
		dsMapAddInt(dsMapIndex, "requestId", _requestId);
		
		if (error)
		{
			// Error
			dsMapAddString(dsMapIndex, "status", "error");
			dsMapAddString(dsMapIndex, "exception", (char*)[error.description UTF8String]);
			
			[self fb_set_status:@"FAILED"];
		}
		else if (result.isCancelled)
		{
			// Cancellations
			dsMapAddString(dsMapIndex, "status", "cancelled");
			[self fb_set_status:@"IDLE"];
		}
		else
		{
			dsMapAddString(dsMapIndex, "status", "success");
			// Success
			for (NSString* item in result.grantedPermissions)
			{
				char *it8 = (char*)[item UTF8String];
				dsMapAddString(dsMapIndex, it8, "granted");
			}
			
			for (NSString* item  in result.declinedPermissions)
			{
				char *it8 = (char*)[item UTF8String];
				dsMapAddString(dsMapIndex, it8, "declined");
			}
			
			[self fb_set_status:@"AUTHORISED"];
		}
		
		createSocialAsyncEventWithDSMap(dsMapIndex);
	}
	copy];
     
}

-(NSMutableArray*) dsListToArray: (int)_dsListId
{
	NSMutableArray* array = [[NSMutableArray alloc] init];
	int listCount = dsListGetSize(_dsListId);
	if(listCount == 0)
	{
		NSLog(@"DS list size is zero");
		return array;
	}
	
	NSLog(@"ds_list size: %d", listCount);
	for(int listIdx = 0; listIdx < listCount; ++listIdx)
	{
		NSString* currentItem = [[NSString alloc] initWithCString: dsListGetValueString(_dsListId, listIdx)
														 encoding:NSUTF8StringEncoding];
		[array addObject:currentItem];
		
		NSLog(@"Added item to string array: %@", currentItem);
	}
	
	return array;
}

- (NSMutableDictionary*) dsListToDictionary: (int)_dsListId
{
	NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] init];
	if(_dsListId == -1)
	{
		NSLog(@"DS list does not exist. Returning empty dictionary.");
		return dictionary;
	}
	
	int listCount = dsListGetSize(_dsListId);
	if(listCount == 0 || (listCount & 0x1) != 0)
	{
		NSLog(@"Invalid ds list size: %d", listCount);
		return dictionary;
	}
	
	NSLog(@"ds_list size: %d", listCount);
	for(int listIdx = 0; listIdx < listCount; listIdx += 2)
	{
		NSString* currentKey = [[NSString alloc] initWithCString: dsListGetValueString(_dsListId, listIdx)
														encoding:NSUTF8StringEncoding];
		NSString* currentValue = [[NSString alloc] initWithCString: dsListGetValueString(_dsListId, listIdx + 1)
														  encoding:NSUTF8StringEncoding];
		[dictionary setObject:currentValue forKey:currentKey];
		NSLog(@"Added key/value to dictionary. %@ : %@", currentKey, currentValue);
	}
	
	return dictionary;
}

@end

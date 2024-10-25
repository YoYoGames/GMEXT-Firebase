//
// Copyright YoYo Games Ltd.
// For support please submit a ticket at help.yoyogames.com
//

#import "YY_AppleSignIn.h"

#if TARGET_OS_OSX
YYRunnerInterface gs_runnerInterface;
YYRunnerInterface* g_pYYRunnerInterface;
#else
extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
//extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
//extern "C" void DsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern "C" void dsMapAddDouble(int _dsMap, const char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, const char* _key, const char* _value);
#endif

const int EVENT_OTHER_SOCIAL = 70;

#if TARGET_OS_OSX

NSWindow* g_window = NULL;

extern "C" void PreGraphicsInitialisation(char* arg1)//Mac
{

}

YYEXPORT void YYExtensionInitialise(const struct YYRunnerInterface* _pFunctions, size_t _functions_size)
{
    //copy out all the functions
    memcpy(&gs_runnerInterface, _pFunctions, sizeof(YYRunnerInterface));
    g_pYYRunnerInterface = &gs_runnerInterface;

    if (_functions_size < sizeof(YYRunnerInterface)) {
        DebugConsoleOutput("ERROR : runner interface mismatch in extension DLL\n ");
    } // end if

    DebugConsoleOutput("YYExtensionInitialise CONFIGURED \n ");
}
#endif

@implementation YY_AppleSignIn
{
    NSMutableArray* requestedScopes;
    YY_AppleSignInDelegate* authDelegate;
    YY_AppleSignInControllerPresentationContextProviding* authPresentation;
	#if TARGET_OS_OSX
    ASAuthorizationAppleIDProvider* appleIdProvider API_AVAILABLE(macos(10.15));
	#else
	ASAuthorizationAppleIDProvider* appleIdProvider API_AVAILABLE(ios(13.0));
	#endif
}

int CreateDsMap_comaptibility_()
{
    #if TARGET_OS_OSX
    return CreateDsMap(0,0);
    #else
    return CreateDsMap(0,0);
    #endif
}

void DsMapAddString_comaptibility_(int dsMapIndex, const char* _key, const char* _value)
{
    #if TARGET_OS_OSX
    DsMapAddString(dsMapIndex, _key, _value);
    #else
    dsMapAddString(dsMapIndex, _key, _value);
    #endif
}

void DsMapAddDouble_comaptibility_(int dsMapIndex, const char* _key, double _value)
{
    #if TARGET_OS_OSX
    DsMapAddDouble(dsMapIndex, _key, _value);
    #else
    dsMapAddDouble(dsMapIndex, _key, _value);
    #endif
}

void CreateAsyncEventWithDSMap_comaptibility_(int dsMapIndex)
{
    #if TARGET_OS_OSX
    CreateAsyncEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    #else
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    #endif
}


- (void)dealloc
{
    if (authDelegate != nil)
    {
        [authDelegate release];
    }
    
    if (requestedScopes != nil)
    {
        [requestedScopes release];
    }
    
    if (authPresentation != nil)
    {
        [authPresentation release];
    }
    
    if (appleIdProvider != nil)
    {
        [appleIdProvider release];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (double) AppleSignIn_Init
{
    requestedScopes = [[NSMutableArray alloc] init];
    authDelegate = [[YY_AppleSignInDelegate alloc] init];
    authPresentation = [[YY_AppleSignInControllerPresentationContextProviding alloc] init];
	
	#if TARGET_OS_OSX
    if (@available(macOS 10.15, *))
	#else
	if (@available(iOS 13.0, *))
	#endif
    {
        appleIdProvider = [[ASAuthorizationAppleIDProvider alloc] init];
    }
    
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    if (notificationCenter != nil)
    {
		#if TARGET_OS_OSX
        if (@available(macOS 10.15, *))
        #else
        if (@available(iOS 13.0, *))
		#endif
		{
            SEL appleIdSelector = NSSelectorFromString(@"appleIdCredentialRevoked:");
            
            NSString* notificationName = ASAuthorizationAppleIDProviderCredentialRevokedNotification;
            [notificationCenter addObserver:self selector:appleIdSelector name:notificationName object:nil];
        } 
		// else 
		// {
            // // Fallback on earlier versions
        // }
    }
    
    return 0.0;
}

- (void) appleIdCredentialRevoked:(NSNotification*) notification
{
	#if TARGET_OS_OSX
    if (@available(macOS 10.15, *))
	#endif
	{
        if ([[notification name] isEqualToString:ASAuthorizationAppleIDProviderCredentialRevokedNotification])
        {
            NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
            results[@"state"] = [[NSNumber alloc] initWithInt:applesignin_state_revoked];
            
            NSError* pError = nil;
            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:results options:0 error:&pError];
            NSString* jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            
            // Async
            char jId[3];
            sprintf(jId, "id");
            char jResponse[20];
            sprintf(jResponse, "response_json");
            
            int dsMapIndex = CreateDsMap_comaptibility_();
            DsMapAddDouble_comaptibility_(dsMapIndex, jId, applesignin_credential_response);
            DsMapAddString_comaptibility_(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
            CreateAsyncEventWithDSMap_comaptibility_(dsMapIndex);
            
            [results release];
            [jsonStr release];
        }
    } 
	// else 
	// {
        // // Fallback on earlier versions
		// NSLog(@"Only available on macOS10.15 or later");
    // }
}

- (double) AppleSignIn_AuthoriseUser
{
	#if TARGET_OS_OSX
    if (@available(macOS 10.15, *))
	#else
	if (@available(iOS 13.0, *))
	#endif
    {
        ASAuthorizationAppleIDRequest* request = [appleIdProvider createRequest];
        request.requestedScopes = requestedScopes;
  
        ASAuthorizationController* authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
        authDelegate = [[YY_AppleSignInDelegate alloc] init];
        
        authorizationController.delegate = authDelegate;
        authorizationController.presentationContextProvider = authPresentation;
        [authorizationController performRequests];
    
    } else {
        // Fallback on earlier versions
    }
    
    return 0.0;
}

- (double) AppleSignIn_AddScope: (NSString*)scope
{
	#if TARGET_OS_OSX
    if (@available(macOS 10.15, *))
	#else
	if (@available(iOS 13.0, *))
	#endif
    {
        if ([scope isEqualToString:applesignin_scope_fullname])
        {
            if (![requestedScopes containsObject:ASAuthorizationScopeFullName])
            {
                [requestedScopes addObject:ASAuthorizationScopeFullName];
            }
        }
        else if ([scope isEqualToString:applesignin_scope_email])
        {
            if (![requestedScopes containsObject:ASAuthorizationScopeEmail])
            {
                [requestedScopes addObject:ASAuthorizationScopeEmail];
            }
        }
    }
    
    return 1.0;
}

- (double) AppleSignIn_ClearScopes
{
    [requestedScopes removeAllObjects];
    return 1.0;
}

- (double) AppleSignIn_GetCredentialState:(NSString*) userId
{
	#if TARGET_OS_OSX
    if (@available(macOS 10.15, *))
	#else
	if (@available(iOS 13.0, *))
	#endif
    {
        [appleIdProvider getCredentialStateForUserID:userId completion:^(ASAuthorizationAppleIDProviderCredentialState credentialState, NSError * _Nullable error) {
            
            NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
            
            switch (credentialState)
            {
                case ASAuthorizationAppleIDProviderCredentialAuthorized:
                    results[@"state"] = [[NSNumber alloc] initWithInt:applesignin_state_authorized];
                    break;
                case ASAuthorizationAppleIDProviderCredentialRevoked:
                    results[@"state"] = [[NSNumber alloc] initWithInt:applesignin_state_revoked];
                    break;
                case ASAuthorizationAppleIDProviderCredentialNotFound:
                    results[@"state"] = [[NSNumber alloc] initWithInt:applesignin_state_not_found];
                    break;
            }
            
            NSError* pError = nil;
            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:results options:0 error:&pError];
            NSString* jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            
            // Async
            char jId[3];
            sprintf(jId, "id");
            char jResponse[20];
            sprintf(jResponse, "response_json");
            
            int dsMapIndex = CreateDsMap_comaptibility_();
            DsMapAddDouble_comaptibility_(dsMapIndex, jId, applesignin_credential_response);
            DsMapAddString_comaptibility_(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
            CreateAsyncEventWithDSMap_comaptibility_(dsMapIndex);
            
            [results release];
            [jsonStr release];
        }];
    }
    
    return 1.0;
}

YY_AppleSignIn *mac;

///////////////////////////////////////////////////////////////////////////
///
///
#if TARGET_OS_OSX
void /*double*/ AppleSignIn_Init_C(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//
{
    mac = [YY_AppleSignIn new];
    
    Result.kind = VALUE_REAL;
    Result.val = [mac AppleSignIn_Init];
}


void /*double*/ AppleSignIn_AuthoriseUser_C(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//
{
    Result.kind = VALUE_REAL;
    Result.val = [mac AppleSignIn_AuthoriseUser];
}


void /*double*/ AppleSignIn_AddScope_C(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//: (NSString*)scope
{
    const char* scope = YYGetString(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val = [mac AppleSignIn_AddScope:@(scope)];
}

void /*double*/ AppleSignIn_ClearScopes_C(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//
{
    Result.kind = VALUE_REAL;
    Result.val = [mac AppleSignIn_ClearScopes];
}

void /*double*/ AppleSignIn_GetCredentialState_C(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(NSString*) userId
{
    const char* userId = YYGetString(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val = [mac AppleSignIn_GetCredentialState:@(userId)];
}
#endif

@end

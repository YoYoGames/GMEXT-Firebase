//
// Copyright YoYo Games Ltd.
// For support please submit a ticket at help.yoyogames.com
//

#import "YY_AppleSignIn.h"
#include "YY_AppleSignInEnums.h"

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

@implementation YY_AppleSignIn
{
    NSMutableArray* requestedScopes;
    YY_AppleSignInDelegate* authDelegate;
    YY_AppleSignInControllerPresentationContextProviding* authPresentation;
    ASAuthorizationAppleIDProvider* appleIdProvider API_AVAILABLE(ios(13.0));
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
    
    if (authDelegate != nil)
    {
        [authDelegate release];
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
    if (@available(iOS 13.0, *))
    {
        appleIdProvider = [[ASAuthorizationAppleIDProvider alloc] init];
    
        NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
        if (notificationCenter != nil)
        {
            NSString* notificationName = ASAuthorizationAppleIDProviderCredentialRevokedNotification;        
            [notificationCenter addObserver:self selector:@selector(appleIdCredentialRevoked) name:notificationName object:nil];
        }
    }
    
    return 0.0;
}

- (void) appleIdCredentialRevoked:(NSNotification*) notification
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
        
        int dsMapIndex = dsMapCreate();
        dsMapAddInt(dsMapIndex, jId, applesignin_credential_response);
        dsMapAddString(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
        createSocialAsyncEventWithDSMap(dsMapIndex);
        
        [results release];
        [jsonStr release];
    }
}

- (double) AppleSignIn_AuthoriseUser
{
    if (@available(iOS 13.0, *))
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
    if (@available(iOS 13.0, *))
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
    if (@available(iOS 13.0, *))
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
            
            int dsMapIndex = dsMapCreate();
            dsMapAddInt(dsMapIndex, jId, applesignin_credential_response);
            dsMapAddString(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
            createSocialAsyncEventWithDSMap(dsMapIndex);
            
            [results release];
            [jsonStr release];
        }];
    }
    
    return 1.0;
}

@end

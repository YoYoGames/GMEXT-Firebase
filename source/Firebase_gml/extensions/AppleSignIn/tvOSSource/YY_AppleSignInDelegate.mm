//
//  YY_AppleSignInDelegate.m
//  AppleSignIn
//
//  Created by David Clarke on 16/08/2019.
//  Copyright © 2019 YoYo Games Ltd. All rights reserved.
//

#import "YY_AppleSignInDelegate.h"
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

@implementation YY_AppleSignInDelegate

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0))
{
    NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
    
    if ([[authorization credential] isKindOfClass:[ASAuthorizationAppleIDCredential class]])
    {
        results[@"success"] = [[NSNumber alloc] initWithBool:true];
        ASAuthorizationAppleIDCredential* credentials = [authorization credential];
        results[@"userIdentifier"] = [credentials user];
        results[@"identityToken"] = [[NSString alloc] initWithData:[credentials identityToken] encoding:NSUTF8StringEncoding];
        results[@"authCode"] = [[NSString alloc] initWithData:[credentials authorizationCode] encoding:NSUTF8StringEncoding];

        if ([credentials email] != nil)
        {
            results[@"email"] = [credentials email];
        }
        
        if ([credentials fullName] != nil)
        {
            results[@"givenName"] = [[credentials fullName] givenName] != nil ? [[credentials fullName] givenName] : @"";
            results[@"middleName"] = [[credentials fullName] middleName] != nil ? [[credentials fullName] middleName] : @"";
            results[@"familyName"] = [[credentials fullName] familyName] != nil ? [[credentials fullName] familyName] : @"";
            results[@"namePrefix"] = [[credentials fullName] namePrefix] != nil ? [[credentials fullName] namePrefix] : @"";
            results[@"nameSuffix"] = [[credentials fullName] nameSuffix] != nil ? [[credentials fullName] nameSuffix] : @"";
            results[@"nickname"] = [[credentials fullName] nickname] != nil ? [[credentials fullName] nickname] : @"";
            results[@"phoneticRepresentation"] = [[credentials fullName] phoneticRepresentation] != nil ? [[credentials fullName] phoneticRepresentation] : @"";
        }
        
        int realUserStatus = 0;
        // Using a switch statement to convert from apple enum to yoyo enum for safety
        switch ([credentials realUserStatus])
        {
            case ASUserDetectionStatusLikelyReal:
                realUserStatus = applesignin_realuserstatus_likelyreal;
                break;

            case ASUserDetectionStatusUnknown:
                realUserStatus = applesignin_realuserstatus_unknown;
                break;

            case ASUserDetectionStatusUnsupported:
                realUserStatus = applesignin_realuserstatus_unsupported;
                break;
        };
        results[@"realUserStatus"] = [[NSNumber alloc] initWithLong:realUserStatus];
    }
    else
    {
        results[@"success"] = [[NSNumber alloc] initWithBool:false];
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
    dsMapAddInt(dsMapIndex, jId, applesignin_signin_response);
    dsMapAddString(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
    createSocialAsyncEventWithDSMap(dsMapIndex);
    
    [results release];
    [jsonStr release];
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0))
{
    NSLog(@"%s", __FUNCTION__);
    
    NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
    
    results[@"success"] = [[NSNumber alloc] initWithBool:false];
    results[@"error"] = [error localizedDescription];
    
    NSError* pError = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:results options:0 error:&pError];
    NSString* jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    // Async
    char jId[3];
    sprintf(jId, "id");
    char jResponse[20];
    sprintf(jResponse, "response_json");
    
    int dsMapIndex = dsMapCreate();
    dsMapAddInt(dsMapIndex, jId, applesignin_signin_response);
    dsMapAddString(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
    createSocialAsyncEventWithDSMap(dsMapIndex);
    
    [results release];
    [jsonStr release];
}

@end

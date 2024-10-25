//
//  YY_AppleSignInDelegate.m
//  AppleSignIn
//
//  Created by David Clarke on 16/08/2019.
//  Copyright © 2019 YoYo Games Ltd. All rights reserved.
//

#import "YY_AppleSignIn.h"

@implementation YY_AppleSignInDelegate

#if TARGET_OS_OSX
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(macos(10.15))
#else
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0))
#endif
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
    
    int dsMapIndex = CreateDsMap_comaptibility_();
    DsMapAddDouble_comaptibility_(dsMapIndex, jId, applesignin_signin_response);
    DsMapAddString_comaptibility_(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
    CreateAsyncEventWithDSMap_comaptibility_(dsMapIndex);
    
    [results release];
    [jsonStr release];
}


#if TARGET_OS_OSX
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(macos(10.15))
#else
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0))
#endif
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
    
    int dsMapIndex = CreateDsMap_comaptibility_();
    DsMapAddDouble_comaptibility_(dsMapIndex, jId, applesignin_signin_response);
    DsMapAddString_comaptibility_(dsMapIndex, jResponse, const_cast<char*>([jsonStr UTF8String]));
    CreateAsyncEventWithDSMap_comaptibility_(dsMapIndex);
    
    [results release];
    [jsonStr release];
}

@end

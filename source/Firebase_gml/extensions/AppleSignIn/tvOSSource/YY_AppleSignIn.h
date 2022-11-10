//
// Copyright YoYo Games Ltd.
// For support please submit a ticket at help.yoyogames.com
//

#import <Foundation/Foundation.h>
#import "YY_AppleSignInDelegate.h"
#import "YY_AppleSignInControllerPresentationContextProviding.h"

@interface YY_AppleSignIn : NSObject
{
}

- (double) AppleSignIn_Init;

- (double) AppleSignIn_AuthoriseUser;

- (double) AppleSignIn_AddScope: (NSString*)scope;

- (double) AppleSignIn_ClearScopes;

- (double) AppleSignIn_GetCredentialState:(NSString*) userId;

@end

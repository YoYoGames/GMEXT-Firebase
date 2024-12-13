//
//  YY_AppleSignInControllerPresentationContextProviding.h
//  AppleSignIn
//
//  Created by David Clarke on 16/08/2019.
//  Copyright © 2019 YoYo Games Ltd. All rights reserved.
//

#import "YY_AppleSignIn.h"


#if !TARGET_OS_OSX
#import <UIKit/UIKit.h>
#endif
#import <AuthenticationServices/AuthenticationServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface YY_AppleSignInControllerPresentationContextProviding : NSObject<ASAuthorizationControllerPresentationContextProviding>

@end

NS_ASSUME_NONNULL_END

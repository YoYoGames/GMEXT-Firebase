//
//  YY_AppleSignInControllerPresentationContextProviding.m
//  AppleSignIn
//
//  Created by David Clarke on 16/08/2019.
//  Copyright © 2019 YoYo Games Ltd. All rights reserved.
//

#import "YY_AppleSignInControllerPresentationContextProviding.h"

#if TARGET_OS_OSX
extern NSWindow* g_window;
#else
extern UIViewController* g_controller;
#endif

@implementation YY_AppleSignInControllerPresentationContextProviding

#if TARGET_OS_OSX
- (nonnull ASPresentationAnchor)presentationAnchorForAuthorizationController:(nonnull ASAuthorizationController *)controller  API_AVAILABLE(macos(10.15))
{
    return g_window;
}
#else
- (nonnull ASPresentationAnchor)presentationAnchorForAuthorizationController:(nonnull ASAuthorizationController *)controller  API_AVAILABLE(ios(13.0))
{
	return g_controller.view.window;
}
#endif

@end

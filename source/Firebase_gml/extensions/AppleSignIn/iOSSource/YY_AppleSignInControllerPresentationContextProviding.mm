//
//  YY_AppleSignInControllerPresentationContextProviding.m
//  AppleSignIn
//
//  Created by David Clarke on 16/08/2019.
//  Copyright © 2019 YoYo Games Ltd. All rights reserved.
//

#import "YY_AppleSignInControllerPresentationContextProviding.h"

extern UIViewController* g_controller;

@implementation YY_AppleSignInControllerPresentationContextProviding

- (nonnull ASPresentationAnchor)presentationAnchorForAuthorizationController:(nonnull ASAuthorizationController *)controller  API_AVAILABLE(ios(13.0))
{
    return g_controller.view.window;
}

@end

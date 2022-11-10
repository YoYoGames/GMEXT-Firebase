//
// Copyright(C) YoYo Games Ltd.
//
//

#import "YY_AppleSignIn.h"

NSString* applesignin_scope_fullname = @"fullname";
NSString* applesignin_scope_email = @"email";

int applesignin_signin_response = 1;
int applesignin_credential_response = 2;

int applesignin_state_authorized = 100;
int applesignin_state_revoked = 101;
int applesignin_state_not_found = 102;

int applesignin_realuserstatus_likelyreal = 5002;
int applesignin_realuserstatus_unknown = 5001;
int applesignin_realuserstatus_unsupported = 5000;
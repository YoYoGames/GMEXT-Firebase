//
//  
//  Copyright YoYo Games Ltd., 2015.
//  For support please submit a ticket at help.yoyogames.com
//
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

///////////////////////////////////////
// Share dialog
///////////////////////////////////////
@interface FacebookExtension2ShareDialog : FBSDKShareDialog<FBSDKSharingDelegate>
{
@private
	int mRequestId;
}

@end

///////////////////////////////////////
// Facebook extension
///////////////////////////////////////
@interface FacebookExtension2:NSObject <FBSDKGameRequestDialogDelegate>
{
@private
	// The FB login state
	NSString* mLoginStatus;
	NSString* mUserId;
	
	int mRequestIdCounter;
	int mIsReady;
	
	FBSDKLoginManager *mLoginManager;
}

-(id) getHandlerForLoginRequest:(int)_requestId;
- (void)fb_set_status:(NSString*)_status;

@end

#import <Foundation/Foundation.h>
#import <FirebaseFunctions/FirebaseFunctions-Swift.h>

@interface YYFirebaseCloudFunctions : NSObject

- (void)SDKFirebaseCloudFunctions_Init;
- (double)SDKFirebaseCloudFunctions_Call:(NSString *)functionName data:(NSString *)data timeoutSeconds:(double)timeoutSeconds;

@end

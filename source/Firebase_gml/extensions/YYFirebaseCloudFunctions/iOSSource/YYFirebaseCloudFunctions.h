#import <Foundation/Foundation.h>
#import <FirebaseFunctions/FirebaseFunctions-Swift.h>

@interface YYFirebaseCloudFunctions : NSObject

- (double)SDKFirebaseCloudFunctions_Call:(NSString *)functionName data:(NSString *)data timeoutSeconds:(double)timeoutSeconds;

@end

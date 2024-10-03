#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseRemoteConfig/FirebaseRemoteConfig.h>

@interface YYFirebaseRemoteConfig : NSObject

- (double)FirebaseRemoteConfig_Initialize:(double)seconds;
- (double)FirebaseRemoteConfig_FetchAndActivate;
- (double)FirebaseRemoteConfig_Reset;
- (double)FirebaseRemoteConfig_SetDefaultsAsync:(NSString *)json;
- (NSString *)FirebaseRemoteConfig_GetKeys;
- (NSString *)FirebaseRemoteConfig_GetString:(NSString *)key;
- (double)FirebaseRemoteConfig_GetDouble:(NSString *)key;
- (double)FirebaseRemoteConfig_AddOnConfigUpdateListener;

@end

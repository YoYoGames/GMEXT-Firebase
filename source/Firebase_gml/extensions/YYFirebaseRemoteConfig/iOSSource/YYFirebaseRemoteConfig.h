#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseInstallations/FirebaseInstallations.h>
#import <FirebaseRemoteConfig/FirebaseRemoteConfig.h>

@interface YYFirebaseRemoteConfig : NSObject

- (void)FirebaseRemoteConfig_Initialize:(double)seconds;
- (void)FirebaseRemoteConfig_FetchAndActivate;
- (void)FirebaseRemoteConfig_Reset;
- (void)FirebaseRemoteConfig_SetDefaultsAsync:(NSString *)json;
- (NSString *)FirebaseRemoteConfig_GetKeys;
- (NSString *)FirebaseRemoteConfig_GetString:(NSString *)key;
- (double)FirebaseRemoteConfig_GetDouble:(NSString *)key;
- (void)FirebaseRemoteConfig_AddOnConfigUpdateListener;

@end

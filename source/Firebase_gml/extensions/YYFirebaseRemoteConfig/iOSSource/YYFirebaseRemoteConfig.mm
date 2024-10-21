#import "YYFirebaseRemoteConfig.h"
#import "FirebaseUtils.h"
#import <UIKit/UIKit.h>

// Error Codes
static const double kFirebaseRemoteConfigSuccess = 0.0;
static const double kFirebaseRemoteConfigErrorUnsupported = -1.0;

@interface YYFirebaseRemoteConfig ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (NSString *)convertObjectToJsonString:(id)obj;

@end

@implementation YYFirebaseRemoteConfig

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - Firebase Remote Config Methods

- (double)FirebaseRemoteConfig_Initialize:(double)seconds {
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] init];
    remoteConfigSettings.minimumFetchInterval = seconds;
    [FIRRemoteConfig remoteConfig].configSettings = remoteConfigSettings;
    return kFirebaseRemoteConfigSuccess;
}

- (double)FirebaseRemoteConfig_FetchAndActivate {
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    [[FIRRemoteConfig remoteConfig] fetchAndActivateWithCompletionHandler:^(FIRRemoteConfigFetchAndActivateStatus status, NSError *_Nullable error) {
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        if (status == FIRRemoteConfigFetchAndActivateStatusSuccessFetchedFromRemote || status == FIRRemoteConfigFetchAndActivateStatusSuccessUsingPreFetchedData) {
            [data setObject:@(1.0) forKey:@"success"];
        } else {
            [data setObject:@(0.0) forKey:@"success"];
            if (error) {
                NSString *errorMessage = [error localizedDescription];
                [data setObject:errorMessage forKey:@"error"];
            } else {
                [data setObject:@"Failed with unknown error" forKey:@"error"];
            }
        }

        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseRemoteConfig_FetchAndActivate" data:data];
    }];
    return kFirebaseRemoteConfigSuccess;
}

- (double)FirebaseRemoteConfig_Reset {
    NSLog(@"FirebaseRemoteConfig_Reset :: This function is not supported on iOS");
    return kFirebaseRemoteConfigErrorUnsupported;
}

- (double)FirebaseRemoteConfig_SetDefaultsAsync:(NSString *)json {
    // Offload JSON parsing to a background thread
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSError *jsonError = nil;
        NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonMap = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];

        NSMutableDictionary *data = [NSMutableDictionary dictionary];

        if (jsonError) {
            [data setObject:@(0.0) forKey:@"success"];
            [data setObject:[jsonError localizedDescription] forKey:@"error"];
        } else {
            [[FIRRemoteConfig remoteConfig] setDefaults:jsonMap];
            [data setObject:@(1.0) forKey:@"success"];
        }

        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseRemoteConfig_SetDefaultsAsync" data:data];
    }];

    return kFirebaseRemoteConfigSuccess;
}

- (NSString *)FirebaseRemoteConfig_GetKeys {
    NSArray<NSString *> *remoteKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceRemote];
    NSArray<NSString *> *defaultKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceDefault];

    NSMutableSet<NSString *> *keySet = [NSMutableSet setWithArray:remoteKeys];
    [keySet addObjectsFromArray:defaultKeys];

    NSArray<NSString *> *allKeys = [keySet allObjects];

    NSString *keysJson = [self convertObjectToJsonString:allKeys];

    return keysJson;
}

- (NSString *)FirebaseRemoteConfig_GetString:(NSString *)key {
    NSString *value = [[[FIRRemoteConfig remoteConfig] configValueForKey:key] stringValue];
    return value;
}

- (double)FirebaseRemoteConfig_GetDouble:(NSString *)key {
    double value = [[[[FIRRemoteConfig remoteConfig] configValueForKey:key] numberValue] doubleValue];
    return value;
}

- (double)FirebaseRemoteConfig_AddOnConfigUpdateListener {
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    [[FIRRemoteConfig remoteConfig] addOnConfigUpdateListener:^(FIRRemoteConfigUpdate *_Nonnull configUpdate, NSError *_Nullable error) {
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        if (error != nil) {
            [data setObject:@(0.0) forKey:@"success"];
            [data setObject:[error localizedDescription] forKey:@"error"];
        } else {
            [data setObject:@(1.0) forKey:@"success"];

            NSArray<NSString *> *updatedKeys = [configUpdate.updatedKeys allObjects];
            NSString *keysString = [strongSelf convertObjectToJsonString:updatedKeys];
            [data setObject:keysString forKey:@"keys"];
        }

        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseRemoteConfig_AddOnConfigUpdateListener" data:data];
    }];

    return kFirebaseRemoteConfigSuccess;
}

#pragma mark - Helper Methods

- (NSString *)convertObjectToJsonString:(id)obj {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    if (error == nil) {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    } else {
        NSLog(@"Error converting object to JSON: %@", [error localizedDescription]);
        return @"[]";
    }
}

@end

#import "UNUserNotificationCenterMultiplexer.h"
#import "LocalNotifications.h"

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);

const int EVENT_OTHER_SOCIAL = 70;
const int EVENT_OTHER_NOTIFICATION = 71;
// External function declarations...

const char*  YYNotification_id = "id";
const char*  YYNotification_title = "title";
const char*  YYNotification_message = "message";
const char*  YYNotification_data = "data";

@implementation LocalNotifications

+ (NSString*) prefix
{
    return @"YYLocalNotification"; 
}

- (void) LocalPushNotification_Create:(NSString*)ID fire_time:(double)fire_time title:(NSString*)title message:(NSString*)message data:(NSString*)data {
    NSString *ID_withPrefix = [[LocalNotifications prefix] stringByAppendingString:ID];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = title;
    content.body = message;
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = @{@"data_key" : data};

    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:fire_time repeats:NO];

    NSArray *array = @[ID_withPrefix];
    [[UNUserNotificationCenter currentNotificationCenter] removePendingNotificationRequestsWithIdentifiers:array];

    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:ID_withPrefix content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error)
    {
        if (error)
            NSLog(@"Local Notification failed: %@", error.localizedDescription);
    }];
}

- (void) LocalPushNotification_Cancel:(NSString*)ID {
    ID = [[LocalNotifications prefix] stringByAppendingString:ID];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    NSArray *array = @[ID];
    [center removePendingNotificationRequestsWithIdentifiers:array];
}

- (void) LocalPushNotification_iOS_Permission_Request {
    if (@available(iOS 10.0, *)) {
        UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error)
         {
            NSMutableDictionary *data = [NSMutableDictionary dictionary];
            data[@"value"] = @(granted);
            data[@"success"] = @(error != nil);
            [self sendAsyncEvent:EVENT_OTHER_SOCIAL eventType:@"LocalPushNotification_iOS_Permission_Request" data:data];
         }];
    } else {
        UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        data[@"value"] = @(YES);
        data[@"success"] = @(YES);
        [self sendAsyncEvent:EVENT_OTHER_SOCIAL eventType:@"LocalPushNotification_iOS_Permission_Request" data:data];
    }
}

- (void) LocalPushNotification_iOS_Permission_Status {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings)
    {
        NSString *statusString = @"Unknown";
        switch (settings.authorizationStatus) 
        {
            case UNAuthorizationStatusAuthorized:
                statusString = @"Authorized";
                break;
            case UNAuthorizationStatusDenied:
                statusString = @"Denied";
                break;
            case UNAuthorizationStatusNotDetermined:
                statusString = @"NotDetermined";
                break;
            case UNAuthorizationStatusProvisional:
                statusString = @"Provisional";
                break;
            case UNAuthorizationStatusEphemeral:
                statusString = @"Ephemeral";
                break;
            default:
                break;
        }

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        data[@"value"] = statusString;
        data[@"success"] = @(YES);
        [self sendAsyncEvent:EVENT_OTHER_SOCIAL eventType:@"LocalPushNotification_iOS_Permission_Status" data:data];
    }];
}

#pragma mark - Selectors

- (void)onLaunch:(NSDictionary *)launchOptions {

    // Register with the UNUserNotificationCenter multiplexer
    NSLog(@"LocalNotifications onLaunch:");
    UNUserNotificationCenterMultiplexer *multiplexer = [UNUserNotificationCenterMultiplexer sharedInstance];
    [multiplexer registerDelegate:self];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
        didReceiveNotificationResponse:(UNNotificationResponse *)response 
        withCompletionHandler:(void (^)(void))completionHandler {
    UNNotification *notification = response.notification;
    UNNotificationTrigger *trigger = notification.request.trigger;
    
    NSLog(@"LocalNotifications: didReceiveNotificationResponse");

    // This is a remote notification? Ignore...
    if ([trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        return;
    }
    
    [self handleLocalNotification:notification];
    
    completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
        willPresentNotification:(UNNotification *)notification 
        withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    UNNotificationTrigger *trigger = notification.request.trigger;
    
    NSLog(@"LocalNotifications: willPresentNotification");

    // This is a remote notification? Ignore...
    if ([trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        return;
    }

    [self handleLocalNotification:notification];
    
    // Present the notification
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
}

- (void)handleLocalNotification:(UNNotification*)notification {

    NSString *identifier = notification.request.identifier;

    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    data[@"id"] = [identifier substringFromIndex: [[LocalNotifications prefix]length]];
    data[@"title"] = notification.request.content.title;
    data[@"message"] = notification.request.content.body;
    data[@"data"] = notification.request.content.userInfo[@"data_key"];
    
    [self sendAsyncEvent:EVENT_OTHER_NOTIFICATION eventType:@"Notification_Local" data:data];
}

#pragma mark - Helper Methods

- (void)sendAsyncEvent:(int)eventId eventType:(NSString *)eventType data:(NSDictionary *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, (char *)"type", (char *)[eventType UTF8String]);

        for (NSString *key in data) {
            id value = data[key];
            const char *cKey = [key UTF8String];

            // Check if value is NSDictionary or NSArray and serialize to JSON string
            if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]) {
                NSError *error = nil;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:value
                                                                   options:0 // NSJSONWritingPrettyPrinted can be used if formatting is desired
                                                                     error:&error];
                NSString *jsonString;
                if (error == nil && jsonData) {
                    jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                } else {
                    NSLog(@"FirebaseUtils: JSON serialization failed for key '%@' with error: %@", key, error.localizedDescription);
                    jsonString = [value isKindOfClass:[NSDictionary class]] ? @"{}" : @"[]"; // Default to empty JSON container on failure
                }
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[jsonString UTF8String]);
            } else if ([value isKindOfClass:[NSString class]]) {
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[value UTF8String]);
            } else if ([value isKindOfClass:[NSNumber class]]) {
                NSNumber *numberValue = (NSNumber *)value;
                const char *type = [numberValue objCType];

                // Handle BOOL
                if (strcmp(type, @encode(BOOL)) == 0 || strcmp(type, @encode(bool)) == 0 || strcmp(type, @encode(char)) == 0) {
                    int boolValue = [numberValue boolValue] ? 1 : 0;
                    dsMapAddInt(dsMapIndex, (char *)cKey, boolValue);
                }
                // Handle integer types within int range
                else if (strcmp(type, @encode(int)) == 0 ||
                         strcmp(type, @encode(short)) == 0 ||
                         strcmp(type, @encode(unsigned int)) == 0 ||
                         strcmp(type, @encode(unsigned short)) == 0) {

                    int intValue = [numberValue intValue];
                    dsMapAddInt(dsMapIndex, (char *)cKey, intValue);
                }
                // Handle floating-point numbers
                else if (strcmp(type, @encode(float)) == 0 ||
                         strcmp(type, @encode(double)) == 0) {

                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
                // Handle signed long and long long
                else if (strcmp(type, @encode(long)) == 0 ||
                         strcmp(type, @encode(long long)) == 0) {

                    long long longValue = [numberValue longLongValue];
                    if (longValue >= INT_MIN && longValue <= INT_MAX) {
                        dsMapAddInt(dsMapIndex, (char *)cKey, (int)longValue);
                    } else if (llabs(longValue) <= (1LL << 53)) {
                        dsMapAddDouble(dsMapIndex, (char *)cKey, (double)longValue);
                    } else {
                        // Represent as special string format
                        NSString *formattedString = [NSString stringWithFormat:@"@i64@%llx$i64$", longValue];
                        dsMapAddString(dsMapIndex, (char *)cKey, (char *)[formattedString UTF8String]);
                    }
                }
                // Handle unsigned long and unsigned long long
                else if (strcmp(type, @encode(unsigned long)) == 0 ||
                         strcmp(type, @encode(unsigned long long)) == 0) {

                    unsigned long long ulongValue = [numberValue unsignedLongLongValue];
                    if (ulongValue <= (unsigned long long)INT_MAX) {
                        dsMapAddInt(dsMapIndex, (char *)cKey, (int)ulongValue);
                    } else if (ulongValue <= (1ULL << 53)) {
                        dsMapAddDouble(dsMapIndex, (char *)cKey, (double)ulongValue);
                    } else {
                        // Represent as special string format
                        NSString *formattedString = [NSString stringWithFormat:@"@i64@%llx$i64$", ulongValue];
                        dsMapAddString(dsMapIndex, (char *)cKey, (char *)[formattedString UTF8String]);
                    }
                } else {
                    // For other numeric types, default to adding as double
                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
            } else {
                // For other types, convert to string
                NSString *stringValue = [value description];
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[stringValue UTF8String]);
            }
        }
        CreateAsynEventWithDSMap(dsMapIndex, eventId);
    });
}

@end

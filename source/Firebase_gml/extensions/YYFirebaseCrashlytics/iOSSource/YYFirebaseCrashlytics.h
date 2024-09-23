#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseCrashlytics/FirebaseCrashlytics.h>

@interface YYFirebaseCrashlytics : NSObject

- (void)FirebaseCrashlytics_SetUserIdentifier:(NSString *)string;
- (void)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(id)value;
- (void)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString;
- (void)FirebaseCrashlytics_Log:(NSString *)message;
- (void)FirebaseCrashlytics_Crash:(NSString *)message;
- (void)FirebaseCrashlytics_RecordException:(NSString *)message;
- (void)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled;
- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check;
- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution;
- (void)FirebaseCrashlytics_UnsentReports_Delete;
- (void)FirebaseCrashlytics_UnsentReports_Send;
- (void)FirebaseCrashlytics_UnsentReports_Check;

@end
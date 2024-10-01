#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseCrashlytics/FirebaseCrashlytics.h>

@interface YYFirebaseCrashlytics : NSObject

@property (nonatomic, assign) BOOL isAutoDataCollectionEnabled;

- (double)FirebaseCrashlytics_SetUserIdentifier:(NSString *)string;
- (double)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(NSString *)value;
- (double)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString;
- (double)FirebaseCrashlytics_Log:(NSString *)message;
- (void)FirebaseCrashlytics_Crash:(NSString *)message;
- (void)FirebaseCrashlytics_RecordException:(NSString *)message;
- (void)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled;
- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check;
- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution;
- (double)FirebaseCrashlytics_UnsentReports_Delete;
- (double)FirebaseCrashlytics_UnsentReports_Send;
- (double)FirebaseCrashlytics_UnsentReports_Check;

@end
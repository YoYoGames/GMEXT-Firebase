#import "YYFirebaseStorage.h"
#import "FirebaseUtils.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap(int _num, ...);
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern UIViewController *g_controller;
extern UIView *g_glView;
extern int g_DeviceWidth;
extern int g_DeviceHeight;

extern "C" void dsMapClear(int _dsMap);
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

// Error Codes
static const double kFirebaseStorageSuccess = 0.0;
static const double kFirebaseStorageErrorNotFound = -1.0;

@interface YYFirebaseStorage ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, FIRStorageObservableTask<FIRStorageTaskManagement> *> *taskMap;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *lastProgressUpdateTime;

- (NSNumber *)getListenerInd;
- (NSString *)listOfReferencesToJSON:(NSArray<FIRStorageReference *> *)list; 
- (void)sendStorageEvent:(NSString *)eventType listener:(NSNumber*)listener path:(NSString *)path localPath:(NSString *)localPath success:(BOOL)success additionalData:(NSDictionary *)additionalData;
- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data;
- (void)throttleProgressUpdate:(NSNumber*)listenerInd eventType:(NSString *)eventType path:(NSString *)path localPath:(NSString *)localPath transferred:(int64_t)transferred total:(int64_t)total;

@end

@implementation YYFirebaseStorage

- (id)init {
    if (self = [super init]) {
        if (![FIRApp defaultApp]) {
            [FIRApp configure];
        }
        self.taskMap = [[NSMutableDictionary alloc] init];
        self.lastProgressUpdateTime = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (double)SDKFirebaseStorage_Cancel:(double)ind {
    NSNumber *listenerInd = @((long)ind); // Convert double to long
    FIRStorageObservableTask<FIRStorageTaskManagement> * task = self.taskMap[listenerInd];
    if (task) {
        [task cancel];
        [task removeAllObservers];
        [self.taskMap removeObjectForKey:listenerInd];
        [self.lastProgressUpdateTime removeObjectForKey:listenerInd];
        return kFirebaseStorageSuccess;
    }
    return kFirebaseStorageErrorNotFound;
}

- (double)SDKFirebaseStorage_Download:(NSString *)localPath firebasePath:(NSString *)firebasePath bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    
    // Get the Application Support directory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *appSupportDirectory = [paths firstObject];
    
    // Ensure the directory exists
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:appSupportDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSString *errorMessage = [NSString stringWithFormat:@"Error creating Application Support directory: %@", error.localizedDescription];
        NSDictionary *data = @{@"error": errorMessage};
        [self sendStorageEvent:@"FirebaseStorage_Download" listener:listenerInd path:firebasePath localPath:localPath success:NO additionalData:data];
        return [listenerInd doubleValue];
    }
    
    NSString *localFilePath = [appSupportDirectory stringByAppendingPathComponent:localPath];
    
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    NSURL *localURL = [NSURL fileURLWithPath:localFilePath];
    FIRStorageDownloadTask *downloadTask = [ref writeToFile:localURL];
    
    // Store the task in taskMap
    self.taskMap[listenerInd] = downloadTask;
    self.lastProgressUpdateTime[listenerInd] = @(0);
    
    [downloadTask observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self.taskMap removeObjectForKey:listenerInd];
        [self.lastProgressUpdateTime removeObjectForKey:listenerInd];
        [self sendStorageEvent:@"FirebaseStorage_Download" listener:listenerInd path:firebasePath localPath:localPath success:YES additionalData:nil];
    }];
    
    [downloadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self.taskMap removeObjectForKey:listenerInd];
        [self.lastProgressUpdateTime removeObjectForKey:listenerInd];
        NSDictionary *data = snapshot.error ? @{@"error": snapshot.error.localizedDescription} : nil;
        [self sendStorageEvent:@"FirebaseStorage_Download" listener:listenerInd path:firebasePath localPath:localPath success:NO additionalData:data];
    }];
    
    [downloadTask observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self throttleProgressUpdate:listenerInd eventType:@"FirebaseStorage_Download" path:firebasePath localPath:localPath transferred:snapshot.progress.completedUnitCount total:snapshot.progress.totalUnitCount];
    }];
    
    return [listenerInd doubleValue];
}

- (double)SDKFirebaseStorage_Upload:(NSString *)localPath firebasePath:(NSString *)firebasePath bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    
    // Get the Application Support directory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *appSupportDirectory = [paths firstObject];
    
    // Ensure the directory exists
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:appSupportDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSString *errorMessage = [NSString stringWithFormat:@"Error creating Application Support directory: %@", error.localizedDescription];
        NSDictionary *data = @{@"error": errorMessage};
        [self sendStorageEvent:@"FirebaseStorage_Upload" listener:listenerInd path:firebasePath localPath:localPath success:NO additionalData:data];
        return [listenerInd doubleValue];
    }
    
    NSString *localFilePath = [appSupportDirectory stringByAppendingPathComponent:localPath];
    
    // Check if the local file exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:localFilePath]) {
        NSDictionary *data = @{@"error": @"Local file does not exist"};
        [self sendStorageEvent:@"FirebaseStorage_Upload" listener:listenerInd path:firebasePath localPath:localPath success:NO additionalData:data];
        return [listenerInd doubleValue];
    }
    
    NSURL *localFile = [NSURL fileURLWithPath:localFilePath];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    FIRStorageUploadTask *uploadTask = [ref putFile:localFile metadata:nil];
    
    // Store the task in taskMap
    self.taskMap[listenerInd] = uploadTask;
    self.lastProgressUpdateTime[listenerInd] = @(0);
    
    [uploadTask observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self.taskMap removeObjectForKey:listenerInd];
        [self.lastProgressUpdateTime removeObjectForKey:listenerInd];
        [self sendStorageEvent:@"FirebaseStorage_Upload" listener:listenerInd path:firebasePath localPath:localPath success:YES additionalData:nil];
    }];
    
    [uploadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self.taskMap removeObjectForKey:listenerInd];
        [self.lastProgressUpdateTime removeObjectForKey:listenerInd];
        NSDictionary *data = snapshot.error ? @{@"error": snapshot.error.localizedDescription} : nil;
        [self sendStorageEvent:@"FirebaseStorage_Upload" listener:listenerInd path:firebasePath localPath:localPath success:NO additionalData:data];
    }];
    
    [uploadTask observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot *snapshot) {
        [self throttleProgressUpdate:listenerInd eventType:@"FirebaseStorage_Upload" path:firebasePath localPath:localPath transferred:snapshot.progress.completedUnitCount total:snapshot.progress.totalUnitCount];
    }];
    
    return [listenerInd doubleValue];
}

- (double)SDKFirebaseStorage_Delete:(NSString *)firebasePath bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    [ref deleteWithCompletion:^(NSError *error) {
        NSDictionary *data = error ? @{@"error": error.localizedDescription} : nil;
        BOOL success = (error == nil);
        [self sendStorageEvent:@"FirebaseStorage_Delete" listener:listenerInd path:firebasePath localPath:nil success:success additionalData:data];
    }];
    return [listenerInd doubleValue];
}

- (double)SDKFirebaseStorage_GetURL:(NSString *)firebasePath bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    [ref downloadURLWithCompletion:^(NSURL *URL, NSError *error) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        BOOL success = (error == nil);
        if (success) {
            data[@"value"] = URL.absoluteString;
        } else {
            data[@"error"] = error.localizedDescription;
        }
        [self sendStorageEvent:@"FirebaseStorage_GetURL" listener:listenerInd path:firebasePath localPath:nil success:success additionalData:data];
    }];
    return [listenerInd doubleValue];
}

- (double)SDKFirebaseStorage_List:(NSString *)firebasePath maxResults:(double)maxResults pageToken:(NSString *)pageToken bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    
    void (^completion)(FIRStorageListResult *result, NSError *error) = ^(FIRStorageListResult *result, NSError *error) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        BOOL success = (error == nil);
        if (success) {
            data[@"pageToken"] = result.pageToken ?: @"";
            data[@"files"] = [self listOfReferencesToJSON:result.items];
            data[@"folders"] = [self listOfReferencesToJSON:result.prefixes];
        } else {
            data[@"error"] = error.localizedDescription;
        }
        [self sendStorageEvent:@"FirebaseStorage_List" listener:listenerInd path:firebasePath localPath:nil success:success additionalData:data];
    };
    
    int64_t maxResultsInt64 = (int64_t)maxResults;
    if (pageToken.length == 0) {
        [ref listWithMaxResults:maxResultsInt64 completion:completion];
    } else {
        [ref listWithMaxResults:maxResultsInt64 pageToken:pageToken completion:completion];
    }
    
    return [listenerInd doubleValue];
}

- (double)SDKFirebaseStorage_ListAll:(NSString *)firebasePath bucket:(NSString *)bucket {
    NSNumber *listenerInd = [self getListenerInd];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    [ref listAllWithCompletion:^(FIRStorageListResult *result, NSError *error) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        BOOL success = (error == nil);
        if (success) {
            data[@"files"] = [self listOfReferencesToJSON:result.items];
            data[@"folders"] = [self listOfReferencesToJSON:result.prefixes];
        } else {
            data[@"error"] = error.localizedDescription;
        }
        [self sendStorageEvent:@"FirebaseStorage_ListAll" listener:listenerInd path:firebasePath localPath:nil success:success additionalData:data];
    }];
    return [listenerInd doubleValue];
}

#pragma mark - Helper Methods

- (NSNumber *)getListenerInd {
    return [[FirebaseUtils sharedInstance] getNextAsyncId];
}

- (NSString *)listOfReferencesToJSON:(NSArray<FIRStorageReference *> *)list {
    NSMutableArray *mutList = [NSMutableArray array];
    for (FIRStorageReference *ref in list) {
        [mutList addObject:ref.fullPath];
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mutList options:0 error:&error];
    if (!error) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
        return @"[]";
    }
}

- (void)sendStorageEvent:(NSString *)eventType listener:(NSNumber*)listener path:(NSString *)path localPath:(NSString *)localPath success:(BOOL)success additionalData:(NSDictionary *)additionalData {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:listener forKey:@"listener"];
    [data setObject:path forKey:@"path"];
    if (localPath) {
        [data setObject:localPath forKey:@"localPath"];
    }
    [data setObject:@(success) forKey:@"success"];

    if (additionalData) {
        [data setValuesForKeysWithDictionary:additionalData];
    }
    [self sendAsyncEventWithType:eventType data:data];
}

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, (char *)"type", (char *)[eventType UTF8String]);

        for (NSString *key in data) {
            id value = data[key];
            const char *cKey = [key UTF8String];

            if ([value isKindOfClass:[NSString class]]) {
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

        createSocialAsyncEventWithDSMap(dsMapIndex);
    });
}

- (void)throttleProgressUpdate:(NSNumber*)listenerInd eventType:(NSString *)eventType path:(NSString *)path localPath:(NSString *)localPath transferred:(int64_t)transferred total:(int64_t)total {
    static const NSTimeInterval MIN_PROGRESS_UPDATE_INTERVAL = 0.5; // 500ms
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval lastUpdateTime = [self.lastProgressUpdateTime[listenerInd] doubleValue];
    if (currentTime - lastUpdateTime >= MIN_PROGRESS_UPDATE_INTERVAL) {
        self.lastProgressUpdateTime[listenerInd] = @(currentTime);
        NSDictionary *data = @{
            @"transferred": @(transferred),
            @"total": @(total)
        };
        [self sendStorageEvent:eventType listener:listenerInd path:path localPath:localPath success:YES additionalData:data];
    }
}

@end

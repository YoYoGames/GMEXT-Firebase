
#import "YYFirebaseRealTime.h"
#import "FirebaseUtils.h" // Ensure this class exists and is thread-safe
#import <UIKit/UIKit.h> // For accessing UIApplication and dispatching to main thread

@interface YYFirebaseRealTime ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, FIRDatabaseReference *> *referenceMap;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *listenerMap;

@end

@implementation YYFirebaseRealTime

static const int EVENT_SOCIAL = 70;
static const long MAX_DOUBLE_SAFE = 9007199254740992L; // 2^53

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        _listenerMap = [NSMutableDictionary dictionary];
        _referenceMap = [NSMutableDictionary dictionary];

        // Enable offline persistence if needed
        // [[FIRDatabase database] setPersistenceEnabled:YES];
    }
    return self;
}

#pragma mark - Shutdown

- (void)shutdown {
    // Remove all listeners to prevent memory leaks
    [self removeAllListeners:-1]; // -1 signifies a global shutdown
}

#pragma mark - Main SDK Method

- (double)FirebaseRealTime_SDK:(NSString *)fluentJson {
    // Generate asyncId synchronously
    long asyncId = [[FirebaseUtils sharedInstance] getNextAsyncId];
    double asyncIdDouble = (double)asyncId;
    
    // Submit the processing task asynchronously via FirebaseUtils
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        NSError *jsonError;
        NSData *jsonData = [fluentJson dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *fluentObj = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
        
        if (jsonError || ![fluentObj isKindOfClass:[NSDictionary class]]) {
            NSLog(@"YYFirebaseRealTime: Invalid JSON input");
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK_Error"
                           asyncId:asyncId
                              path:nil
                            status:400
                         extraData:@{@"errorMessage": @"Invalid JSON input"}];
            return;
        }
        
        NSString *action = fluentObj[@"action"];
        if (!action || ![action isKindOfClass:[NSString class]]) {
            NSLog(@"YYFirebaseRealTime: Action not specified in JSON");
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK_Error"
                           asyncId:asyncId
                              path:nil
                            status:400
                         extraData:@{@"errorMessage": @"Action not specified in JSON"}];
            return;
        }
        
        // Switch-case equivalent using if-else
        if ([action isEqualToString:@"Set"]) {
            [self setValue:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"Read"]) {
            [self readValue:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"Listener"]) {
            [self listenValue:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"Exists"]) {
            [self existsValue:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"Delete"]) {
            [self deleteValue:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"ListenerRemove"]) {
            [self removeListener:asyncId fluentObj:fluentObj];
        } else if ([action isEqualToString:@"ListenerRemoveAll"]) {
            [self removeAllListeners:asyncId];
        } else {
            NSLog(@"YYFirebaseRealTime: Unknown action: %@", action);
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK_Error"
                           asyncId:asyncId
                              path:nil
                            status:400
                         extraData:@{@"errorMessage": [NSString stringWithFormat:@"Unknown action: %@", action]}];
        }
    }];
    
    return asyncIdDouble;
}

#pragma mark - Action Methods

/**
 * Handles the "Set" action to write data to Firebase.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)setValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    id value = fluentObj[@"value"];
    NSString *path = fluentObj[@"path"];
    
    if ([value isKindOfClass:[NSString class]]) {
        NSError *jsonError;
        NSData *jsonData = [(NSString *)value dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *valueDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
        if (!jsonError && [valueDict isKindOfClass:[NSDictionary class]]) {
            value = valueDict;
        }
    }
    
    FIRDatabaseReference *reference = [self buildReference:fluentObj];
    [reference setValue:value withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        int status = (error == nil) ? 200 : [self mapDatabaseErrorToHttpStatus:error];
        NSDictionary *extraData = (error != nil) ? @{@"errorMessage": error.localizedDescription} : nil;
        [self sendDatabaseEvent:@"FirebaseRealTime_Set"
                        asyncId:asyncId
                            path:path
                        status:status
                        extraData:extraData];
    }];
}

/**
 * Handles the "Read" action to read data from Firebase.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)readValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    FIRDatabaseReference *dataRef = [self buildReference:fluentObj];
    FIRDatabaseQuery *query = [self buildQuery:fluentObj dataRef:dataRef];
    
    ValueEventListener *eventListener = [self createValueEventListener:@"FirebaseRealTime_Read"
                                                                asyncId:asyncId
                                                                    path:fluentObj[@"path"]];
    
    [query observeSingleEventOfType:FIRDataEventTypeValue withBlock:eventListener];
}

/**
 * Handles the "Listener" action to listen for data changes in Firebase.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)listenValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    FIRDatabaseReference *dataRef = [self buildReference:fluentObj];
    FIRDatabaseQuery *query = [self buildQuery:fluentObj dataRef:dataRef];
    
    ValueEventListener *eventListener = [self createValueEventListener:@"FirebaseRealTime_Listener"
                                                                asyncId:asyncId
                                                                    path:fluentObj[@"path"]];
    
    FIRDatabaseHandle handle = [query observeEventType:FIRDataEventTypeValue withBlock:eventListener];
    
    NSNumber *handleNumber = @(handle);
    NSNumber *asyncIdNumber = @(asyncId);
    
    @synchronized (self) {
        self.listenerMap[asyncIdNumber] = handleNumber;
        self.referenceMap[asyncIdNumber] = dataRef;
    }
}

/**
 * Handles the "Delete" action to remove data from Firebase.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)deleteValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    FIRDatabaseReference *ref = [self buildReference:fluentObj];
    [ref removeValueWithCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        int status = (error == nil) ? 200 : [self mapDatabaseErrorToHttpStatus:error];
        NSDictionary *extraData = (error != nil) ? @{@"errorMessage": error.localizedDescription} : nil;
        [self sendDatabaseEvent:@"FirebaseRealTime_Delete"
                        asyncId:asyncId
                            path:fluentObj[@"path"]
                        status:status
                        extraData:extraData];
    }];
}

/**
 * Handles the "Exists" action to check data existence in Firebase.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)existsValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    FIRDatabaseReference *ref = [self buildReference:fluentObj];
    [ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSNumber *exists = snapshot.exists ? @1.0 : @0.0;
        NSDictionary *extraData = @{@"value": exists};
        [self sendDatabaseEvent:@"FirebaseRealTime_Exists"
                        asyncId:asyncId
                            path:fluentObj[@"path"]
                        status:200
                        extraData:extraData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSDictionary *extraData = @{@"errorMessage": error.localizedDescription};
        int status = [self mapDatabaseErrorToHttpStatus:error];
        [self sendDatabaseEvent:@"FirebaseRealTime_Exists"
                        asyncId:asyncId
                            path:fluentObj[@"path"]
                        status:status
                        extraData:extraData];
    }];
}

/**
 * Handles the "ListenerRemove" action to remove a specific Firebase listener.
 *
 * @param asyncId The unique async ID.
 * @param fluentObj The JSON object containing parameters.
 */
- (void)removeListener:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSNumber *listenerToRemove = fluentObj[@"value"];
    NSString *path = fluentObj[@"path"];
    
    if (!listenerToRemove || ![listenerToRemove isKindOfClass:[NSNumber class]]) {
        NSLog(@"YYFirebaseRealTime: Unable to extract listener id.");
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                        asyncId:-1
                            path:path
                        status:400
                        extraData:@{@"errorMessage": @"Unable to extract listener id."}];
        return;
    }
    
    NSNumber *asyncIdNumber = @(asyncId);
    NSNumber *handleNumber;
    FIRDatabaseReference *dataRef;
    
    @synchronized (self) {
        handleNumber = self.listenerMap[listenerToRemove];
        dataRef = self.referenceMap[listenerToRemove];
    }
    
    if (handleNumber && dataRef) {
        FIRDatabaseHandle handle = [handleNumber longValue];
        [dataRef removeObserverWithHandle:handle];
        
        @synchronized (self) {
            [self.listenerMap removeObjectForKey:listenerToRemove];
            [self.referenceMap removeObjectForKey:listenerToRemove];
        }
        
        NSDictionary *extraData = @{@"value": listenerToRemove};
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                        asyncId:asyncId
                            path:path
                        status:200
                        extraData:extraData];
    } else {
        NSLog(@"YYFirebaseRealTime: Listener or DatabaseReference not found for ID: %@", listenerToRemove);
        NSDictionary *extraData = @{@"errorMessage": [NSString stringWithFormat:@"Listener or DatabaseReference not found for ID: %@", listenerToRemove]};
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                        asyncId:asyncId
                            path:path
                        status:400
                        extraData:extraData];
    }
}

/**
 * Handles the "ListenerRemoveAll" action to remove all Firebase listeners.
 *
 * @param asyncId The unique async ID.
 */
- (void)removeAllListeners:(long)asyncId {
    NSMutableArray *removedListeners = [NSMutableArray array];
    
    @synchronized (self) {
        for (NSNumber *listenerId in self.referenceMap.allKeys) {
            FIRDatabaseHandle handle = [self.listenerMap[listenerId] longValue];
            FIRDatabaseReference *ref = self.referenceMap[listenerId];
            [ref removeObserverWithHandle:handle];
            [removedListeners addObject:listenerId];
        }
        
        [self.listenerMap removeAllObjects];
        [self.referenceMap removeAllObjects];
    }
    
    NSString *jsonString = [self convertListToJsonString:removedListeners];
    NSDictionary *extraData = @{@"values": jsonString};
    [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListeners"
                    asyncId:asyncId
                        path:nil
                    status:200
                    extraData:extraData];
}

#pragma mark - Helper Methods

/**
 * Creates a new ValueEventListener for listening data changes in Firebase.
 *
 * @param eventType The type of event.
 * @param asyncId The unique async ID.
 * @param path The Firebase database path related to the event.
 * @return A block to handle data changes.
 */
- (FIRDataEventBlock)createValueEventListener:(NSString *)eventType asyncId:(long)asyncId path:(NSString *)path {
    return ^(FIRDataSnapshot * _Nonnull snapshot) {
        NSMutableDictionary *extraData = [NSMutableDictionary dictionary];
        
        if (snapshot.exists) {
            id dataValue = snapshot.value;
            if ([dataValue isKindOfClass:[NSNumber class]]) {
                extraData[@"value"] = @([dataValue doubleValue]);
            } else if ([dataValue isKindOfClass:[NSString class]]) {
                extraData[@"value"] = dataValue;
            } else if ([dataValue isKindOfClass:[NSDictionary class]]) {
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataValue options:0 error:&error];
                if (!error) {
                    extraData[@"value"] = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                } else {
                    extraData[@"value"] = @"{}";
                }
            } else if ([dataValue isKindOfClass:[NSArray class]]) {
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataValue options:0 error:&error];
                if (!error) {
                    extraData[@"value"] = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                } else {
                    extraData[@"value"] = @"[]";
                }
            } else {
                extraData[@"value"] = [NSString stringWithFormat:@"%@", dataValue];
            }
        }
        
        [self sendDatabaseEvent:eventType
                       asyncId:asyncId
                          path:path
                        status:200
                     extraData:extraData];
    };
}

/**
 * Creates a new FIRDatabaseError block for handling cancellations.
 *
 * @param eventType The type of event.
 * @param asyncId The unique async ID.
 * @param path The Firebase database path related to the event.
 * @return A block to handle cancellations.
 */
- (FIRDatabaseErrorBlock)createDatabaseErrorBlock:(NSString *)eventType asyncId:(long)asyncId path:(NSString *)path {
    return ^(NSError * _Nonnull error) {
        NSDictionary *extraData = @{@"errorMessage": error.localizedDescription};
        int status = [self mapDatabaseErrorToHttpStatus:error];
        [self sendDatabaseEvent:eventType
                       asyncId:asyncId
                          path:path
                        status:status
                     extraData:extraData];
    };
}

/**
 * Creates a DatabaseReference based on the provided JSON parameters.
 *
 * @param fluentObj The JSON object containing parameters.
 * @return The constructed FIRDatabaseReference.
 */
- (FIRDatabaseReference *)buildReference:(NSDictionary *)fluentObj {
    FIRDatabaseReference *dataRef;
    NSString *databaseUrl = fluentObj[@"database"];
    
    if (databaseUrl && [databaseUrl isKindOfClass:[NSString class]]) {
        dataRef = [[[FIRDatabase database] reference] child:databaseUrl];
    } else {
        dataRef = [[FIRDatabase database] reference];
    }
    
    NSString *path = fluentObj[@"path"];
    if (path && [path isKindOfClass:[NSString class]]) {
        dataRef = [dataRef child:path];
    }
    
    BOOL push = [fluentObj[@"push"] boolValue];
    if (push) {
        dataRef = [dataRef childByAutoId];
    }
    
    return dataRef;
}

/**
 * Constructs a Firebase Query based on the provided JSON parameters and DatabaseReference.
 *
 * @param fluentObj The JSON object containing query parameters.
 * @param dataRef   The FIRDatabaseReference to build the query from.
 * @return The constructed FIRDatabaseQuery.
 */
- (FIRDatabaseQuery *)buildQuery:(NSDictionary *)fluentObj dataRef:(FIRDatabaseReference *)dataRef {
    FIRDatabaseQuery *query = dataRef;
    
    NSString *orderBy = fluentObj[@"order_by"];
    if (orderBy && [orderBy isKindOfClass:[NSString class]]) {
        if ([orderBy isEqualToString:@"key"]) {
            query = [query queryOrderedByKey];
        } else if ([orderBy isEqualToString:@"value"]) {
            query = [query queryOrderedByValue];
        } else {
            query = [query queryOrderedByChild:orderBy];
        }
    }
    
    id startValue = fluentObj[@"start_value"];
    if (startValue) {
        if ([startValue isKindOfClass:[NSString class]] || [startValue isKindOfClass:[NSNumber class]]) {
            query = [query queryStartingAtValue:startValue];
        }
    }
    
    id endValue = fluentObj[@"end_value"];
    if (endValue) {
        if ([endValue isKindOfClass:[NSString class]] || [endValue isKindOfClass:[NSNumber class]]) {
            query = [query queryEndingAtValue:endValue];
        }
    }
    
    id equalTo = fluentObj[@"equal_to"];
    if (equalTo) {
        if ([equalTo isKindOfClass:[NSString class]] || [equalTo isKindOfClass:[NSNumber class]]) {
            query = [query queryEqualToValue:equalTo];
        }
    }
    
    NSInteger limitKind = [fluentObj[@"limit_kind"] integerValue];
    NSInteger limitValue = [fluentObj[@"limit_value"] integerValue];
    if (limitKind != -1 && limitValue != -1) {
        switch (limitKind) {
            case 0:
                query = [query queryLimitedToFirst:limitValue];
                break;
            case 1:
                query = [query queryLimitedToLast:limitValue];
                break;
            default:
                break;
        }
    }
    
    return query;
}

/**
 * Maps a Firebase DatabaseError to an appropriate HTTP status code.
 *
 * @param error The NSError representing the Firebase error.
 * @return The corresponding HTTP status code as an int.
 */
- (int)mapDatabaseErrorToHttpStatus:(NSError *)error {
    // Firebase errors have domains and codes
    if (![error.domain isEqualToString:FIRDatabaseErrorDomain]) {
        return 400;
    }
    
    FIRDatabaseErrorCode code = (FIRDatabaseErrorCode)error.code;
    switch (code) {
        case FIRDatabaseErrorDisconnected:
            return 400;
        case FIRDatabaseErrorExpiredToken:
        case FIRDatabaseErrorInvalidToken:
        case FIRDatabaseErrorPermissionDenied:
            return 401;
        case FIRDatabaseErrorMaxRetries:
        case FIRDatabaseErrorNetworkError:
        case FIRDatabaseErrorOperationFailed:
        case FIRDatabaseErrorOverriddenBySet:
        case FIRDatabaseErrorUnknownError:
        case FIRDatabaseErrorUserCodeException:
        case FIRDatabaseErrorWriteCanceled:
            return 400;
        case FIRDatabaseErrorUnavailable:
            return 503;
        default:
            return 400;
    }
}

/**
 * Sends a database event by assembling common data and delegating to sendAsyncEvent.
 *
 * @param eventType The type of event.
 * @param asyncId The unique async ID.
 * @param path The Firebase database path related to the event.
 * @param status The HTTP status code representing the result.
 * @param extraData Additional data to include in the event.
 */
- (void)sendDatabaseEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status extraData:(nullable NSDictionary *)extraData {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    data[@"listener"] = @(asyncId);
    
    if (path) {
        data[@"path"] = path;
    }
    
    data[@"status"] = @(status);
    
    if (extraData) {
        [data addEntriesFromDictionary:extraData];
    }
    
    [[FirebaseUtils sharedInstance] sendAsyncEvent:eventType data:data];
}

/**
 * Converts a List to a JSON string.
 *
 * @param list The NSArray to convert.
 * @return The JSON string representation of the list.
 */
- (NSString *)convertListToJsonString:(NSArray *)list {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:list options:0 error:&error];
    if (error) {
        NSLog(@"YYFirebaseRealTime: Error converting list to JSON - %@", error.localizedDescription);
        return @"[]";
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/**
 * Converts a Map to a JSON string.
 *
 * @param map The NSDictionary to convert.
 * @return The JSON string representation of the map.
 */
- (NSString *)convertMapToJsonString:(NSDictionary *)map {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:map options:0 error:&error];
    if (error) {
        NSLog(@"YYFirebaseRealTime: Error converting map to JSON - %@", error.localizedDescription);
        return @"{}";
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark - Memory Management

- (void)dealloc {
    [self removeAllListeners:-1];
}

@end

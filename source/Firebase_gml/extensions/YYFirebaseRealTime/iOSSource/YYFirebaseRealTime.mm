// YYFirebaseRealTime.m

#import "YYFirebaseRealTime.h"
#import "FirebaseUtils.h"

@interface YYFirebaseRealTime ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *listenerMap;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, FIRDatabaseReference *> *referenceMap;

- (void)setValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)readValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)listenValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)deleteValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)existsValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)removeListener:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)removeAllListeners:(long)asyncId;
- (NSDictionary<NSString *, void (^)(id)> *)createValueEventListener:(NSString *)eventType asyncId:(long)asyncId path:(NSString *)path;
- (FIRDatabaseReference *)buildReference:(NSDictionary *)fluentObj;
- (FIRDatabaseQuery *)buildQuery:(long)asyncId eventType:(NSString *)eventType fluentObj:(NSDictionary *)fluentObj dataRef:(FIRDatabaseReference *)dataRef;
- (int)mapDatabaseErrorToHttpStatus:(NSError *)error;
- (void)sendDatabaseEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status extraData:(nullable NSDictionary *)extraData;

@end

@implementation YYFirebaseRealTime

- (instancetype)init {
    if (self = [super init]) {
        if (![FIRApp defaultApp]) {
            [FIRApp configure];
        }
        self.listenerMap = [NSMutableDictionary dictionary];
        self.referenceMap = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Main SDK Method

- (double)FirebaseRealTime_SDK:(NSString *)fluentJson { 
    // Generate asyncId synchronously
    long asyncId = [[FirebaseUtils sharedInstance] getNextAsyncId];

    // Submit async task
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        NSError *jsonError = nil;
        NSDictionary *fluentObj = [NSJSONSerialization JSONObjectWithData:[fluentJson dataUsingEncoding:NSUTF8StringEncoding]
                                                                   options:0
                                                                     error:&jsonError];
        
        if (jsonError || ![fluentObj isKindOfClass:[NSDictionary class]]) {
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK"
                           asyncId:asyncId
                              path:nil
                            status:400
                        extraData:@{@"errorMessage": @"Invalid JSON input"}];
            return;
        }
        
        NSString *action = fluentObj[@"action"];
        if (!action || ![action isKindOfClass:[NSString class]]) {
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK"
                           asyncId:asyncId
                              path:nil
                            status:400
                        extraData:@{@"errorMessage": @"Action not specified in JSON"}];
            return;
        }
        
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
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK"
                           asyncId:asyncId
                              path:nil
                            status:400
                        extraData:@{@"errorMessage": [NSString stringWithFormat:@"Unknown action: %@", action]}];
        }
    } completion:^(NSError * _Nullable error) {
        if (error != nil) {
            [self sendDatabaseEvent:@"FirebaseRealTime_SDK"
                        asyncId:asyncId
                            path:nil
                            status:400
                        extraData:@{@"errorMessage": error.localizedFailureReason}];
        }
    }];
    
    return (double)asyncId;
}

#pragma mark - Action Handlers

- (void)setValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    id value = fluentObj[@"value"];
    NSString *path = fluentObj[@"path"];
    
    id convertedValue = [[FirebaseUtils sharedInstance] convertJSON:value];
    
    FIRDatabaseReference *reference = [self buildReference:fluentObj];
    [reference setValue:convertedValue withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        int status = (error == nil) ? 200 : [self mapDatabaseErrorToHttpStatus:error];
        NSDictionary *extraData = (error != nil) ? @{@"errorMessage": error.localizedDescription} : nil;
        
        [self sendDatabaseEvent:@"FirebaseRealTime_Set"
                       asyncId:asyncId
                          path:path
                        status:status
                    extraData:extraData];
    }];
}

- (void)readValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    FIRDatabaseReference *dataRef = [self buildReference:fluentObj];
    FIRDatabaseQuery *query = [self buildQuery:asyncId
                                        eventType:@"FirebaseRealTime_Read"
                                         fluentObj:fluentObj
                                           dataRef:dataRef];
    
    if (!query) return;
    
    // Create the ValueEventListener equivalent
    NSDictionary<NSString *, void (^)(id)> *listenerBlocks = [self createValueEventListener:@"FirebaseRealTime_Read"
                                                                                                 asyncId:asyncId
                                                                                                    path:path];
    
    [query observeSingleEventOfType:FIRDataEventTypeValue withBlock:listenerBlocks[@"onDataChange"] withCancelBlock:listenerBlocks[@"onCancel"]];
}

- (void)listenValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    FIRDatabaseReference *dataRef = [self buildReference:fluentObj];
    FIRDatabaseQuery *query = [self buildQuery:asyncId
                                        eventType:@"FirebaseRealTime_Listener"
                                         fluentObj:fluentObj
                                           dataRef:dataRef];
    
    if (!query) return;
    
    // Create the ValueEventListener equivalent
    NSDictionary<NSString *, void (^)(id)> *listenerBlocks = [self createValueEventListener:@"FirebaseRealTime_Listener"
                                                                                                 asyncId:asyncId
                                                                                                    path:path];
    
    FIRDatabaseHandle handle = [query observeEventType:FIRDataEventTypeValue withBlock:listenerBlocks[@"onDataChange"] withCancelBlock:listenerBlocks[@"onCancel"]];
    
    NSNumber *asyncIdNumber = @(asyncId);
    self.listenerMap[asyncIdNumber] = @(handle);
    self.referenceMap[asyncIdNumber] = dataRef;
}

- (void)deleteValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    FIRDatabaseReference *ref = [self buildReference:fluentObj];
    
    [ref removeValueWithCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        int status = (error == nil) ? 200 : [self mapDatabaseErrorToHttpStatus:error];
        NSDictionary *extraData = (error != nil) ? @{@"errorMessage": error.localizedDescription} : nil;
        
        [self sendDatabaseEvent:@"FirebaseRealTime_Delete"
                       asyncId:asyncId
                          path:path
                        status:status
                    extraData:extraData];
    }];
}

- (void)existsValue:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    FIRDatabaseReference *ref = [self buildReference:fluentObj];
    
    [ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSNumber *exists = @(snapshot.exists);
        NSDictionary *extraData = @{@"value": exists.boolValue ? @1.0 : @0.0};
        
        [self sendDatabaseEvent:@"FirebaseRealTime_Exists"
                       asyncId:asyncId
                          path:path
                        status:200
                    extraData:extraData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSDictionary *extraData = @{@"errorMessage": error.localizedDescription};
        [self sendDatabaseEvent:@"FirebaseRealTime_Exists"
                       asyncId:asyncId
                          path:path
                        status:[self mapDatabaseErrorToHttpStatus:error]
                    extraData:extraData];
    }];
}

- (void)removeListener:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSNumber *listenerToRemove = @([fluentObj[@"value"] longValue]);
    
    if ([listenerToRemove longValue] == -1) {
        NSDictionary *extraData = @{@"errorMessage": @"Unable to extract listener id."};
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                       asyncId:asyncId
                          path:nil
                        status:400
                    extraData:extraData];
        return;
    }
    
    FIRDatabaseReference *dataRef = self.referenceMap[listenerToRemove];
    NSNumber *handleNumber = self.listenerMap[listenerToRemove];
    
    if (dataRef && handleNumber) {
        FIRDatabaseHandle handle = [handleNumber longValue];
        [dataRef removeObserverWithHandle:handle];
        [self.listenerMap removeObjectForKey:listenerToRemove];
        [self.referenceMap removeObjectForKey:listenerToRemove];
        
        NSDictionary *extraData = @{@"value": listenerToRemove};
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                       asyncId:asyncId
                          path:dataRef.URL
                        status:200
                    extraData:extraData];
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Listener or DatabaseReference not found for ID: %@", listenerToRemove];
        NSDictionary *extraData = @{@"errorMessage": errorMsg};
        [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListener"
                       asyncId:asyncId
                          path:dataRef.URL
                        status:400
                    extraData:extraData];
    }
}

- (void)removeAllListeners:(long)asyncId {
    NSMutableArray<NSNumber *> *removedListeners = [NSMutableArray array];
    
    NSArray<NSNumber *> *keys = [self.referenceMap allKeys];
    for (NSNumber *listenerToRemove in keys) {
        FIRDatabaseReference *dataRef = self.referenceMap[listenerToRemove];
        NSNumber *handleNumber = self.listenerMap[listenerToRemove];
        if (dataRef && handleNumber) {
            FIRDatabaseHandle handle = [handleNumber longValue];
            [dataRef removeObserverWithHandle:handle];
            [removedListeners addObject:listenerToRemove];
        }
    }
    [self.listenerMap removeAllObjects];
    [self.referenceMap removeAllObjects];
    
    NSDictionary *extraData = @{@"values": removedListeners};
    [self sendDatabaseEvent:@"FirebaseRealTime_RemoveListeners"
                   asyncId:asyncId
                      path:nil
                    status:200
                extraData:extraData];
}

#pragma mark - Helper Methods

- (NSDictionary<NSString *, void (^)(id)> *)createValueEventListener:(NSString *)eventType
                                                                            asyncId:(long)asyncId
                                                                               path:(NSString *)path {
    __weak YYFirebaseRealTime *weakSelf = self;
    id onDataChange = ^(FIRDataSnapshot * _Nonnull snapshot) {
        __strong YYFirebaseRealTime *strongSelf = weakSelf;
        if (!strongSelf) return;
        
        NSMutableDictionary *extraData = [NSMutableDictionary dictionary];
        
        if (snapshot.exists) {
            id dataValue = snapshot.value;
            if ([dataValue isKindOfClass:[NSArray class]] || [dataValue isKindOfClass:[NSMutableArray class]]) {
                if ([snapshot hasChildren]) {
                    NSMutableArray *list = [NSMutableArray array];
                    
                    // Enumerate through each child snapshot
                    for (FIRDataSnapshot *childSnapshot in snapshot.children) {
                        id childValue = childSnapshot.value;
                        if (childValue) {
                            [list addObject:childValue];
                        }
                    }
                    dataValue = [list copy];
                }
            }
            extraData[@"value"] = dataValue;
        }
        
        [strongSelf sendDatabaseEvent:eventType
                           asyncId:asyncId
                              path:path
                            status:200
                        extraData:extraData];
    };
    
    id onCancel = ^(NSError * _Nonnull error) {
        __strong YYFirebaseRealTime *strongSelf = weakSelf;
        if (!strongSelf) return;
        
        NSDictionary *extraData = @{@"errorMessage": error.localizedDescription};
        int status = [strongSelf mapDatabaseErrorToHttpStatus:error];
        
        [strongSelf sendDatabaseEvent:eventType
                           asyncId:asyncId
                              path:path
                            status:status
                        extraData:extraData];
    };
    
    return @{@"onDataChange": onDataChange, @"onCancel": onCancel};
}

- (FIRDatabaseReference *)buildReference:(NSDictionary *)fluentObj {
    FIRDatabaseReference *dataRef;
    NSString *databaseUrl = fluentObj[@"database"];
    
    if (databaseUrl && [databaseUrl isKindOfClass:[NSString class]]) {
        dataRef = [[FIRDatabase database] referenceFromURL:databaseUrl];
    } else {
        dataRef = [[FIRDatabase database] reference];
    }
    
    NSString *path = fluentObj[@"path"];
    if (path && [path isKindOfClass:[NSString class]]) {
        dataRef = [dataRef child:path];
    }
    
    id pushValue = fluentObj[@"push"];
    if ([pushValue isKindOfClass:[NSNumber class]] && [pushValue boolValue]) {
        dataRef = [dataRef childByAutoId];
    }
    
    return dataRef;
}

- (FIRDatabaseQuery *)buildQuery:(long)asyncId
                           eventType:(NSString *)eventType
                            fluentObj:(NSDictionary *)fluentObj
                              dataRef:(FIRDatabaseReference *)dataRef {
    FIRDatabaseQuery *query = dataRef;
    
    NSString *orderBy = fluentObj[@"orderBy"];
    if (orderBy && [orderBy isKindOfClass:[NSString class]]) {
        if ([orderBy isEqualToString:@"$key"]) {
            query = [query queryOrderedByKey];
        }
        else if ([orderBy isEqualToString:@"$value"]) {
            query = [query queryOrderedByValue];
        }
        else if ([orderBy isEqualToString:@"$priority"]) {
            query = [query queryOrderedByPriority];
        }
        else {
            // Default to ordering by child property
            query = [query queryOrderedByChild:orderBy];
        }
    }
    
    // Apply additional query parameters (equalTo or range queries)
    id equalTo = fluentObj[@"equalTo"];
    id startAt = fluentObj[@"startAt"];
    id startAfter = fluentObj[@"startAfter"];
    id endAt = fluentObj[@"endAt"];
    id endBefore = fluentObj[@"endBefore"];
    
    if (equalTo && ![equalTo isKindOfClass:[NSNull class]]) {
        if ([equalTo isKindOfClass:[NSString class]] ||
            [equalTo isKindOfClass:[NSNumber class]] ) {
            query = [query queryEqualToValue:equalTo];
        }
    } else {
        // You can only use one of these (startAt or startAfter)
        if (startAt && ![startAt isKindOfClass:[NSNull class]]) {
            if ([startAt isKindOfClass:[NSString class]] ||
                [startAt isKindOfClass:[NSNumber class]] ) {
                query = [query queryStartingAtValue:startAt];
            }
        }
        else if (startAfter && ![startAfter isKindOfClass:[NSNull class]]) {
            if ([startAfter isKindOfClass:[NSString class]] ||
                [startAfter isKindOfClass:[NSNumber class]] ) {
                query = [query queryStartingAfterValue:startAfter];
            }
        }
        
        // You can only use one of these (endAt or endBefore)
        if (endAt && ![endAt isKindOfClass:[NSNull class]]) {
            if ([endAt isKindOfClass:[NSString class]] ||
                [endAt isKindOfClass:[NSNumber class]] ) {
                query = [query queryEndingAtValue:endAt];
            }
        }
        else if (endBefore && ![endBefore isKindOfClass:[NSNull class]]) {
            if ([endBefore isKindOfClass:[NSString class]] ||
                [endBefore isKindOfClass:[NSNumber class]] ) {
                query = [query queryEndingBeforeValue:endBefore];
            }
        }
    }

    // Apply limit queries
    NSNumber *limitToFirst = fluentObj[@"limitToFirst"];
    NSNumber *limitToLast = fluentObj[@"limitToLast"];
    
    if (limitToFirst && [limitToFirst isKindOfClass:[NSNumber class]]) {
        query = [query queryLimitedToFirst:[limitToFirst integerValue]];
    }
    
    if (limitToLast && [limitToLast isKindOfClass:[NSNumber class]]) {
        query = [query queryLimitedToLast:[limitToLast integerValue]];
    }
    
    return query;
}

- (int)mapDatabaseErrorToHttpStatus:(NSError *)error {
    //I found this error codes in FirebaseDatabase/Sources/Utilities/FUtilities.m
    if(error)
    {
        switch(error.code)
        {
            case 1:
                return 401;
            case 2:
                return 503;
                break;
            case 3:
                return 400;
            default:
                return 400;
        };
    }
    else
        return 200;
}

- (void)sendDatabaseEvent:(NSString *)eventType
                asyncId:(long)asyncId
                   path:(nullable NSString *)path
                 status:(int)status
             extraData:(nullable NSDictionary *)extraData {
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

@end

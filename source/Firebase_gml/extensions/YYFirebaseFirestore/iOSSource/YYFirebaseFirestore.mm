${YYIos_FirebaseFirestore_Skip_Start}

#import "YYFirebaseFirestore.h"
#import "FirebaseUtils.h"

@interface YYFirebaseFirestore ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, id<FIRListenerRegistration>> *listenerMap;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSString *> *pathMap;

// Define action constants
typedef NS_ENUM(NSInteger, FirestoreAction) {
    ACTION_ADD = 0,
    ACTION_SET,
    ACTION_UPDATE,
    ACTION_READ,
    ACTION_LISTENER,
    ACTION_DELETE,
    ACTION_QUERY,
    ACTION_LISTENER_REMOVE,
    ACTION_LISTENER_REMOVE_ALL
};

typedef NS_ENUM(NSInteger, QueryFilter) {
    QUERY_FILTER_LT = 0,
    QUERY_FILTER_LT_EQ,
    QUERY_FILTER_GT,
    QUERY_FILTER_GT_EQ,
    QUERY_FILTER_EQ,
    QUERY_FILTER_NEQ
};

typedef NS_ENUM(NSInteger, QuerySort) {
    QUERY_SORT_ASCN = 0,
    QUERY_SORT_DESC
};

// Methods
- (void)documentSet:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)documentUpdate:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)documentGet:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)documentDelete:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)documentListen:(long)asyncId fluentObj:(NSDictionary *)fluentObj;

- (void)collectionAdd:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)collectionGet:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)collectionQuery:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)collectionListen:(long)asyncId fluentObj:(NSDictionary *)fluentObj;

- (void)listenerRemove:(long)asyncId fluentObj:(NSDictionary *)fluentObj;
- (void)listenerRemoveAll:(long)asyncId;

- (BOOL)validatePath:(NSString *)path eventType:(NSString *)eventType asyncId:(long)asyncId;
- (void)sendFirestoreEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status extraData:(nullable NSDictionary *)extraData;
- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status errorMessage:(NSString *)errorMessage;
- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path exception:(NSError *)exception;
- (int)getStatusFromError:(NSError *)error;
- (NSDictionary *)convertQuerySnapshotToDictionary:(FIRQuerySnapshot *)querySnapshot;

@end

@implementation YYFirebaseFirestore

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize dictionaries
        self.listenerMap = [NSMutableDictionary dictionary];
        self.pathMap = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Public API Method

- (double)FirebaseFirestore_SDK:(NSString *)fluentJson {
    long asyncId = [[FirebaseUtils sharedInstance] getNextAsyncId];
    
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        NSError *jsonError;
        NSDictionary *fluentObj = [NSJSONSerialization JSONObjectWithData:[fluentJson dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&jsonError];
        
        if (jsonError || ![fluentObj isKindOfClass:[NSDictionary class]]) {
            [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"Invalid JSON input."];
            return;
        }
        
        NSNumber *actionNumber = fluentObj[@"action"];
        if (!actionNumber || ![actionNumber isKindOfClass:[NSNumber class]]) {
            [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"Action not specified in JSON."];
            return;
        }
        FirestoreAction action = (FirestoreAction)[actionNumber integerValue];
        
        BOOL isDocument = [fluentObj[@"isDocument"] boolValue];
        
        switch (action) {
            case ACTION_ADD:
                if (isDocument) {
                    [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"You can't add to a Document."];
                } else {
                    [self collectionAdd:asyncId fluentObj:fluentObj];
                }
                break;
            case ACTION_SET:
                if (isDocument) {
                    [self documentSet:asyncId fluentObj:fluentObj];
                } else {
                    [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"You can't set a Collection."];
                }
                break;
            case ACTION_UPDATE:
                if (isDocument) {
                    [self documentUpdate:asyncId fluentObj:fluentObj];
                } else {
                    [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"You can't update a Collection."];
                }
                break;
            case ACTION_READ:
                if (isDocument) {
                    [self documentGet:asyncId fluentObj:fluentObj];
                } else {
                    [self collectionGet:asyncId fluentObj:fluentObj];
                }
                break;
            case ACTION_LISTENER:
                if (isDocument) {
                    [self documentListen:asyncId fluentObj:fluentObj];
                } else {
                    [self collectionListen:asyncId fluentObj:fluentObj];
                }
                break;
            case ACTION_DELETE:
                if (isDocument) {
                    [self documentDelete:asyncId fluentObj:fluentObj];
                } else {
                    [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"You can't delete a Collection."];
                }
                break;
            case ACTION_QUERY:
                if (isDocument) {
                    [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:@"You can't Query documents."];
                } else {
                    [self collectionQuery:asyncId fluentObj:fluentObj];
                }
                break;
            case ACTION_LISTENER_REMOVE:
                [self listenerRemove:asyncId fluentObj:fluentObj];
                break;
            case ACTION_LISTENER_REMOVE_ALL:
                [self listenerRemoveAll:asyncId];
                break;
            default:
                [self sendErrorEvent:@"FirebaseFirestore_SDK" asyncId:asyncId path:nil status:400 errorMessage:[NSString stringWithFormat:@"Unknown action with code: %ld", (long)action]];
                break;
        }
    } completion:^(NSError * _Nullable error) {
        if (error != nil) {
            [self sendErrorEvent: @"FirebaseFirestore_SDK" asyncId:asyncId path:nil exception:error];
        }
    }];
    
    return (double)asyncId;
}

#pragma mark - Document Methods

- (void)documentSet:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Document_Set" asyncId:asyncId]) {
        return;
    }
    
    NSDictionary *value = fluentObj[@"value"];
    if (!value || ![value isKindOfClass:[NSDictionary class]]) {
        [self sendErrorEvent:@"FirebaseFirestore_Document_Set" asyncId:asyncId path:path status:400 errorMessage:@"Invalid value parameter."];
        return;
    }
    
    FIRDocumentReference *docRef = [[FIRFirestore firestore] documentWithPath:path];
    [docRef setData:value completion:^(NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Set" asyncId:asyncId path:path exception:error];
        } else {
            [self sendFirestoreEvent:@"FirebaseFirestore_Document_Set" asyncId:asyncId path:path status:200 extraData:nil];
        }
    }];
}

- (void)documentUpdate:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Document_Update" asyncId:asyncId]) {
        return;
    }
    
    NSDictionary *value = fluentObj[@"value"];
    if (!value || ![value isKindOfClass:[NSDictionary class]]) {
        [self sendErrorEvent:@"FirebaseFirestore_Document_Update" asyncId:asyncId path:path status:400 errorMessage:@"Invalid value parameter."];
        return;
    }
    
    FIRDocumentReference *docRef = [[FIRFirestore firestore] documentWithPath:path];
    [docRef updateData:value completion:^(NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Update" asyncId:asyncId path:path exception:error];
        } else {
            [self sendFirestoreEvent:@"FirebaseFirestore_Document_Update" asyncId:asyncId path:path status:200 extraData:nil];
        }
    }];
}

- (void)documentGet:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Document_Read" asyncId:asyncId]) {
        return;
    }
    
    FIRDocumentReference *docRef = [[FIRFirestore firestore] documentWithPath:path];
    [docRef getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Read" asyncId:asyncId path:path exception:error];
        } else if (snapshot.exists) {
            NSDictionary *extraData = @{@"value": snapshot.data};
            [self sendFirestoreEvent:@"FirebaseFirestore_Document_Read" asyncId:asyncId path:path status:200 extraData:extraData];
        } else {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Read" asyncId:asyncId path:path status:404 errorMessage:@"Document not found."];
        }
    }];
}

- (void)documentDelete:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Document_Delete" asyncId:asyncId]) {
        return;
    }
    
    FIRDocumentReference *docRef = [[FIRFirestore firestore] documentWithPath:path];
    [docRef deleteDocumentWithCompletion:^(NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Delete" asyncId:asyncId path:path exception:error];
        } else {
            [self sendFirestoreEvent:@"FirebaseFirestore_Document_Delete" asyncId:asyncId path:path status:200 extraData:nil];
        }
    }];
}

- (void)documentListen:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Document_Listener" asyncId:asyncId]) {
        return;
    }
    
    if ([self.pathMap.allValues containsObject:path]) {
        [self sendErrorEvent:@"FirebaseFirestore_Document_Listener" asyncId:asyncId path:path status:400 errorMessage:@"Duplicate listener for specified path."];
        return;
    }
    
    FIRDocumentReference *docRef = [[FIRFirestore firestore] documentWithPath:path];
    id<FIRListenerRegistration> listenerRegistration = [docRef addSnapshotListener:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Listener" asyncId:asyncId path:path exception:error];
        } else if (snapshot.exists) {
            NSDictionary *extraData = @{@"value": snapshot.data};
            [self sendFirestoreEvent:@"FirebaseFirestore_Document_Listener" asyncId:asyncId path:path status:200 extraData:extraData];
        } else {
            [self sendErrorEvent:@"FirebaseFirestore_Document_Listener" asyncId:asyncId path:path status:404 errorMessage:@"Document not found."];
        }
    }];
    
    NSNumber *asyncIdNumber = @(asyncId);
    self.listenerMap[asyncIdNumber] = listenerRegistration;
    self.pathMap[asyncIdNumber] = path;
}

#pragma mark - Collection Methods

- (void)collectionAdd:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Collection_Add" asyncId:asyncId]) {
        return;
    }
    
    NSDictionary *value = fluentObj[@"value"];
    if (!value || ![value isKindOfClass:[NSDictionary class]]) {
        [self sendErrorEvent:@"FirebaseFirestore_Collection_Add" asyncId:asyncId path:path status:400 errorMessage:@"Invalid value parameter."];
        return;
    }
    
    FIRCollectionReference *collectionRef = [[FIRFirestore firestore] collectionWithPath:path];
    [collectionRef addDocumentWithData:value completion:^(NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Collection_Add" asyncId:asyncId path:path exception:error];
        } else {
            [self sendFirestoreEvent:@"FirebaseFirestore_Collection_Add" asyncId:asyncId path:path status:200 extraData:nil];
        }
    }];
}

- (void)collectionGet:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Collection_Read" asyncId:asyncId]) {
        return;
    }
    
    FIRCollectionReference *collectionRef = [[FIRFirestore firestore] collectionWithPath:path];
    [collectionRef getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Collection_Read" asyncId:asyncId path:path exception:error];
        } else {
            NSDictionary *extraData = @{@"value": [self convertQuerySnapshotToDictionary:snapshot]};
            [self sendFirestoreEvent:@"FirebaseFirestore_Collection_Read" asyncId:asyncId path:path status:200 extraData:extraData];
        }
    }];
}

- (void)collectionQuery:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Collection_Query" asyncId:asyncId]) {
        return;
    }
    
    FIRQuery *query = [[FIRFirestore firestore] collectionWithPath:path];
    
    NSArray *operations = fluentObj[@"operations"];
    if ([operations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *operation in operations) {
            NSString *fieldPath = operation[@"path"];
            NSNumber *operationType = operation[@"operation"];
            id value = operation[@"value"];
            if (!fieldPath || !operationType || !value) continue;

            QueryFilter op = (QueryFilter)[operationType integerValue];
            
            switch(op) {
                case QUERY_FILTER_EQ:
                    query = [query queryWhereField:fieldPath isEqualTo:value];
                    break;
                case QUERY_FILTER_NEQ:
                    query = [query queryWhereField:fieldPath isNotEqualTo:value];
                    break;
                case QUERY_FILTER_GT_EQ:
                    query = [query queryWhereField:fieldPath isGreaterThanOrEqualTo:value];
                    break;
                case QUERY_FILTER_GT:
                    query = [query queryWhereField:fieldPath isGreaterThan:value];
                    break;
                case QUERY_FILTER_LT:
                    query = [query queryWhereField:fieldPath isLessThan:value];
                    break;
                case QUERY_FILTER_LT_EQ:
                    query = [query queryWhereField:fieldPath isLessThanOrEqualTo:value];
                    break;
            }

        }
    }
    
    NSString *orderBy = fluentObj[@"orderBy"];
    if ([orderBy isKindOfClass:[NSString class]]) {
        NSNumber *sort = fluentObj[@"sort"];
        if (sort && [sort isKindOfClass:[NSNumber class]])
        {
            QuerySort querySort = (QuerySort)[sort integerValue];
            if (querySort == QUERY_SORT_ASCN) {
                query = [query queryOrderedByField:orderBy];
            } else if (querySort == QUERY_SORT_DESC) {
                query = [query queryOrderedByField:orderBy descending:YES];
            }
        } else {
            query = [query queryOrderedByField:orderBy];
        }
    }
    
    NSNumber *limitToFirst = fluentObj[@"limitToFirst"];
    if ([limitToFirst isKindOfClass:[NSNumber class]] && [limitToFirst integerValue] > 0) {
        query = [query queryLimitedTo:[limitToFirst integerValue]];
    }

    NSNumber *limitToLast = fluentObj[@"limitToLast"];
    if ([limitToLast isKindOfClass:[NSNumber class]] && [limitToLast integerValue] > 0) {
        query = [query queryLimitedToLast:[limitToLast integerValue]];
    }
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Collection_Query" asyncId:asyncId path:path exception:error];
        } else {
            NSDictionary *extraData = @{@"value": [self convertQuerySnapshotToDictionary:snapshot]};
            [self sendFirestoreEvent:@"FirebaseFirestore_Collection_Query" asyncId:asyncId path:path status:200 extraData:extraData];
        }
    }];
}

- (void)collectionListen:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSString *path = fluentObj[@"path"];
    if (![self validatePath:path eventType:@"FirebaseFirestore_Collection_Listener" asyncId:asyncId]) {
        return;
    }
    
    if ([self.pathMap.allValues containsObject:path]) {
        [self sendErrorEvent:@"FirebaseFirestore_Collection_Listener" asyncId:asyncId path:path status:400 errorMessage:@"Duplicate listener for specified path."];
        return;
    }
    
    FIRCollectionReference *collectionRef = [[FIRFirestore firestore] collectionWithPath:path];
    id<FIRListenerRegistration> listenerRegistration = [collectionRef addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            [self sendErrorEvent:@"FirebaseFirestore_Collection_Listener" asyncId:asyncId path:path exception:error];
        } else {
            NSDictionary *extraData = @{@"value": [self convertQuerySnapshotToDictionary:snapshot]};
            [self sendFirestoreEvent:@"FirebaseFirestore_Collection_Listener" asyncId:asyncId path:path status:200 extraData:extraData];
        }
    }];
    
    NSNumber *asyncIdNumber = @(asyncId);
    self.listenerMap[asyncIdNumber] = listenerRegistration;
    self.pathMap[asyncIdNumber] = path;
}

#pragma mark - Listener Management

- (void)listenerRemove:(long)asyncId fluentObj:(NSDictionary *)fluentObj {
    NSNumber *listenerIdNumber = fluentObj[@"value"];
    if (!listenerIdNumber || ![listenerIdNumber isKindOfClass:[NSNumber class]]) {
        [self sendErrorEvent:@"FirebaseFirestore_RemoveListener" asyncId:asyncId path:nil status:400 errorMessage:@"Unable to extract listener id."];
        return;
    }
    
    NSNumber *asyncIdNumber = listenerIdNumber;
    id<FIRListenerRegistration> listenerRegistration = self.listenerMap[asyncIdNumber];
    NSString *path = self.pathMap[asyncIdNumber];
    
    if (listenerRegistration) {
        [listenerRegistration remove];
        [self.listenerMap removeObjectForKey:asyncIdNumber];
        [self.pathMap removeObjectForKey:asyncIdNumber];
        [self sendFirestoreEvent:@"FirebaseFirestore_RemoveListener" asyncId:asyncId path:path status:200 extraData:@{@"value": asyncIdNumber}];
    } else {
        [self sendErrorEvent:@"FirebaseFirestore_RemoveListener" asyncId:asyncId path:nil status:400 errorMessage:[NSString stringWithFormat:@"Listener not found for ID: %@", asyncIdNumber]];
    }
}

- (void)listenerRemoveAll:(long)asyncId {
    NSMutableArray *removedListeners = [NSMutableArray array];
    for (NSNumber *asyncIdNumber in self.listenerMap.allKeys) {
        id<FIRListenerRegistration> listenerRegistration = self.listenerMap[asyncIdNumber];
        [listenerRegistration remove];
        [removedListeners addObject:asyncIdNumber];
    }
    [self.listenerMap removeAllObjects];
    [self.pathMap removeAllObjects];
    
    [self sendFirestoreEvent:@"FirebaseFirestore_RemoveListeners" asyncId:asyncId path:nil status:200 extraData:@{@"values": removedListeners}];
}

#pragma mark - Helper Methods

- (BOOL)validatePath:(NSString *)path eventType:(NSString *)eventType asyncId:(long)asyncId {
    if (!path || [path isEqualToString:@""]) {
        [self sendErrorEvent:eventType asyncId:asyncId path:nil status:400 errorMessage:@"Path parameter is missing or empty."];
        return NO;
    }
    return YES;
}

- (void)sendFirestoreEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status extraData:(nullable NSDictionary *)extraData {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    data[@"listener"] = @(asyncId);
    if (path) {
        data[@"path"] = path;
    }
    data[@"status"] = @(status);
    if (extraData) {
        [data addEntriesFromDictionary:extraData];
    }
    [FirebaseUtils sendSocialAsyncEvent:eventType data:data];
}

- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path status:(int)status errorMessage:(NSString *)errorMessage {
    NSDictionary *extraData = @{@"errorMessage": errorMessage};
    [self sendFirestoreEvent:eventType asyncId:asyncId path:path status:status extraData:extraData];
}

- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId path:(nullable NSString *)path exception:(NSError *)exception {
    int status = [self getStatusFromError:exception];
    [self sendErrorEvent:eventType asyncId:asyncId path:path status:status errorMessage:exception.localizedDescription];
}

- (int)getStatusFromError:(NSError *)error {
    // Map Firebase Firestore errors to HTTP status codes
    if (error) {
        FIRFirestoreErrorCode code = (FIRFirestoreErrorCode)error.code;
        switch (code) {
            case FIRFirestoreErrorCodeAborted:
            case FIRFirestoreErrorCodeCancelled:
            case FIRFirestoreErrorCodeDataLoss:
            case FIRFirestoreErrorCodeDeadlineExceeded:
            case FIRFirestoreErrorCodeFailedPrecondition:
            case FIRFirestoreErrorCodeInternal:
            case FIRFirestoreErrorCodeOutOfRange:
            case FIRFirestoreErrorCodeResourceExhausted:
            case FIRFirestoreErrorCodeUnimplemented:
            case FIRFirestoreErrorCodeUnknown:
                return 400;
            case FIRFirestoreErrorCodeAlreadyExists:
                return 409;
            case FIRFirestoreErrorCodePermissionDenied:
                return 403;
            case FIRFirestoreErrorCodeNotFound:
                return 404;
            case FIRFirestoreErrorCodeUnauthenticated:
                return 401;
            case FIRFirestoreErrorCodeUnavailable:
                return 503;
            default:
                return 400;
        }
    }
    return 400;
}

- (NSDictionary *)convertQuerySnapshotToDictionary:(FIRQuerySnapshot *)querySnapshot {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (FIRDocumentSnapshot *doc in querySnapshot.documents) {
        result[doc.documentID] = doc.data;
    }
    return result;
}

@end

${YYIos_FirebaseFirestore_Skip_End}
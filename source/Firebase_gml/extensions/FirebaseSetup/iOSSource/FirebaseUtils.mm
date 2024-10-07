// FirebaseUtils.m

#import "FirebaseUtils.h"

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

@interface FirebaseUtils ()

@property (nonatomic, strong) NSOperationQueue *executorService;
@property (nonatomic, assign) long currentAsyncId;
@property (nonatomic, strong) NSLock *idLock;
@property (nonatomic, strong) NSRegularExpression *i64Regex;

@end

@implementation FirebaseUtils

// Starting point for async ID generation
static const long GENERATOR_STARTING_POINT = 5000;

// Maximum safe double value for integer conversion (2^53)
static const double MAX_DOUBLE_SAFE = 9007199254740992.0; // 2^53

#pragma mark - Singleton Initialization

+ (instancetype)sharedInstance {
    static FirebaseUtils *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FirebaseUtils alloc] initPrivate];
    });
    return sharedInstance;
}

// Prevent direct use of init; enforce singleton pattern
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[FirebaseUtils sharedInstance]"
                                 userInfo:nil];
    return nil;
}

// Private initializer
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        self.currentAsyncId = GENERATOR_STARTING_POINT;
        self.executorService = [[NSOperationQueue alloc] init];
        
        // Configure the operation queue with a bounded thread pool
        self.executorService.maxConcurrentOperationCount = 100; // Adjust based on your app's needs
        self.executorService.name = @"com.mycompany.myapp.FirebaseUtils.executorService";
        
        self.idLock = [[NSLock alloc] init];
        
        // Initialize the regex for "@i64@%llx$i64$" pattern
        NSError *regexError = nil;
        self.i64Regex = [NSRegularExpression regularExpressionWithPattern:@"^@i64@([0-9a-fA-F]{1,16})\\$i64\\$$"
                                                             options:0
                                                               error:&regexError];
        if (regexError) {
            NSLog(@"FirebaseUtils: Failed to create regex - %@", regexError.localizedDescription);
            // Handle regex initialization failure if necessary
        }
    }
    return self;
}

#pragma mark - Async ID Generation

- (long)getNextAsyncId {
    [self.idLock lock];
    self.currentAsyncId += 1;
    long nextId = self.currentAsyncId;
    
    // Ensure the double can represent the long value accurately (2^53)
    if (nextId >= (1L << 53)) {
        [self.idLock unlock];
        @throw [NSException exceptionWithName:@"FirebaseUtilsException"
                                       reason:@"Listener ID limit reached"
                                     userInfo:nil];
    }
    
    [self.idLock unlock];
    return nextId;
}

#pragma mark - Task Submission

- (void)submitAsyncTask:(void (^)(void))task {
    [self submitAsyncTask:task completion:nil];
}

- (void)submitAsyncTask:(void (^)(void))task completion:(nullable void (^)(NSError * _Nullable error))completion {
    if (!task) {
        NSLog(@"FirebaseUtils: Task is nil");
        if (completion) {
            NSError *error = [NSError errorWithDomain:@"FirebaseUtilsErrorDomain"
                                                 code:1001
                                             userInfo:@{NSLocalizedDescriptionKey: @"Task is nil"}];
            completion(error);
        }
        return;
    }
    
    [self.executorService addOperationWithBlock:^{
        @try {
            task();
            NSLog(@"FirebaseUtils: Task executed successfully");
            if (completion) {
                completion(nil);
            }
        }
        @catch (NSException *exception) {
            NSLog(@"FirebaseUtils: Task execution failed - %@", exception.reason);
            if (completion) {
                NSError *error = [NSError errorWithDomain:@"FirebaseUtilsException"
                                                     code:1003
                                                 userInfo:@{NSLocalizedDescriptionKey: exception.reason}];
                completion(error);
            }
        }
    }];
    
    NSLog(@"FirebaseUtils: Task submitted");
}

#pragma mark - JSON Conversion

- (id)convertJSON:(id)json {
    if (json == nil || json == [NSNull null]) {
        return nil;
    }
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        return [self convertNSDictionary:json];
    } else if ([json isKindOfClass:[NSArray class]]) {
        return [self convertNSArray:json];
    } else if ([json isKindOfClass:[NSString class]]) {
        NSNumber *convertedLong = [self convertStringToLongIfApplicable:(NSString *)json];
        return (convertedLong != nil) ? convertedLong : json;
        //return json;
    } else if ([json isKindOfClass:[NSNumber class]]) {
        return json;
    } else {
        // Handle other types if necessary, defaulting to String representation
        return [json description];
    }
}

- (NSDictionary<NSString *, id> *)convertNSDictionary:(NSDictionary<NSString *, id> *)dict {
    NSMutableDictionary<NSString *, id> *result = [NSMutableDictionary dictionaryWithCapacity:dict.count];
    
    for (NSString *key in dict) {
        id value = dict[key];
        id convertedValue = [self convertJSON:value];
        if (convertedValue) {
            result[key] = convertedValue;
        } else {
            // Optionally handle nil values, e.g., skip or set NSNull
            result[key] = [NSNull null];
        }
    }
    
    return [result copy]; // Return immutable copy
}

- (NSArray<id> *)convertNSArray:(NSArray<id> *)array {
    NSMutableArray<id> *result = [NSMutableArray arrayWithCapacity:array.count];
    
    for (id value in array) {
        id convertedValue = [self convertJSON:value];
        if (convertedValue) {
            [result addObject:convertedValue];
        } else {
            // Optionally handle nil values, e.g., skip or set NSNull
            [result addObject:[NSNull null]];
        }
    }
    
    return [result copy]; // Return immutable copy
}

- (NSNumber *)convertStringToLongIfApplicable:(NSString *)str {
    if (!self.i64Regex) {
        NSLog(@"FirebaseUtils: Regex not initialized.");
        return nil;
    }
    
    NSRange range = NSMakeRange(0, str.length);
    NSTextCheckingResult *match = [self.i64Regex firstMatchInString:str options:0 range:range];
    
    if (match && match.numberOfRanges == 2) { // Full match + capture group
        NSRange hexRange = [match rangeAtIndex:1];
        if (hexRange.location != NSNotFound) {
            NSString *hexPart = [str substringWithRange:hexRange];
            unsigned long long longValue = 0;
            NSScanner *scanner = [NSScanner scannerWithString:hexPart];
            if ([scanner scanHexLongLong:&longValue]) {
                // Check if the longValue is within the safe range for double representation
                if (longValue <= (long)MAX_DOUBLE_SAFE) {
                    return @(longValue);
                } else {
                    NSLog(@"FirebaseUtils: Long value exceeds safe double range.");
                    // Optionally, handle this case differently
                }
            } else {
                NSLog(@"FirebaseUtils: Failed to scan hex string '%@' to long.", hexPart);
            }
        }
    }
    
    return nil;
}

#pragma mark - Sending Asynchronous Events

- (void)sendAsyncEvent:(NSString *)eventType data:(NSDictionary *)data {
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

        createSocialAsyncEventWithDSMap(dsMapIndex);
    });
}

#pragma mark - Shutdown

- (void)shutdown {
    [self.executorService cancelAllOperations];
    [self.executorService waitUntilAllOperationsAreFinished];
    
    if (![self.executorService isSuspended]) {
        [self.executorService setSuspended:YES];
    }
    
    [self.executorService setMaxConcurrentOperationCount:0];
    
    NSLog(@"FirebaseUtils: ExecutorService has been shut down");
}

@end

#import "YYFirebaseCloudFunctions.h"
#import "FirebaseUtils.h"

@interface YYFirebaseCloudFunctions ()

@property (nonatomic, strong) FIRFunctions *functions;

- (id)parseDataString:(NSString *)data error:(NSError **)error;
- (long)getNextAsyncId;
- (int)getStatusCodeFromFunctionsErrorCode:(FIRFunctionsErrorCode)code;
- (void)sendFunctionsEvent:(NSString *)eventType asyncId:(long)asyncId status:(int)status extraData:(NSDictionary *)extraData;
- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId statusCode:(int)statusCode errorMessage:(NSString *)errorMessage;

@end

@implementation YYFirebaseCloudFunctions

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.functions = [FIRFunctions functions];
    }
    return self;
}

#pragma mark - SDK Initialization

- (void)SDKFirebaseCloudFunctions_Init {
    BOOL useEmulator = [FirebaseUtils extOptionGetBool:@"YYFirebaseCloudFunctions" option:@"useEmulator"];
    if (useEmulator) {
        NSString *host = [FirebaseUtils extOptionGetString:@"YYFirebaseCloudFunctions" option:@"emulatorHost"];
        int port = [FirebaseUtils extOptionGetInt:@"YYFirebaseCloudFunctions" option:@"emulatorPort"];
        
        [self.functions useEmulatorWithHost:host port:port];
    }
}

#pragma mark - Main API Method

- (double)SDKFirebaseCloudFunctions_Call:(NSString *)functionName data:(NSString *)data timeoutSeconds:(double)timeoutSeconds {
    long asyncId = [self getNextAsyncId];

    // Submit task to background thread
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        NSError *parseError = nil;
        id parsedData = [self parseDataString:data error:&parseError];

        if (parseError) {
            NSLog(@"Invalid data input: %@", parseError.localizedDescription);
            [self sendErrorEvent:@"FirebaseCloudFunctions_Call" asyncId:asyncId statusCode:400 errorMessage:@"Invalid data input"];
            return;
        }

        // Get callable reference
        FIRHTTPSCallable *callable = [self.functions HTTPSCallableWithName:functionName];

        // Set timeout if specified
        if (timeoutSeconds > 0) {
            callable.timeoutInterval = timeoutSeconds;
        }

        // Call the Cloud Function
        [callable callWithObject:parsedData completion:^(FIRHTTPSCallableResult * _Nullable result, NSError * _Nullable error) {
            if (error) {
                NSString *errorMessage = @"Unknown error";
                int statusCode = 400;

                FIRFunctionsErrorCode code = (FIRFunctionsErrorCode)error.code;
                errorMessage = error.localizedDescription;
                statusCode = [self getStatusCodeFromFunctionsErrorCode:code];

                dispatch_async(dispatch_get_main_queue(), ^{
                    [self sendErrorEvent:@"FirebaseCloudFunctions_Call" asyncId:asyncId statusCode:statusCode errorMessage:errorMessage];
                });
            } else {
                id responseData = result.data;

                NSMutableDictionary *extraData = [NSMutableDictionary dictionary];

                // Serialize complex data types to JSON strings
                if ([NSJSONSerialization isValidJSONObject:responseData]) {
                    NSError *jsonError = nil;
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseData options:0 error:&jsonError];
                    if (!jsonError) {
                        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                        extraData[@"value"] = jsonString;
                    } else {
                        extraData[@"value"] = [responseData description];
                    }
                } else {
                    extraData[@"value"] = [responseData description];
                }

                [self sendFunctionsEvent:@"FirebaseCloudFunctions_Call" asyncId:asyncId status:200 extraData:extraData];
            }
        }];
    }];

    return (double)asyncId;
}

#pragma mark - Helper Methods

/**
 * Parses a string representation of data and converts it into the appropriate Objective-C object type.
 *
 * @param data The string representation of the data to be parsed.
 * @param error An error object that is set if parsing fails.
 * @return The parsed data as an appropriate Objective-C object.
 */
- (id)parseDataString:(NSString *)data error:(NSError **)error {
    if (!data || data.length == 0) {
        return data;
    }

    NSString *lowercaseData = [data lowercaseString];

    if ([lowercaseData isEqualToString:@"@@null$$"]) {
        return [NSNull null];
    } else if ([lowercaseData isEqualToString:@"@@true$$"]) {
        return @YES;
    } else if ([lowercaseData isEqualToString:@"@@false$$"]) {
        return @NO;
    }

    // Try parsing as JSON object or array
    NSData *jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    if (jsonObject && !jsonError) {
        return jsonObject;
    }

    // Try parsing as number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *number = [formatter numberFromString:data];
    if (number) {
        return number;
    }

    // Treat as string
    return data;
}

/**
 * Generates the next unique async ID using FirebaseUtils.
 *
 * @return The next async ID as a long.
 */
- (long)getNextAsyncId {
    return [[FirebaseUtils sharedInstance] getNextAsyncId];
}

/**
 * Maps a FIRFunctionsErrorCode to an appropriate HTTP status code.
 *
 * @param code The FIRFunctionsErrorCode to map.
 * @return The corresponding HTTP status code as an int.
 */
- (int)getStatusCodeFromFunctionsErrorCode:(FIRFunctionsErrorCode)code {
    switch (code) {
        case FIRFunctionsErrorCodeOK:
            return 200;
        case FIRFunctionsErrorCodeCancelled:
            return 499;
        case FIRFunctionsErrorCodeUnknown:
            return 500;
        case FIRFunctionsErrorCodeInvalidArgument:
            return 400;
        case FIRFunctionsErrorCodeDeadlineExceeded:
            return 504;
        case FIRFunctionsErrorCodeNotFound:
            return 404;
        case FIRFunctionsErrorCodeAlreadyExists:
            return 409;
        case FIRFunctionsErrorCodePermissionDenied:
            return 403;
        case FIRFunctionsErrorCodeResourceExhausted:
            return 429;
        case FIRFunctionsErrorCodeFailedPrecondition:
            return 412;
        case FIRFunctionsErrorCodeAborted:
            return 409;
        case FIRFunctionsErrorCodeOutOfRange:
            return 400;
        case FIRFunctionsErrorCodeUnimplemented:
            return 501;
        case FIRFunctionsErrorCodeInternal:
            return 500;
        case FIRFunctionsErrorCodeUnavailable:
            return 503;
        case FIRFunctionsErrorCodeDataLoss:
            return 500;
        case FIRFunctionsErrorCodeUnauthenticated:
            return 401;
        default:
            return 500;
    }
}

/**
 * Sends an event by assembling common data and delegating to sendSocialAsyncEvent.
 *
 * @param eventType The type of event.
 * @param asyncId The unique async ID.
 * @param status The HTTP status code representing the result.
 * @param extraData Additional data to include in the event.
 */
- (void)sendFunctionsEvent:(NSString *)eventType asyncId:(long)asyncId status:(int)status extraData:(NSDictionary *)extraData {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    data[@"listener"] = @(asyncId);
    data[@"status"] = @(status);

    if (extraData) {
        [data addEntriesFromDictionary:extraData];
    }

    [FirebaseUtils sendSocialAsyncEvent:eventType data:data];
}

/**
 * Sends an error event with the specified parameters.
 *
 * @param eventType The type of event.
 * @param asyncId The unique async ID.
 * @param statusCode The HTTP status code representing the error.
 * @param errorMessage The error message to include.
 */
- (void)sendErrorEvent:(NSString *)eventType asyncId:(long)asyncId statusCode:(int)statusCode errorMessage:(NSString *)errorMessage {
    NSDictionary *extraData = @{@"errorMessage": errorMessage};
    [self sendFunctionsEvent:eventType asyncId:asyncId status:statusCode extraData:extraData];
}

@end

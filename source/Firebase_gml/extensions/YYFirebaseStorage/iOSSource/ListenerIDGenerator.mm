#include "ListenerIDGenerator.h"

@interface ListenerIDGenerator ()

@property (nonatomic, assign) uint64_t currentListenerId;

@end

@implementation ListenerIDGenerator

static const uint64_t GENERATOR_STARTING_POINT = 5000;

+ (instancetype)sharedInstance {
    static ListenerIDGenerator *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ListenerIDGenerator alloc] initPrivate];
    });
    return sharedInstance;
}

- (instancetype)initPrivate {
    if (self = [super init]) {
        _currentListenerId = GENERATOR_STARTING_POINT;
    }
    return self;
}

- (NSNumber *)getNextListenerId {
    @synchronized (self) {
        _currentListenerId++;
        // Ensure the value can be accurately represented as a double
        if (_currentListenerId >= (1ULL << 53)) {
            @throw [NSException exceptionWithName:@"ListenerIDLimitReached"
                                           reason:@"Listener ID limit reached"
                                         userInfo:nil];
        }
        return @(_currentListenerId);
    }
}

@end
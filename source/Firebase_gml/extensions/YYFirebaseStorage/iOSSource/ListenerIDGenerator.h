#import <Foundation/Foundation.h>

@interface ListenerIDGenerator : NSObject

+ (instancetype)sharedInstance;
- (NSNumber *)getNextListenerId;

@end
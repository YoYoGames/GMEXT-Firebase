// FirebaseUtils.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirebaseUtils : NSObject

+ (instancetype)sharedInstance;

- (long)getNextAsyncId;
- (void)submitAsyncTask:(void (^)(void))task;
- (void)submitAsyncTask:(void (^)(void))task completion:(nullable void (^)(NSError * _Nullable error))completion;
- (id)convertJSON:(id)json;
- (void)sendAsyncEvent:(NSString *)eventType data:(NSDictionary<NSString *, id> *)data;

- (void)shutdown;

@end

NS_ASSUME_NONNULL_END

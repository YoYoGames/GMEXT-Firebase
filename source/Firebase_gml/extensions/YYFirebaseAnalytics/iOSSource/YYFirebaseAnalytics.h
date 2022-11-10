
#import <FirebaseCore/FirebaseCore.h>

#if !defined(__has_include)
  #error "Firebase.h won't import anything if your compiler doesn't support __has_include. Please \
          import the headers individually."
#else
    
  #if __has_include(<FirebaseAnalytics/FirebaseAnalytics.h>)
    #import <FirebaseAnalytics/FirebaseAnalytics.h>
  #endif

#endif  // defined(__has_include)

#import<UserNotifications/UserNotifications.h>
@interface YYFirebaseAnalytics:NSObject
{
}

+(NSMutableDictionary*) makeDic:(NSString*) json;

@end


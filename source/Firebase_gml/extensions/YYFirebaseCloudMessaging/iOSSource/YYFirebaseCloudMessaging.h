
#import <FirebaseCore/FirebaseCore.h>

#if !defined(__has_include)
  #error "Firebase.h won't import anything if your compiler doesn't support __has_include. Please \
          import the headers individually."
#else
  #if __has_include(<FirebaseAnalytics/FirebaseAnalytics.h>)
    #import <FirebaseAnalytics/FirebaseAnalytics.h>
  #endif

  #if __has_include(<FirebaseMessaging/FirebaseMessaging.h>)
    #import <FirebaseMessaging/FirebaseMessaging.h>
      #if !__has_include(<FirebaseAnalytics/FirebaseAnalytics.h>)
		#ifndef FIREBASE_ANALYTICS_SUPPRESS_WARNING
        #warning "FirebaseAnalytics.framework is not included in your target. Please add \
`Firebase/Analytics` to your Podfile or add FirebaseAnalytics.framework to your project to ensure \
Firebase Messaging works as intended."
		#endif // #ifndef FIREBASE_ANALYTICS_SUPPRESS_WARNING
	  #endif
	#endif

#endif  // defined(__has_include)

#import<UserNotifications/UserNotifications.h>
@interface YYFirebaseCloudMessaging:NSObject <FIRMessagingDelegate>
{
	
}

@end


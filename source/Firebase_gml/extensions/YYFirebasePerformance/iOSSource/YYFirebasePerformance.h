
#import <FirebaseCore/FirebaseCore.h>

#if !defined(__has_include)
  #error "Firebase.h won't import anything if your compiler doesn't support __has_include. Please \
          import the headers individually."
#else

  #if __has_include(<FirebasePerformance/FirebasePerformance.h>)
    #import <FirebasePerformance/FirebasePerformance.h>
  #endif

#endif  // defined(__has_include)

@interface YYFirebasePerformance:NSObject
{
	NSMutableDictionary *Map_Trace;
	NSMutableDictionary *Map_HttpMetric;
}

@end


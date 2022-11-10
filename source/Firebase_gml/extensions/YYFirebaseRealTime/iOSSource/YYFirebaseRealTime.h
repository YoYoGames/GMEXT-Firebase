
#import <FirebaseCore/FirebaseCore.h>

#if !defined(__has_include)
  #error "Firebase.h won't import anything if your compiler doesn't support __has_include. Please \
          import the headers individually."
#else

  #if __has_include(<FirebaseDatabase/FirebaseDatabase.h>)
    #import <FirebaseDatabase/FirebaseDatabase.h>
  #endif

#endif  // defined(__has_include)

@interface YYFirebaseRealTime:NSObject
{
    NSMutableDictionary *RealTime_ListenerMap;
    NSMutableDictionary *RealTime_ReferenceMap;
    int RealTime_indMap;
}


@end


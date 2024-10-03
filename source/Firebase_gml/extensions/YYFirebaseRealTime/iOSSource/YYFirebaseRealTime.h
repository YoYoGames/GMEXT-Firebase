#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface YYFirebaseRealTime:NSObject
{
    NSMutableDictionary *RealTime_ListenerMap;
    NSMutableDictionary *RealTime_ReferenceMap;
    int RealTime_indMap;
}


@end


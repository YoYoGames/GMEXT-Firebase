#import "GMFirebase_ios.h"
#import <UIKit/UIKit.h>

@implementation GMFirebase
@end

// The GameMaker iOS runner exports its root view controller; the UMP form
// functions in GMFirebase_ump.cpp use it as the FormParent when GML passes 0.
extern UIViewController *g_controller;

extern "C" void* gmFirebaseIosRootViewController(void)
{
    return (__bridge void*)g_controller;
}


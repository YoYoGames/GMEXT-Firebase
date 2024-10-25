//
// Copyright YoYo Games Ltd.
// For support please submit a ticket at help.yoyogames.com
//

#import <Foundation/Foundation.h>
#import "YY_AppleSignInDelegate.h"
#import "YY_AppleSignInDelegate.h"
#include "YY_AppleSignInEnums.h"
#import "YY_AppleSignInControllerPresentationContextProviding.h"

#if TARGET_OS_OSX
#import "Extension_Interface.h"
#include "YYRValue.h"
#include <sstream>
#endif

@interface YY_AppleSignIn : NSObject
{
}

@end

extern int CreateDsMap_comaptibility_();
extern void DsMapAddString_comaptibility_(int dsMapIndex, const char* _key, const char* _value);
extern void DsMapAddDouble_comaptibility_(int dsMapIndex, const char* _key, double _value);
extern void CreateAsyncEventWithDSMap_comaptibility_(int dsMapIndex);

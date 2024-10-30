
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FacebookExtension2:NSObject
{
    
}

+(int) objc_dsMapCreate;
+(void) objc_dsMapAddInt:(int) _dsMap _key: (NSString*)_key _value: (int) _value;
+(void) objc_dsMapAddString:(int) _dsMap _key: (NSString*)_key _value: (NSString*) _value;
+(void) objc_createSocialAsyncEventWithDSMap:(int) dsmapindex;

@end

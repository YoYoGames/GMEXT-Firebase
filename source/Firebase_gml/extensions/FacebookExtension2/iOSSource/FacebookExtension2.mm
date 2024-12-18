//
//  
//  Copyright YoYo Games Ltd., 2015.
//  For support please submit a ticket at help.yoyogames.com
//
//

#import "FacebookExtension2.h"
#import "${YYXCodeProjName}-Swift.h"

extern UIViewController *g_controller;

extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

@implementation FacebookExtension2


YYFacebook *mFb;
//- (void)Init
//{
   // mFb = [YYFacebook new];
  //  [mFb init];
//}


+(int) objc_dsMapCreate
{
    return dsMapCreate();
}

+(void)  objc_dsMapAddInt:(int) _dsMap _key: (NSString*)_key _value: (int) _value
{
    return dsMapAddInt(_dsMap, (char*)[_key UTF8String], _value);
}

+(void) objc_dsMapAddString:(int) _dsMap _key: (NSString*)_key _value: (NSString*) _value
{
    dsMapAddString(_dsMap, (char*)[_key UTF8String], (char*)[_value UTF8String]);
}

+(void) objc_createSocialAsyncEventWithDSMap:(int) dsmapindex
{
    createSocialAsyncEventWithDSMap(dsmapindex);
}


- (void) onLaunch:(NSDictionary *)launchOptions
{
    mFb = [YYFacebook new];
    [mFb init];
    
    [mFb onLaunchWithLaunchOptions:launchOptions];
}


- (double) fb_ready
{
    return [mFb fb_ready];
}

- (void)fb_init;
{
    [mFb fb_init];
}

-(void)onResume
{
    [mFb onResume];
}

-(BOOL)onOpenURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
{
    return [mFb onOpenURLWithUrl:url sourceApplication:sourceApplication annotation:annotation];
}

////////////////////////////
// fb_login
////////////////////////////
- (double)fb_login:(double)_permissions
{
    return [mFb fb_loginWith_permissions:[self dsListToArray: _permissions] mviewcontroller:g_controller];
}

- (void)fb_logout
{
    [mFb fb_logout];
}

- (NSString*)fb_status
{
    return [mFb fb_status];
}

- (void)fb_set_status:(NSString*)_status
{
    [mFb fb_set_statusWith_status:_status];
}

- (NSString *)fb_accesstoken
{
    return [mFb fb_accesstoken];
}

- (NSString *)fb_user_id
{
    return [mFb fb_user_id];
}

////////////////////////////
// fb_dialog
////////////////////////////
- (double)fb_dialog:(NSString*)_link
{
    return [mFb fb_dialogWith_link:_link uicontrol:g_controller];
}

//graphRequest:nsGraphPath httpMethod:nsHttpMethod params:params dsMap:_dsMapIndex ];
-(double)fb_graph_request:(NSString*)_graphPath
			   httpMethod:(NSString*)_httpMethod
				   params:(int)_params
{
    NSMutableDictionary* arrayParams = [self dsListToDictionary:_params];
    
    return [mFb fb_graph_requestWith_graphPath:_graphPath httpMethod:_httpMethod arrayParams:arrayParams];
}

-(bool)fb_check_permission:(NSString*)permission
{
    return [mFb fb_check_permissionWithPermission:permission];
}


-(double)fb_request_publish_permissions:(double)_permissions
{
    return [mFb fb_request_publish_permissionsWith_permissions:[self dsListToArray:_permissions] mUIViewController:g_controller];
}

-(double)fb_request_read_permissions:(double)_permissions
{
    return [mFb fb_request_read_permissionsWith_permissions:[self dsListToArray:_permissions] uicontroller:g_controller];
}

-(double)fb_request_permissions:(double)_permissions publish:(bool)_bPublish
{
    return [mFb fb_request_permissionsWith_permissions:[self dsListToArray:_permissions] _bPublish:_bPublish mUIViewController:g_controller];
}


-(double)fb_refresh_accesstoken
{
    return [mFb fb_refresh_accesstoken];
}

-(double)fb_send_event:(double)_eventId withEventValue:(double)_eventValue withEventParams:(double)_eventParamsDsList
{
    return [mFb fb_send_eventWith_eventId:_eventId _eventValue:_eventValue _eventParamsDsList:[self dsListToArray:_eventParamsDsList]];
}



-(NSMutableArray*) dsListToArray: (int)_dsListId
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    int listCount = dsListGetSize(_dsListId);
    if(listCount == 0)
    {
        //NSLog(@"DS list size is zero");
        return array;
    }
    
    //NSLog(@"ds_list size: %d", listCount);
    for(int listIdx = 0; listIdx < listCount; ++listIdx)
    {
        const char* s = dsListGetValueString(_dsListId, listIdx);
        if(s != NULL)
        {
            NSString* currentItem = [[NSString alloc] initWithCString: s
                                                             encoding:NSUTF8StringEncoding];
            [array addObject:currentItem];
        }
        else
        {
            double num = dsListGetValueDouble(_dsListId, listIdx);
            [array addObject: [[NSNumber alloc] initWithDouble:num]];
        }
    }
    
    return array;
}

- (NSMutableDictionary*) dsListToDictionary: (int)_dsListId
{
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] init];
    if(_dsListId == -1)
    {
        //NSLog(@"DS list does not exist. Returning empty dictionary.");
        return dictionary;
    }
    
    int listCount = dsListGetSize(_dsListId);
    if(listCount == 0 || (listCount & 0x1) != 0)
    {
        //NSLog(@"Invalid ds list size: %d", listCount);
        return dictionary;
    }
    
    //NSLog(@"ds_list size: %d", listCount);
    for(int listIdx = 0; listIdx < listCount; listIdx += 2)
    {
        NSString* currentKey = [[NSString alloc] initWithCString: dsListGetValueString(_dsListId, listIdx)
                                                        encoding:NSUTF8StringEncoding];
        NSString* currentValue = [[NSString alloc] initWithCString: dsListGetValueString(_dsListId, listIdx + 1)
                                                          encoding:NSUTF8StringEncoding];
        [dictionary setObject:currentValue forKey:currentKey];
        //NSLog(@"Added key/value to dictionary. %@ : %@", currentKey, currentValue);
    }
    
    return dictionary;
}

@end



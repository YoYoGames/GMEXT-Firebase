
#import "YYFirebaseRealTime.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern UIViewController *g_controller;
extern UIView *g_glView;
extern int g_DeviceWidth;
extern int g_DeviceHeight;

extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);


@implementation YYFirebaseRealTime

///////////////////////////////////////REALTIME DATABASE

	-(id) init
	{
		if(self = [super init])
		{
			if(![FIRApp defaultApp])
				[FIRApp configure];
				
			return self;
		}
	}

	
	-(double) FirebaseRealTime_SDK:(NSString*) fluent_json
	{
        NSDictionary *fluent_obj = [YYFirebaseRealTime json2dic:fluent_json];
		
        NSString *action = [fluent_obj valueForKey:@"_action"];
		if([action isEqualToString:@"Set"])
			return [self Write: fluent_obj];
		else if([action isEqualToString:@"Read"] || [action isEqualToString:@"Listener"])
			return  [self Read: fluent_obj];
		else if([action isEqualToString:@"Exists"])
			return  [self Exists: fluent_obj];
		else if([action isEqualToString:@"Delete"])
			return [self Delete: fluent_obj];
		else if([action isEqualToString:@"ListenerRemove"])
			[self ListenerRemove: fluent_obj];
		else if([action isEqualToString:@"ListenerRemoveAll"])
            [self ListenerRemoveAll];
		return 0.0;
	}
	
-(void) Init
{
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
	RealTime_indMap = 10000;
    RealTime_ListenerMap = [[NSMutableDictionary alloc] init];
    RealTime_ReferenceMap = [[NSMutableDictionary alloc] init];
}

-(double) Write:(NSDictionary*) fluent_obj
{
    const int Id = [self getListenerInd];
    FIRDatabaseReference *ref=[YYFirebaseRealTime getRef:fluent_obj];

    id value = [fluent_obj valueForKey:@"_value"];
    if([value isKindOfClass:[NSString class]])
    {
        id dic = [YYFirebaseRealTime json2dic: value];
        if(dic != nil)
            value = dic;
    }
    
            //[YYFirebaseRealTime json2dic:@""];
    
    if([fluent_obj valueForKey:@"_push"] != [NSNull null])
        ref = [ref childByAutoId];
    [ref setValue: value withCompletionBlock:^(NSError *error, FIRDatabaseReference *ref)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Set");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        [self InsertCallbackStatus:dsMapIndex error:error];
        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    return (double)Id;
}

-(double) Read:(NSDictionary*) fluent_obj 
{
    const int Id = [self getListenerInd];
    FIRDatabaseReference *ref = [YYFirebaseRealTime getRef:fluent_obj];
    FIRDatabaseQuery *mQuery = ref;
    
    if([fluent_obj valueForKey:@"_OrderBy"] != [NSNull null])
    {
        if([[fluent_obj valueForKey:@"_OrderBy"] isKindOfClass:[NSString class]])
            mQuery = [mQuery queryOrderedByChild:[fluent_obj valueForKey:@"_OrderBy"]];
        else
        switch([[fluent_obj valueForKey:@"_OrderBy"] intValue])
        {
            //case 0: mQuery = [mQuery queryOrderedByChild:OrderKey]; break;
            case 1: mQuery = [mQuery queryOrderedByKey]; break;
            case 2: mQuery = [mQuery queryOrderedByValue]; break;
        }
    }
    
    if([fluent_obj valueForKey:@"_StartValue"] != [NSNull null])
        mQuery = [mQuery queryStartingAtValue: [fluent_obj valueForKey:@"_StartValue"]];
    if([fluent_obj valueForKey:@"_EndValue"] != [NSNull null])
        mQuery = [mQuery queryEndingAtValue: [fluent_obj valueForKey:@"_EndValue"]];
    if([fluent_obj valueForKey:@"_EqualTo"] != [NSNull null])
        mQuery = [mQuery queryEqualToValue: [fluent_obj valueForKey:@"_EqualTo"]];
    
    if([fluent_obj valueForKey:@"_LimitKind"] != [NSNull null])
    if([fluent_obj valueForKey:@"_LimitValue"] != [NSNull null])
    {
        switch([[fluent_obj valueForKey:@"_LimitKind"] intValue])
        {
            case 0: mQuery = [mQuery queryLimitedToFirst:[[fluent_obj valueForKey:@"_LimitValue"] intValue]]; break;
            case 1: mQuery = [mQuery queryLimitedToLast:[[fluent_obj valueForKey:@"_LimitValue"] intValue]]; break;
        }
    }
    
    id blockCallback = ^(FIRDataSnapshot * _Nonnull snapshot)
    {
        int dsMapIndex = dsMapCreate();
        if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Read"])
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Read");
        if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Listener"])
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Listener");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        dsMapAddDouble(dsMapIndex,(char*)"status",200);
        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        
        if(!snapshot.exists)
        {
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            return;
        }
        
        id value = snapshot.value;
        if([value isKindOfClass:[NSString class]])
            dsMapAddString(dsMapIndex,(char*)"value",(char*)[(NSString*)snapshot.value UTF8String]);
        
        if([value isKindOfClass:[NSNumber class]])
            dsMapAddDouble(dsMapIndex,(char*)"value",[snapshot.value doubleValue]);
        
        if([value isKindOfClass:[NSDictionary class]])
            dsMapAddString(dsMapIndex,(char*)"value",(char*)[[YYFirebaseRealTime toJSON:snapshot.value] UTF8String]);

        if([value isKindOfClass:[NSArray class]])
            dsMapAddString(dsMapIndex,(char*)"value",(char*)[[YYFirebaseRealTime toJSON:snapshot.value] UTF8String]);
        
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    };
    
    id cancelBlockCalback = ^(NSError * _Nonnull error)
    {
        int dsMapIndex = dsMapCreate();
        if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Read"])
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Read");
        if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Listener"])
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Listener");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        [self InsertCallbackStatus:dsMapIndex error:error];
        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    };
    
    if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Read"])
        [mQuery observeSingleEventOfType:FIRDataEventTypeValue withBlock:blockCallback withCancelBlock:cancelBlockCalback];
    else
    if([[fluent_obj valueForKey:@"_action"] isEqualToString:@"Listener"])
    {
        FIRDatabaseHandle listener = [mQuery observeEventType:FIRDataEventTypeValue withBlock:blockCallback withCancelBlock:cancelBlockCalback];
        [self listenerToMaps:ref listener:listener ind:Id];
    }
    
    return (double)Id;
}

-(double) Delete:(NSDictionary*) fluent_obj
{
    const int Id = [self getListenerInd];
    FIRDatabaseReference *ref=[YYFirebaseRealTime getRef:fluent_obj];
    [ref removeValueWithCompletionBlock:^(NSError *error, FIRDatabaseReference *ref)
     {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Delete");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        [self InsertCallbackStatus:dsMapIndex error:error];        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
     }];
    return (double)Id;
}

-(double) Exists:(NSDictionary*) fluent_obj
{
    const int Id = [self getListenerInd];
    FIRDatabaseReference *ref=[YYFirebaseRealTime getRef:fluent_obj];
    [ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
    {
        double exists = 0.0;
        if([snapshot exists])
            exists = 1.0;
        
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Exists");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        dsMapAddDouble(dsMapIndex,(char*)"status",200);
        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        dsMapAddDouble(dsMapIndex,(char*)"value",exists);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);

    } withCancelBlock:^(NSError * _Nonnull error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseRealTime_Exists");
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[(NSString*)[fluent_obj valueForKey:@"_path"] UTF8String]);
        [self InsertCallbackStatus:dsMapIndex error:error];        dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    return (double)Id;
}

-(int)getListenerInd
{
    RealTime_indMap++;
    return(RealTime_indMap);
}

-(void) listenerToMaps:(FIRDatabaseReference*) ref listener: (FIRDatabaseHandle) listener ind:(int) ind
{
    [RealTime_ListenerMap setValue:[NSString stringWithFormat:@"%lu",(unsigned long)listener] forKey:[NSString stringWithFormat:@"%d",ind]];
    [RealTime_ReferenceMap setValue:ref forKey:[NSString stringWithFormat:@"%d",ind]];
}

-(double) ListenerRemove:(NSDictionary*) fluent_obj
{
    NSNumber *number = [fluent_obj valueForKey:@"_value"];
    int ind = [number intValue];
    FIRDatabaseReference *ref=[RealTime_ReferenceMap objectForKey:[NSString stringWithFormat:@"%d",(int)ind]];
    NSString *ListenerString = [RealTime_ListenerMap objectForKey:[NSString stringWithFormat:@"%d",(int)ind]];
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    unsigned long listener = [[formatter numberFromString:ListenerString] unsignedLongValue];
    [formatter release];
    
    [ref removeObserverWithHandle:(FIRDatabaseHandle)listener];
    [RealTime_ListenerMap removeObjectForKey:[NSString stringWithFormat:@"%d",(int)ind]];
    [RealTime_ReferenceMap removeObjectForKey:[NSString stringWithFormat:@"%d",(int)ind]];
    
    return 0.0;
}

-(void) ListenerRemoveAll
{
    for(id key in RealTime_ListenerMap)
    {
        FIRDatabaseReference *ref = [RealTime_ReferenceMap objectForKey:key];
        NSString *ListenerString = [RealTime_ListenerMap objectForKey:key];
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
        unsigned long listener = [[formatter numberFromString:ListenerString] unsignedLongValue];
        [ref removeObserverWithHandle:(FIRDatabaseHandle)listener];
        [formatter release];
    }
    [RealTime_ListenerMap removeAllObjects];
    [RealTime_ReferenceMap removeAllObjects];
}

+(FIRDatabaseReference*) getRef:(NSDictionary*) fluent_obj
{
    FIRDatabaseReference *ref;
    
    if([fluent_obj valueForKey:@"_database"] == [NSNull null])
        ref = [[FIRDatabase database] reference];
    else
        ref = [[FIRDatabase databaseWithURL:[fluent_obj valueForKey:@"_database"]] reference];
    
    ref = [ref child:[fluent_obj valueForKey:@"_path"]];
    
    return ref;
}

+(NSDictionary*) json2dic:(NSString*) json
{
    NSError *jsonError = nil;
    NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:objectData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&jsonError];
    if(jsonError == nil)
        return dic;
    return nil;
}

+(NSString*) toJSON:(id) obj
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                           options:0//NSJSONWritingPrettyPrinted
                                                             error:&error];
    if(error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return @"{}";
}

- (void) InsertCallbackStatus:(int) dsMapIndex error:(NSError*) error
{
    //I found this error codes in FirebaseDatabase/Sources/Utilities/FUtilities.m
    //Looks enoght for RealTime
    if(error)
    {
        switch(error.code)
        {
            case 1:
                dsMapAddDouble(dsMapIndex,(char*)"status",401);
                dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)"permission_denied");
                break;
            case 2:
                dsMapAddDouble(dsMapIndex,(char*)"status",503);
                dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)"unavailable");
                break;
            case 3:
                dsMapAddDouble(dsMapIndex,(char*)"status",400);
                dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)"WriteCanceled");
                break;
            default:
                dsMapAddDouble(dsMapIndex,(char*)"status",400);
                dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)"Unknown Error");
                break;
        };
    }
    else
        dsMapAddDouble(dsMapIndex,(char*)"status",200);
}

@end


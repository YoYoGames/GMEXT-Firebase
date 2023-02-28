
#import "YYFirebaseStorage.h"
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


@implementation YYFirebaseStorage

-(id) init
{
	if(self = [super init])
	{
		if(![FIRApp defaultApp])
			[FIRApp configure];
			
		return self;
	}
}


-(void) Init
{
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
    indMap = 7000;
    ListenerMap = [[NSMutableDictionary alloc] init];
}

-(double) Firestore_getListenerInd
{
    indMap ++;
    return indMap;
}

+(NSString*)iOS_GetPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return([paths objectAtIndex:0]);
}

-(void) SDKFirebaseStorage_Cancel:(double) ind
{
    FIRStorageObservableTask *task = (FIRStorageObservableTask*) [ListenerMap valueForKey:[NSString stringWithFormat:@"%d",(int)ind]];
    [task removeAllObservers];
    [ListenerMap removeObjectForKey:[NSString stringWithFormat:@"%d",(int)ind]];
}

-(double) SDKFirebaseStorage_Download:(NSString*) localPath path:(NSString*) firebasePath bucket:(NSString*) bucket
{
    double listener = [self Firestore_getListenerInd];
    NSString *path = [YYFirebaseStorage iOS_GetPath];
    NSString *localFilePath = [NSString stringWithFormat:@"%@/%@", path, localPath];
    
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    NSURL *localURL = [NSURL fileURLWithPath:localFilePath];
    FIRStorageDownloadTask *downloadTask = [ref writeToFile:localURL];

    [downloadTask observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot *snapshot)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Download");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);

        dsMapAddDouble(dsMapIndex,(char*)"transferred",snapshot.progress.completedUnitCount);
        dsMapAddDouble(dsMapIndex,(char*)"total",snapshot.progress.totalUnitCount);
        dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
        
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    [downloadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Download");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);
        dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        return;
    }];
    
    
    [downloadTask observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot *snapshot)
    {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Download");
            dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
            dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
            dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);
    
            if(snapshot.error)
            {
                dsMapAddString(dsMapIndex,(char*)"error",(char*)[snapshot.error.localizedDescription UTF8String]);
                dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
                CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
                return;
            }
            
            dsMapAddDouble(dsMapIndex,(char*)"transferred",snapshot.progress.completedUnitCount);
            dsMapAddDouble(dsMapIndex,(char*)"total",snapshot.progress.totalUnitCount);
            
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    return listener;
}

-(double) SDKFirebaseStorage_Upload:(NSString*) localPath Password:(NSString*) firebasePath bucket:(NSString*) bucket
{
    
    NSString *path = [YYFirebaseStorage iOS_GetPath];
    NSString *localFilePath = [NSString stringWithFormat:@"%@/%@", path, localPath];
    
    double listener = [self Firestore_getListenerInd];
    NSURL *localFile = [NSURL fileURLWithPath:localFilePath];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    FIRStorageUploadTask *uploadTask = [ref putFile:localFile metadata:nil];
    [uploadTask observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Upload");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);
        dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        return;
    }];
    
    
    [uploadTask observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot *snapshot)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Upload");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);

        dsMapAddDouble(dsMapIndex,(char*)"transferred",snapshot.progress.completedUnitCount);
        dsMapAddDouble(dsMapIndex,(char*)"total",snapshot.progress.totalUnitCount);
        dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
        
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
    [uploadTask observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot *snapshot)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Upload");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        dsMapAddString(dsMapIndex,(char*)"localPath",(char*)[localPath UTF8String]);

        if(snapshot.error)
        {
            dsMapAddString(dsMapIndex,(char*)"error",(char*)[snapshot.error.localizedDescription UTF8String]);
            dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            return;
        }
        
        dsMapAddDouble(dsMapIndex,(char*)"transferred",snapshot.progress.completedUnitCount);
        dsMapAddDouble(dsMapIndex,(char*)"total",snapshot.progress.totalUnitCount);
        
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    return listener;
}

-(double) SDKFirebaseStorage_Delete:(NSString*)firebasePath bucket:(NSString*) bucket
{
    double listener = [self Firestore_getListenerInd];
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    [ref deleteWithCompletion:^(NSError *error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_Delete");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        if(error)
            dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
        else
            dsMapAddDouble(dsMapIndex,(char*)"success",1.0);

        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    return listener;
}

-(double) SDKFirebaseStorage_GetURL:(NSString*)firebasePath bucket:(NSString*) bucket
{
    double listener = [self Firestore_getListenerInd];
    
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];

    [ref downloadURLWithCompletion:^(NSURL *URL, NSError *error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_GetURL");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        if(error)
            dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
            dsMapAddString(dsMapIndex,(char*)"value",(char*)[[URL absoluteString] UTF8String]);
        }

        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    return listener;
}

-(double) SDKFirebaseStorage_List:(NSString*)firebasePath max:(double) maxResults page:(NSString*) pageToken bucket:(NSString*) bucket
{
	double listener = [self Firestore_getListenerInd];
	
    FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    
    id callback = ^(FIRStorageListResult * _Nonnull result, NSError * _Nullable error)
   {
       int dsMapIndex = dsMapCreate();
       dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_List");
       dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
       dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
       
       if(error)
           dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
       else
       {
           dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
           dsMapAddString(dsMapIndex,(char*)"pageToken",(char*)[[result pageToken] UTF8String]);
           dsMapAddString(dsMapIndex,(char*)"files",(char*)[[self listOfReferencesToJSON:result.items] UTF8String]);
           dsMapAddString(dsMapIndex,(char*)"folders",(char*)[[self listOfReferencesToJSON:result.prefixes] UTF8String]);
       }

       CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
   };
    
    if([pageToken isEqualToString:@""])
        [ref listWithMaxResults: maxResults completion:callback];
    else
        [ref listWithMaxResults:maxResults pageToken:pageToken completion:callback];
	
	return listener;
}

-(double) SDKFirebaseStorage_ListAll:(NSString*)firebasePath bucket:(NSString*)bucket
{
	double listener = [self Firestore_getListenerInd];
	
	FIRStorageReference *ref = [[[FIRStorage storage] reference] child:firebasePath];
    [ref listAllWithCompletion:^(FIRStorageListResult * _Nonnull result, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseStorage_ListAll");
        dsMapAddDouble(dsMapIndex,(char*)"listener",listener);
        dsMapAddString(dsMapIndex,(char*)"path",(char*)[firebasePath UTF8String]);
        
        if(error)
            dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
//            dsMapAddString(dsMapIndex,"pageToken",(char*)[[result pageToken] UTF8String]);
            dsMapAddString(dsMapIndex,(char*)"files",(char*)[[self listOfReferencesToJSON:result.items] UTF8String]);
            dsMapAddString(dsMapIndex,(char*)"folders",(char*)[[self listOfReferencesToJSON:result.prefixes] UTF8String]);
        }

        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
    
     return listener;
}
     
	
-(NSString*) listOfReferencesToJSON:(NSArray<FIRStorageReference *>*) list
{
	NSMutableArray *mutList = [NSMutableArray new];
	for(FIRStorageReference *ref in list)
	{
		[mutList addObject: ref.fullPath];
	}
	return [YYFirebaseStorage toJSON:mutList];
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

@end


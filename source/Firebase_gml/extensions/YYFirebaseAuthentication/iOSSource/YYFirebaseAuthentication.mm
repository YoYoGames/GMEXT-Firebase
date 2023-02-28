
#import "YYFirebaseAuthentication.h"
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

@implementation YYFirebaseAuthentication

-(id) init
{
	if(self = [super init])
	{
		if(![FIRApp defaultApp])
			[FIRApp configure];
			
		return self;
	}
}
	
-(int)getListenerInd
{
    listener_id++;
    return(listener_id);
}

-(void) Init
{
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
	listener_id = 5000;
    _listener_idToken = nil;
}


-(NSString*) SDKFirebaseAuthentication_GetUserData
{
    return [YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:[FIRAuth auth].currentUser];
}

+(NSString*) SDKFirebaseAuthentication_GetUserData_From:(FIRUser*) user
{
    if(user == NULL)
        return(@"{}");

    NSMutableDictionary *userMap = [[NSMutableDictionary alloc]init];
    [userMap setValue:user.displayName forKey:@"displayName"];
    [userMap setValue:user.email forKey:@"email"];
    [userMap setValue:user.phoneNumber forKey:@"phoneNumber"];
    [userMap setValue:user.uid forKey:@"localId"];
//    [userMap setValue:providerID forKey:@"Provider"];
    [userMap setValue:[NSNumber numberWithBool: user.emailVerified] forKey:@"emailVerified"];
    if([user photoURL] != nil)
        [userMap setValue:[user photoURL].absoluteString forKey:@"photoUrl"];
    [userMap setValue:[NSNumber numberWithDouble: [user.metadata.lastSignInDate timeIntervalSince1970]] forKey:@"lastLoginAt"];
    [userMap setValue:[NSNumber numberWithDouble: [user.metadata.creationDate timeIntervalSince1970]] forKey:@"createdAt"];
    
    NSMutableArray *array = [NSMutableArray new];
    NSArray *providerArray = [user providerData];
    for(int a = 0 ; a < [providerArray count] ; a++)
    {
        id userInfo = providerArray[a];
        NSMutableDictionary *providerObj = [NSMutableDictionary new];
        [providerObj setValue:[userInfo displayName] forKey:@"displayName"];
        [providerObj setValue:[userInfo email] forKey:@"email"];
        [providerObj setValue:[userInfo phoneNumber] forKey:@"phoneNumber"];
        if([userInfo photoURL] != nil)
            [providerObj setValue:[userInfo photoURL].absoluteString forKey:@"photoUrl"];
        [providerObj setValue:(NSString*)[userInfo providerID] forKey:@"providerId"];
        [providerObj setValue:[userInfo uid] forKey:@"rawId"];
        [providerObj setValue:[userInfo uid] forKey:@"federatedId"];
        
        [array addObject:providerObj];
    }
    [userMap setObject:array forKey:@"providerUserInfo"];
    
    NSMutableArray *arrayUsers = [NSMutableArray new];
    [arrayUsers addObject:userMap];
    
    NSMutableDictionary *root = [[NSMutableDictionary alloc]init];
    [root setValue:@"identitytoolkit#GetAccountInfoResponse" forKey:@"kind"];
    [root setObject:arrayUsers forKey:@"users"];
    
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:root options:0 error:&err];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return(jsonStr);
}

-(double) SDKFirebaseAuthentication_SignInWithCustomToken:(NSString*) token
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth] signInWithCustomToken:token completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignInWithCustomToken");
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignIn_Email:(NSString*)email pass:(NSString*)password
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError *error) 
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_Email");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
		if(error)
        {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
		else
        {
			dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
		CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignUp_Email:(NSString*)email pass:(NSString*)password
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth] createUserWithEmail:email password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError *_Nullable error)
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_Email");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
		if(error)
			{dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
		else
        {
			dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
		CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignIn_Anonymously
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth] signInAnonymouslyWithCompletion:^(FIRAuthDataResult * _Nullable authResult, NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_Anonymously");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
     }];
	 return (double)Id;
}

-(double) SDKFirebaseAuthentication_SendPasswordResetEmail:(NSString*) email
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth] sendPasswordResetWithEmail:email completion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SendPasswordResetEmail");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ChangeEmail: (NSString*) email
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser updateEmail:email completion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_ChangeEmail");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ChangePassword:(NSString*) password
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser updatePassword:password completion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_ChangePassword");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ChangeDisplayName:(NSString*) name
{
	const int Id = [self getListenerInd];
    FIRUserProfileChangeRequest *changeRequest = [[FIRAuth auth].currentUser profileChangeRequest];
    changeRequest.displayName = name;
    [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"SDKFirebaseAuthentication_ChangeDisplayName");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ChangePhotoURL:(NSString*) photoURL
{
	const int Id = [self getListenerInd];
    FIRUserProfileChangeRequest *changeRequest = [[FIRAuth auth].currentUser profileChangeRequest];
    changeRequest.photoURL = [NSURL URLWithString: photoURL];
    [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"SDKFirebaseAuthentication_ChangePhotoURL");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SendEmailVerification
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser sendEmailVerificationWithCompletion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SendEmailVerification");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_DeleteAccount
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser deleteWithCompletion:^(NSError *_Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_DeleteAccount");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignOut
{
    [[FIRAuth auth] signOut:NULL];
}

-(double) SDKFirebaseAuthentication_LinkWithEmailPassword:(NSString*) email pass:(NSString*) password
{
	const int Id = [self getListenerInd];
    FIRAuthCredential *credential = [FIREmailAuthProvider credentialWithEmail:email password:password];
    [[FIRAuth auth].currentUser linkWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_LinkWithEmailPassword");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);   dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignIn_OAuth:(NSString*) token kind:(NSString*) token_kind provider:(NSString*)provider uri:(NSString*) requestUri
{
	const int Id = [self getListenerInd];
    FIRAuthCredential *authCredential = [YYFirebaseAuthentication getAuthCredentialFromProvider:token kind:token_kind provider:provider];
    [[FIRAuth auth] signInWithCredential:authCredential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_OAuth");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}];
	return (double)Id;
 }

-(double) SDKFirebaseAuthentication_LinkWithOAuthCredential:(NSString*) token kind:(NSString*) token_kind provider:(NSString*)provider uri:(NSString*) requestUri
{
	const int Id = [self getListenerInd];
    FIRAuthCredential *credential = [YYFirebaseAuthentication getAuthCredentialFromProvider:token kind:token_kind provider:provider];
    [[FIRAuth auth].currentUser linkWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_LinkWithOAuthCredential");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

+(FIRAuthCredential*) getAuthCredentialFromProvider:(NSString*) token kind:(NSString*) token_kind provider:(NSString*)provider
{
	FIRAuthCredential *authCredential = nil;
    if([provider isEqualToString:@"facebook.com"])
        authCredential = [FIRFacebookAuthProvider credentialWithAccessToken:token];
    
    if([provider isEqualToString:@"google.com"])
    if([token_kind isEqualToString:@"id_token"])
        authCredential = [FIRGoogleAuthProvider credentialWithIDToken:token accessToken:@""];
    else
    if([token_kind isEqualToString:@"access_token"])
        authCredential = [FIRGoogleAuthProvider credentialWithIDToken:@"" accessToken:token];
    
    if([provider isEqualToString:@"apple.com"])
    {
        authCredential = [FIROAuthProvider credentialWithProviderID:@"apple.com" IDToken:token rawNonce:[YYFirebaseAuthentication randomNonce:32]];
    }
    
	return authCredential;
}

-(double) SDKFirebaseAuthentication_UnlinkProvider:(NSString*) provider
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser unlinkFromProvider:provider completion:^(FIRUser * _Nullable user, NSError * _Nullable error)
     {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_UnlinkProvider");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_RefreshUserData
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser reloadWithCompletion:^(NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_RefreshUserData");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_GetIdToken
{
	const int Id = [self getListenerInd];
    [[FIRAuth auth].currentUser getIDTokenWithCompletion:^(NSString * _Nullable token, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_GetIdToken");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[token UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignIn_GameCenter
{
	const int Id = [self getListenerInd];
    [FIRGameCenterAuthProvider getCredentialWithCompletion:^(FIRAuthCredential *credential, NSError *error)
    {
        if(error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_GameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }
        
        [[FIRAuth auth] signInWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignIn_GameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            if(error)
                {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            else
            {
                dsMapAddDouble(dsMapIndex,(char*)"status",200);
                dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
            }
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }];
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_LinkWithGameCenter
{
	const int Id = [self getListenerInd];
    [FIRGameCenterAuthProvider getCredentialWithCompletion:^(FIRAuthCredential *credential, NSError *error)
    {
        if(error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_LinkWithGameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }
        
        [[FIRAuth auth].currentUser linkWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type","FirebaseAuthentication_LinkWithGameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            if(error)
                {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            else
            {
                dsMapAddDouble(dsMapIndex,(char*)"status",200);
                dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
            }
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }];
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ReauthenticateWithGameCenter
{
	const int Id = [self getListenerInd];
    [FIRGameCenterAuthProvider getCredentialWithCompletion:^(FIRAuthCredential *credential, NSError *error)
    {
        if(error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"SDKFirebaseAuthentication_ReauthenticateWithGameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }
        
        [[FIRAuth auth].currentUser reauthenticateWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,(char*)"type",(char*)"SDKFirebaseAuthentication_ReauthenticateWithGameCenter");
			dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
            if(error)
                {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
            else
            {
                dsMapAddDouble(dsMapIndex,(char*)"status",200);
                dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
            }
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        }];
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_SignInWithPhoneNumber:(NSString*) phoneNumber code:(NSString*) code sessionInfo:(NSString*) sessionInfo
{
	const int Id = [self getListenerInd];
    FIRPhoneAuthCredential* credential = [[FIRPhoneAuthProvider providerWithAuth:[FIRAuth auth]] credentialWithVerificationID:sessionInfo verificationCode:code];
    
    [[FIRAuth auth] signInWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_SignInWithPhoneNumber");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_LinkWithPhoneNumber:(NSString*) phoneNumber code:(NSString*) code sessionInfo:(NSString*) sessionInfo
{
	const int Id = [self getListenerInd];
    FIRPhoneAuthCredential* credential = [[FIRPhoneAuthProvider providerWithAuth:[FIRAuth auth]] credentialWithVerificationID:sessionInfo verificationCode:code];
    
    [[FIRAuth auth].currentUser linkWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"SDKFirebaseAuthentication_LinkWithPhoneNumber");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ReauthenticateWithEmail:(NSString*)email pass:(NSString*) password
{
	const int Id = [self getListenerInd];
    FIRAuthCredential *credential = [FIREmailAuthProvider credentialWithEmail:email password:password];
    [[FIRAuth auth].currentUser reauthenticateWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_ReauthenticateWithEmail");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ReauthenticateWithOAuth:(NSString*)token tokenKind: (NSString*) token_kind provider:(NSString*) provider uri:(NSString*) requestUri
{
	const int Id = [self getListenerInd];
    FIRAuthCredential *credential = [YYFirebaseAuthentication getAuthCredentialFromProvider:token kind:token_kind provider:provider];
    [[FIRAuth auth].currentUser reauthenticateWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_ReauthenticateWithOAuth");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	
	return (double)Id;
}

-(double) SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber: (NSString*) phoneNumber code:(NSString*) code sessioninfo:(NSString*) sessionInfo
{
	const int Id = [self getListenerInd];
    FIRPhoneAuthCredential* credential = [[FIRPhoneAuthProvider providerWithAuth:[FIRAuth auth]] credentialWithVerificationID:sessionInfo verificationCode:code];
    [[FIRAuth auth].currentUser reauthenticateWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_ReauthenticateWithPhoneNumber");
		dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
        if(error)
            {dsMapAddDouble(dsMapIndex,(char*)"status",400);  dsMapAddString(dsMapIndex,(char*)"errorMessage",(char*)[[error localizedDescription] UTF8String]);}
        else
        {
            dsMapAddDouble(dsMapIndex,(char*)"status",200);
            dsMapAddString(dsMapIndex, (char*)"value", (char*)[[YYFirebaseAuthentication SDKFirebaseAuthentication_GetUserData_From:authResult.user]UTF8String]);
        }
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
	
	return (double)Id;
}

+ (NSString *)randomNonce:(NSInteger)length//used only for Apple Login
{
  NSAssert(length > 0, @"Expected nonce to have positive length");
  NSString *characterSet = @"0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._";
  NSMutableString *result = [NSMutableString string];
  NSInteger remainingLength = length;

  while (remainingLength > 0) {
    NSMutableArray *randoms = [NSMutableArray arrayWithCapacity:16];
    for (NSInteger i = 0; i < 16; i++) {
      uint8_t random = 0;
      int errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random);
      NSAssert(errorCode == errSecSuccess, @"Unable to generate nonce: OSStatus %i", errorCode);

      [randoms addObject:@(random)];
    }

    for (NSNumber *random in randoms) {
      if (remainingLength == 0) {
        break;
      }

      if (random.unsignedIntValue < characterSet.length) {
        unichar character = [characterSet characterAtIndex:random.unsignedIntValue];
        [result appendFormat:@"%C", character];
        remainingLength--;
      }
    }
  }
  return result;
}

-(double) SDKFirebaseAuthentication_IdTokenListener
{
    const int Id = [self getListenerInd];
    
    _listener_idToken = [[FIRAuth auth] addIDTokenDidChangeListener: ^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user)
     {
         if(user == nil)
         {
             int dsMapIndex = dsMapCreate();
             dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_IdTokenListener");
             dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
                 dsMapAddDouble(dsMapIndex,(char*)"status",400);
                 dsMapAddString(dsMapIndex, (char*)"value", (char*)"");
             CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
         }
         
         [user getIDTokenForcingRefresh:false completion:^(NSString * _Nullable token, NSError * _Nullable error)
          {
              if(error == nil)
              {
                  int dsMapIndex = dsMapCreate();
                  dsMapAddString(dsMapIndex,(char*)"type",(char*)"FirebaseAuthentication_IdTokenListener");
                  dsMapAddDouble(dsMapIndex,(char*)"listener",Id);
                  dsMapAddDouble(dsMapIndex,(char*)"status",200);
                  dsMapAddString(dsMapIndex, (char*)"value", (char*)[token UTF8String]);
                  CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
              }
          }];
     }];
	return(Id);
}

-(void) SDKFirebaseAuthentication_IdTokenListener_Remove
{
    if(_listener_idToken != nil)
	{
        [[FIRAuth auth] removeIDTokenDidChangeListener: _listener_idToken];
        _listener_idToken = nil;
	}
}


// function SDKFirebaseAuthentication_SignInWithProvider(provider,jsonArray_scopes)
// function SDKFirebaseAuthentication_LinkWithProvider(provider,jsonArray_scopes)
// function SDKFirebaseAuthentication_ReauthenticateWithProvider(provider,jsonArray_scopes)


@end


#import "GameCenter.h"

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

@implementation GameCenter

-(id)init {
    if ( self = [super init] ) {
        return self;
    }
}

////////////////GKGameCenterViewController
// https://developer.apple.com/documentation/gamekit/gkgamecenterviewcontroller?language=objc

-(double) GameCenter_PresentView_Default
{
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateDefault];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
    [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateDefault;
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievements
{
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateAchievements];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
    [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievement:(NSString*) ach_id
{
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithAchievementID: ach_id];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
    [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    } else {
        NSLog(@"GameCenter_PresentView_Achievement No Available Until iOS 14.0");
    }
    return 1;
}

- (double) GameCenter_PresentView_Leaderboards
{
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateLeaderboards];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
    [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    }
    return 1;
}

- (double) GameCenter_PresentView_Leaderboard:(NSString*) leaderboardId leaderboardTimeScope: (double) leaderboardTimeScope playerScope:(double) playerScope
{
    GKLeaderboardPlayerScope mGKLeaderboardPlayerScope;
    
    switch((int) leaderboardTimeScope)
    {
        case 0: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeGlobal; break;
        case 1: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeFriendsOnly; break;
    }
    
    GKLeaderboardTimeScope mGKLeaderboardTimeScope;
    switch((int) playerScope)
    {
        case 0: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeToday; break;
        case 1: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeWeek; break;
        case 2: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeAllTime; break;
    }
    
    if (@available(iOS 14.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithLeaderboardID:leaderboardId playerScope:mGKLeaderboardPlayerScope timeScope:mGKLeaderboardTimeScope];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
    [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        gameCenterController.leaderboardIdentifier = leaderboardId;
        gameCenterController.leaderboardTimeScope = mGKLeaderboardTimeScope;
        
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
    }
    return 1;
}

////GKGameCenterControllerDelegate
//https://developer.apple.com/documentation/gamekit/gkgamecentercontrollerdelegate?language=objc
- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;
{
    [g_controller dismissViewControllerAnimated:YES completion:nil];
    
        int dsMapIndex = CreateDsMap(1,
                                "type", 0.0, "GameCenter_PresentView_DidFinish");
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
}

////////////// GKLocalPlayer
//https://developer.apple.com/documentation/gamekit/gklocalplayer?language=objc
-(void) GameCenter_LocalPlayer_Authenticate
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    localPlayer.authenticateHandler  = ^(UIViewController *viewController, NSError *error)
    {
        double success;
        if(error == nil)
            success = 1.0;
        else
        {
            success = 0.0;
            NSLog([error localizedDescription]);
        }
            
        int dsMapIndex = CreateDsMap(2,
                                     "type", 0.0, "GameCenter_Authenticate",
                                     "success", success, (void*)NULL);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);

        if(viewController != nil)
        {
            [g_controller presentViewController: viewController animated:YES completion: NULL];
            [localPlayer registerListener: self];
        }
    };
}

//GameCenter_GKLocalPlayer_generateIdentityVerificationSignatureWithCompletionHandler()////NO YET
-(double) GameCenter_LocalPlayer_IsAuthenticated
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if(localPlayer.isAuthenticated)
        return 1;
    else
        return 0;
}

-(double) GameCenter_LocalPlayer_IsUnderage
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    if(localPlayer.isUnderage)
        return 1;
    else
        return 0;
}

-(NSString*) GameCenter_LocalPlayer_GetInfo
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    return([GameCenter GKPlayerJSON:localPlayer]);
}

-(void) GameCenter_SavedGames_Fetch
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        if(savedGames != nil)
        for(GKSavedGame *savedGame in savedGames)
            [array addObject:[GameCenter GKSavedGameDic: savedGame]];
        
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex,"type","GameCenter_SavedGames_Fetch");
        dsMapAddString(dsMapIndex,"slots",(char*)[[GameCenter toJSON: array] UTF8String]);
        if(error == nil)
            dsMapAddDouble(dsMapIndex,"success",1);
        else
        {
            dsMapAddDouble(dsMapIndex,"success",0);
            NSLog([error localizedDescription]);
        }
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

-(void) GameCenter_SavedGames_Save: (NSString*) name data: (NSString*) mNSData
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    [localPlayer saveGameData:[mNSData dataUsingEncoding:NSUTF8StringEncoding] withName:name completionHandler:^(GKSavedGame * _Nullable savedGame, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_Save");
        dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
        dsMapAddString(dsMapIndex, "slot",(char*)[[GameCenter GKSavedGameJSON: savedGame]UTF8String]);
        if(error == nil)
            dsMapAddDouble(dsMapIndex, "success",1);
        else
        {
            dsMapAddDouble(dsMapIndex, "success",0);
            NSLog([error localizedDescription]);
        }
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

-(void) GameCenter_SavedGames_Delete: (NSString*) name
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    [localPlayer deleteSavedGamesWithName:name completionHandler:^(NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_Delete");
        dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
        if(error == nil)
            dsMapAddDouble(dsMapIndex, "success",1);
        else
        {
            dsMapAddDouble(dsMapIndex, "success",0);
            NSLog([error localizedDescription]);
        }
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

-(void) GameCenter_SavedGames_GetData: (NSString*) name
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        if(error != nil)
        {
            NSLog([error localizedDescription]);
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_GetData");
            dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
            dsMapAddDouble(dsMapIndex, "success",0);
            createSocialAsyncEventWithDSMap(dsMapIndex);
            return;
        }
                
        for(GKSavedGame *mGKSavedGame in savedGames)
        if([[mGKSavedGame name] isEqualToString:name])
        {
            [mGKSavedGame loadDataWithCompletionHandler:^(NSData * _Nullable data, NSError * _Nullable error)
            {
                int dsMapIndex = dsMapCreate();
                dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_GetData");
                dsMapAddString(dsMapIndex, "name",(char*)[name UTF8String]);
                if(error == nil && data != nil)
                {
                    dsMapAddDouble(dsMapIndex, "success",1);
                    
                    const void *_Nullable rawData = [data bytes];
                    if(rawData != nil)
                        dsMapAddString(dsMapIndex, "data",(char *)rawData);
                }
                else
                {
                    dsMapAddDouble(dsMapIndex, "success",0);
                    NSLog([error localizedDescription]);
                }
                createSocialAsyncEventWithDSMap(dsMapIndex);
            }];
            break;
        }
    }];
}


-(void) GameCenter_SavedGames_ResolveConflict:(double) conflict_ind data:(NSString*) data
{
    GKLocalPlayer *localPlayer = GKLocalPlayer.localPlayer;
    [localPlayer resolveConflictingSavedGames:self.ArrayOfConflicts[(int)conflict_ind] withData:[data dataUsingEncoding:NSUTF8StringEncoding] completionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_ResolveConflict");
        dsMapAddDouble(dsMapIndex, "conflict_ind",conflict_ind);
        if(error == nil)
            dsMapAddDouble(dsMapIndex, "success",1);
        else
        {
            dsMapAddDouble(dsMapIndex, "success",0);
            NSLog([error localizedDescription]);
        }
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

///////////GKSavedGameListener
//https://developer.apple.com/documentation/gamekit/gksavedgamelistener?language=objc

- (void)player:(GKPlayer *)player hasConflictingSavedGames:(NSArray<GKSavedGame *> *)savedGames
{
    double conflict_ind = self.ArrayOfConflicts.count;
    [self.ArrayOfConflicts addObject: savedGames];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(GKSavedGame *savedGame in savedGames)
        [array addObject:[GameCenter GKSavedGameJSON: savedGame]];
    
    int dsMapIndex = dsMapCreate();
    dsMapAddString(dsMapIndex, "type","GameCenter_SavedGames_HasConflict");
    dsMapAddDouble(dsMapIndex, "conflict_ind",conflict_ind);
    dsMapAddString(dsMapIndex, "slots",(char*)[[GameCenter toJSON: array] UTF8String]);
    createSocialAsyncEventWithDSMap(dsMapIndex);
}

- (void)player:(GKPlayer *)player didModifySavedGame:(GKSavedGame *)savedGame;
{
    int dsMapIndex = CreateDsMap(4,
                                 "type", 0.0, "GameCenter_SavedGames_DidModify",
                                 "player",0.0,[[GameCenter GKPlayerJSON:player]UTF8String],
                                 "slot",0.0,[[GameCenter GKSavedGameJSON:savedGame] UTF8String]);
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
}

////////////////// GKBasePlayer
//https://developer.apple.com/documentation/gamekit/gkbaseplayer?language=objc
+(NSString*) GKSavedGameJSON: (GKSavedGame*) mGKSavedGame
{
    NSDictionary *dic = [GameCenter GKSavedGameDic: mGKSavedGame];
    return [GameCenter toJSON:dic];
}

+(NSDictionary*) GKSavedGameDic: (GKSavedGame*) mGKSavedGame
{
    NSDictionary *mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [mGKSavedGame deviceName], @"deviceName",
                      [NSNumber numberWithDouble:[[mGKSavedGame modificationDate] timeIntervalSince1970]], @"modificationDate",
                      [mGKSavedGame name], @"name",
                      nil];
    
    return mNSDictionary;
}

//GKScore
//https://developer.apple.com/documentation/gamekit/gkscore?language=objc
-(void) GameCenter_Leaderboard_Submit: (NSString*) leaderboardID score: (double) score
{
    GKScore *mGKScore = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardID];
    mGKScore.value = score;
    [GKScore reportScores: @[mGKScore] withCompletionHandler:^(NSError * _Nullable error)
    {
        double success;
        if(error == nil)
            success = 1.0;
        else
        {
            success = 0.0;
            NSLog([error localizedDescription]);
        }
        
        int dsMapIndex = CreateDsMap(2,
                                     "type", 0.0, "GameCenter_Leaderboard_Submit",
                                     "success", success, (void*)NULL);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
}

//GKAchievement
//https://developer.apple.com/documentation/gamekit/gkachievement?language=objc
-(void) GameCenter_Achievement_Report: (NSString*) identifier percentComplete: (double) percent
{
    GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: identifier];
    achievement.showsCompletionBanner = TRUE;
    
    achievement.percentComplete = (float) percent;
    [GKAchievement reportAchievements:@[achievement] withCompletionHandler:^(NSError *error)
    {
         double success;
         if (error == nil)
             success = 1;
         else
         {
             success = 0;
             NSLog([error localizedDescription]);
         }
         
         int dsMapIndex = CreateDsMap(2,
                                      "type", 0.0, "GameCenter_Achievement_Report",
                                      "success", success, (void*)NULL);
         CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    }];
}

-(void) GameCenter_Achievement_ResetAll
{
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError * _Nullable error)
    {
        double success;
        if (error == nil)
            success = 1;
        else
        {
            success = 0;
            NSLog([error localizedDescription]);
        }
        
        int dsMapIndex = CreateDsMap(2,
                                 "type", 0.0, "GameCenter_Achievement_ResetAll",
                                 "success", success, (void*)NULL);
        CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
        
    }];
}

////////////////// GKPlayer
//https://developer.apple.com/documentation/gamekit/gkplayer?language=objc
+(NSString*) GKPlayerJSON: (GKPlayer*) mGKPlayer
{
    NSDictionary *mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [mGKPlayer alias], @"alias",
                                   [mGKPlayer displayName], @"displayName",
                                   [mGKPlayer playerID], @"playerID",
//                                   [self GKBasePlayerJSON: mGKPlayer], @"GKBasePlayer",
                                   nil];
    return [GameCenter toJSON:mNSDictionary];
}

/////////TOOLS

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

////////////////////3th party integration

-(void) GameCenter_FetchItemsForIdentityVerificationSignature
{
    GKLocalPlayer *mGKLocalPlayer = [GKLocalPlayer localPlayer];
    [mGKLocalPlayer fetchItemsForIdentityVerificationSignature:^(NSURL * _Nullable publicKeyURL, NSData * _Nullable signature, NSData * _Nullable salt, uint64_t timestamp, NSError * _Nullable error)
    {
		
		//If we can do the HTTP request from GML better, but for moment we have more control from ObjC
        // int dsMapIndex = dsMapCreate();
        // dsMapAddString(dsMapIndex,"type" ,"GameCenter_FetchItemsForIdentityVerificationSignature");

        if (error == nil)
        {
			// NSString *signature64 = [signature base64EncodedStringWithOptions:0];
            // NSString *salt64 = [salt base64EncodedStringWithOptions:0];
            // dsMapAddDouble(dsMapIndex, "success",1.0);
            // dsMapAddString(dsMapIndex, "publicKeyURL",(char*)[publicKeyURL.absoluteString UTF8String]);
            // dsMapAddString(dsMapIndex, "signature",(char *)[signature64 UTF8String]);
            // dsMapAddString(dsMapIndex, "salt",(char *)[salt64 UTF8String]);
			// NSString *str_timestamp = [NSString stringWithFormat:@"%llu", timestamp];
            // dsMapAddString(dsMapIndex, "timestamp",(char *)[str_timestamp UTF8String]);
			
			////////////////////////////////Doing HTTP request from OBJC:
			
						NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://identitytoolkit.googleapis.com/v1/accounts:signInWithGameCenter?key=AIzaSyB13_DEtW1P0WQYTFU8ldyssB-1aLKYFuI"]];

						[urlRequest setHTTPMethod:@"POST"];
						//NSLog([GKLocalPlayer localPlayer].playerID);
						NSDictionary *dic_body = @{
							@"publicKeyUrl":[publicKeyURL absoluteString],
							@"timestamp":[NSString stringWithFormat:@"%llu", timestamp],
							@"signature":[signature base64EncodedStringWithOptions:0],
							@"salt":[salt base64EncodedStringWithOptions:0],
							@"playerId":[GKLocalPlayer localPlayer].playerID,
						};
						[urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
						[urlRequest setValue:[[NSBundle mainBundle] bundleIdentifier]/*@"com.yoyogames.yygfirebase"*/ forHTTPHeaderField:@"x-ios-bundle-identifier"];

						//NSMutableDictionary *mutableDictionary = [dic_body mutableCopy];
						NSData *data = [NSJSONSerialization dataWithJSONObject:dic_body options:NSJSONWritingPrettyPrinted error:nil];
						
			//            [urlRequest setAllHTTPHeaderFields:dic_header];
						[urlRequest setHTTPBody:data];//[NSKeyedArchiver archivedDataWithRootObject:dic_body]];
						
						NSURLSession *session = [NSURLSession sharedSession];
						NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
						{
							NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
							//if(httpResponse.statusCode == 200)
							{
								NSError *parseError = nil;
								NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
								NSLog(@"The response is - %@",responseDictionary);
							}
						}];
						[dataTask resume];
						
			///////////////////////////////HTTP request on OBJC END
			
        }
        else
        {
            // dsMapAddDouble(dsMapIndex, "success",0.0);
            NSLog([error localizedDescription]);
        }
        // createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

@end


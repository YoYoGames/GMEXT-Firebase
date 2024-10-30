#include "TargetConditionals.h"

#import "GameCenter.h"

#if !TARGET_OS_OSX
    extern UIViewController *g_controller;
#else
    extern NSViewController *g_controller;
#endif

#if TARGET_OS_OSX
NSViewController* g_controller = nil;
NSWindow* g_window = nil;

GameCenter* g_GameCenterSingleton = nil;
#endif


#if TARGET_OS_OSX
#import "Extension_Interface.h"
#include "YYRValue.h"
#include <sstream>
#endif

const int EVENT_OTHER_SOCIAL = 70;

#if TARGET_OS_OSX
YYRunnerInterface gs_runnerInterface;
YYRunnerInterface* g_pYYRunnerInterface;
#else
extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
//extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
//extern "C" void DsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
void /*double*/ dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern "C" void dsMapAddDouble(int _dsMap, const char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, const char* _key, const char* _value);


#endif

#if TARGET_OS_OSX
extern "C" void PreGraphicsInitialisation(char* arg1)//Mac
{

}

YYEXPORT void YYExtensionInitialise(const struct YYRunnerInterface* _pFunctions, size_t _functions_size)
{
    //copy out all the functions
    memcpy(&gs_runnerInterface, _pFunctions, sizeof(YYRunnerInterface));
    g_pYYRunnerInterface = &gs_runnerInterface;

    if (_functions_size < sizeof(YYRunnerInterface)) {
        DebugConsoleOutput("ERROR : runner interface mismatch in extension DLL\n ");
    } // end if

    DebugConsoleOutput("YYExtensionInitialise CONFIGURED \n ");
}
#endif


@implementation GameCenter

int CreateDsMap_comaptibility()
{
    #if TARGET_OS_OSX
    return CreateDsMap(0,0);
    #else
    return CreateDsMap(0,0);
    #endif
}

void DsMapAddString_comaptibility(int dsMapIndex, const char* _key, const char* _value)
{
    #if TARGET_OS_OSX
    DsMapAddString(dsMapIndex, _key, _value);
    #else
    dsMapAddString(dsMapIndex, _key, _value);
    #endif
}

void DsMapAddDouble_comaptibility(int dsMapIndex, const char* _key, double _value)
{
    #if TARGET_OS_OSX
    DsMapAddDouble(dsMapIndex, _key, _value);
    #else
    dsMapAddDouble(dsMapIndex, _key, _value);
    #endif
}

void CreateAsyncEventWithDSMap_comaptibility(int dsMapIndex)
{
    #if TARGET_OS_OSX
    CreateAsyncEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    #else
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    #endif
}

-(id) init {
    self = [super init];
    if (self != nil)
    {
        [[GKLocalPlayer localPlayer] registerListener:self];
        NSLog(@"YYGameCenter: %@", @"Registering GK listener.");
    }
    
    return self;
}

#if TARGET_OS_OSX
-(double) GameCenter_MacOS_SetWindowHandle:(NSWindow*) ptrgamewindowhandle
{
    NSLog(@"YYGameCenter: %@", @"Trying to obtain window handle from GML");

    g_window = ptrgamewindowhandle;
    if (g_window != nil)
    {
        NSLog(@"YYGameCenter: %@", @"Got a valid NSWindow pointer:");
        NSLog(@"YYGameCenter: %@", [g_window title]);
        
        GKDialogController* dialogController = [GKDialogController sharedDialogController];
        if (dialogController != nil)
        {
            dialogController.parentWindow = g_window;
            NSLog(@"YYGameCenter: %@", @"Successfully set the window handle!");
            return 1;
        }
        else NSLog(@"YYGameCenter: %@", @"GKDialogController pointer is nil.");
    }
    else NSLog(@"YYGameCenter: %@", @"NSWindow pointer is nil.");
    
    return 0;
}
#endif

////////////////GKGameCenterViewController
// https://developer.apple.com/documentation/gamekit/gkgamecenterviewcontroller?language=objc

-(double) GameCenter_PresentView_Default
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateDefault];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateDefault;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievements
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateAchievements];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateAchievements;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Achievement:(NSString*) ach_id
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithAchievementID: ach_id];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_PresentView_Achievement No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
    return 1;
}

-(double) GameCenter_PresentView_Leaderboards
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithState: GKGameCenterViewControllerStateLeaderboards];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

-(double) GameCenter_PresentView_Leaderboard:(NSString*) leaderboardId leaderboardTimeScope: (double) leaderboardTimeScope playerScope:(double) playerScope
{
    GKLeaderboardPlayerScope mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeGlobal;
    switch((int) leaderboardTimeScope)
    {
        case 0: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeGlobal; break;
        case 1: mGKLeaderboardPlayerScope = GKLeaderboardPlayerScopeFriendsOnly; break;
    }
    
    GKLeaderboardTimeScope mGKLeaderboardTimeScope = GKLeaderboardTimeScopeToday;
    switch((int) playerScope)
    {
        case 0: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeToday; break;
        case 1: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeWeek; break;
        case 2: mGKLeaderboardTimeScope = GKLeaderboardTimeScopeAllTime; break;
    }
    
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] initWithLeaderboardID:leaderboardId playerScope:mGKLeaderboardPlayerScope timeScope:mGKLeaderboardTimeScope];
        if(gameCenterController == nil)
            return 0;
        
        gameCenterController.gameCenterDelegate = self;
        //gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    } else {
        GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
        gameCenterController.gameCenterDelegate = self;
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        gameCenterController.leaderboardIdentifier = leaderboardId;
        gameCenterController.leaderboardTimeScope = mGKLeaderboardTimeScope;
        
#if !TARGET_OS_OSX
        [g_controller presentViewController: gameCenterController animated: YES completion:nil];
#else
        [[GKDialogController sharedDialogController] presentViewController: gameCenterController];
#endif
    }
    return 1;
}

////GKGameCenterControllerDelegate
//https://developer.apple.com/documentation/gamekit/gkgamecentercontrollerdelegate?language=objc
-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;
{
    int dsMapIndex = CreateDsMap_comaptibility();
    DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_PresentView_DidFinish");
    
    if (gameCenterViewController != nil)
    {
#if !TARGET_OS_OSX
        [g_controller dismissViewControllerAnimated:YES completion:nil];
#else
        [[GKDialogController sharedDialogController] dismiss: self];
#endif

        DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
    }
    else
    {
        NSLog(@"YYGameCenter: %@", @"gameCenterViewControllerDidFinish controller is nil");
        DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
    }
    
    CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
}

////////////// GKLocalPlayer
//https://developer.apple.com/documentation/gamekit/gklocalplayer?language=objc
-(double) GameCenter_LocalPlayer_Authenticate
{
    [GKLocalPlayer localPlayer].authenticateHandler = ^(
#if !TARGET_OS_OSX
        UIViewController
#else
        NSViewController
#endif
        * viewController,
        NSError *error)
    {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        int dsMapIndex = CreateDsMap_comaptibility();
        
        DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Authenticate");
        
        // authentication stages:
        if(viewController != nil) // stage 1: presenting the view controller, sometimes it can jump straight to stage 2.
        {
#if !TARGET_OS_OSX
            [g_controller presentViewController: viewController animated:YES completion: NULL];
#else
            NSLog(@"YYGameCenter: %@", [viewController className]);
            [[GKDialogController sharedDialogController] presentViewController: (NSViewController<GKViewController>*)viewController];
#endif
            DsMapAddString_comaptibility(dsMapIndex, "authentication_state", "presenting_view");
        }
        else if (localPlayer.isAuthenticated) // stage 2: we're in!
        {
            DsMapAddString_comaptibility(dsMapIndex, "authentication_state", "authenticated");
        }
        else // something is wrong, viewcontroller is nil, but we are not authenticated?
        {
            DsMapAddString_comaptibility(dsMapIndex, "authentication_state", "unknown");
        }
        
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    };
    
    return 1;
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
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if(localPlayer.isUnderage)
        return 1;
    else
        return 0;
}

-(double) GameCenter_LocalPlayer_IsMultiplayerGamingRestricted
{
    if (@available(iOS 13.0, macOS 10.15, *)) {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        if(localPlayer.isMultiplayerGamingRestricted)
            return 1;
        else
            return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted No Available Until iOS 13.0 or macOS 10.15");
        return 0;
    }
}

-(double) GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        if(localPlayer.isPersonalizedCommunicationRestricted)
            return 1;
        else
            return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(NSString*) GameCenter_LocalPlayer_GetInfo
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    return([GameCenter GKPlayerJSON:localPlayer]);
}

-(double) GameCenter_SavedGames_Fetch
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        if(savedGames != nil)
        for(GKSavedGame *savedGame in savedGames)
            [array addObject:[GameCenter GKSavedGameDic: savedGame]];
        
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex,"type","GameCenter_SavedGames_Fetch");
        DsMapAddString_comaptibility(dsMapIndex,"slots",(char*)[[GameCenter toJSON: array] UTF8String]);
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_Save: (NSString*) name data: (NSString*) mNSData
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer saveGameData:[mNSData dataUsingEncoding:NSUTF8StringEncoding] withName:name completionHandler:^(GKSavedGame * _Nullable savedGame, NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_Save");
        DsMapAddString_comaptibility(dsMapIndex, "name",(char*)[name UTF8String]);
        DsMapAddString_comaptibility(dsMapIndex, "slot",(char*)[[GameCenter GKSavedGameJSON: savedGame]UTF8String]);
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_Delete: (NSString*) name
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer deleteSavedGamesWithName:name completionHandler:^(NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_Delete");
        DsMapAddString_comaptibility(dsMapIndex, "name",(char*)[name UTF8String]);
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 1;
}

-(double) GameCenter_SavedGames_GetData: (NSString*) name
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer fetchSavedGamesWithCompletionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        if (error != nil)
        {
            int dsMapIndex = CreateDsMap_comaptibility();
            DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_GetData");
            DsMapAddString_comaptibility(dsMapIndex, "name",(char*)[name UTF8String]);
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
            return;
        }
                
        for(GKSavedGame *mGKSavedGame in savedGames)
        if([[mGKSavedGame name] isEqualToString:name])
        {
            [mGKSavedGame loadDataWithCompletionHandler:^(NSData * _Nullable data, NSError * _Nullable error)
            {
                int dsMapIndex = CreateDsMap_comaptibility();
                DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_GetData");
                DsMapAddString_comaptibility(dsMapIndex, "name",(char*)[name UTF8String]);
                
                if (error != nil)
                {
                    DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                    DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                    DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
                
                if (data != nil)
                {
                    const void *_Nullable rawData = [data bytes];
                    if(rawData != nil)
                        DsMapAddString_comaptibility(dsMapIndex, "data",(char *)rawData);
                }
                
                CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
            }];
            break;
        }
    }];
    
    return 1;
}


-(double) GameCenter_SavedGames_ResolveConflict:(double) conflict_ind data:(NSString*) data
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer resolveConflictingSavedGames:self.ArrayOfConflicts[(int)conflict_ind] withData:[data dataUsingEncoding:NSUTF8StringEncoding] completionHandler:^(NSArray<GKSavedGame *> * _Nullable savedGames, NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_ResolveConflict");
        DsMapAddDouble_comaptibility(dsMapIndex, "conflict_ind",conflict_ind);
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 1;
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
    
    int dsMapIndex = CreateDsMap_comaptibility();
    DsMapAddString_comaptibility(dsMapIndex, "type","GameCenter_SavedGames_HasConflict");
    DsMapAddDouble_comaptibility(dsMapIndex, "conflict_ind",conflict_ind);
    DsMapAddString_comaptibility(dsMapIndex, "slots",(char*)[[GameCenter toJSON: array] UTF8String]);
    CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
}

- (void)player:(GKPlayer *)player didModifySavedGame:(GKSavedGame *)savedGame;
{
    int dsMapIndex = CreateDsMap_comaptibility();
    DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_SavedGames_DidModify");
    DsMapAddString_comaptibility(dsMapIndex, "player", (char*)[[GameCenter GKPlayerJSON:player] UTF8String]);
    DsMapAddString_comaptibility(dsMapIndex, "slot", (char*)[[GameCenter GKSavedGameJSON:savedGame] UTF8String]);
    CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
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
-(double) GameCenter_Leaderboard_Submit: (NSString*) leaderboardID score: (double) score dcontext: (double) dcontext
{
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKLeaderboard submitScore:(NSInteger)score context:(NSUInteger)dcontext player:[GKLocalPlayer localPlayer] leaderboardIDs:@[ leaderboardID ] completionHandler:^(NSError * _Nullable error) {
            int dsMapIndex = CreateDsMap_comaptibility();
            DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Leaderboard_Submit");
            if (error != nil)
            {
                DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            }
            else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
            CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
        }];
    }
    else {
        GKScore *mGKScore = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardID];
        mGKScore.value = (int64_t)score;
        mGKScore.context = (uint64_t)dcontext;
        [GKScore reportScores: @[mGKScore] withCompletionHandler:^(NSError * _Nullable error)
        {

            int dsMapIndex = CreateDsMap_comaptibility();
            DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Leaderboard_Submit");
            if (error != nil)
            {
                DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
            }
            else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
            CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
        }];
    }
    
    return 1;
}

+(double) Util_NSDateToGMDate:(NSDate*)date {
    // converts NSDate into a number for GameMaker date functions.
    return ( ( ( ( (double) [date timeIntervalSince1970] ) + 0.5 ) / 86400.0 ) + 25569.0 );
}

-(double) GameCenter_Leaderboard_LoadGeneric: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd playerScope:(double) playerScope {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        double myId = self.LastAsyncOpId++;
        [GKLeaderboard loadLeaderboardsWithIDs:@[ leaderboardID ] completionHandler:^(NSArray<GKLeaderboard*>* _Nullable leaderboards, NSError* _Nullable error) {
            // did not even load basic data about the leaderboard :(
            if (error != nil || leaderboards == nil || [leaderboards count] < 1) {
                int dsMapIndex = CreateDsMap_comaptibility();
                DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                DsMapAddDouble_comaptibility(dsMapIndex, "id", myId);
                DsMapAddDouble_comaptibility(dsMapIndex, "time_scope", timeScope);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_start", rangeStart);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_end", rangeEnd);
                DsMapAddDouble_comaptibility(dsMapIndex, "player_scope", playerScope);
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_title", "");
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_group", "");
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_type", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_start_date", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_next_start_date", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_duration", -1);
                
                if (error != nil) {
                    DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                    DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                    DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
                
                DsMapAddDouble_comaptibility(dsMapIndex, "total_players_count", -1);
                
                /* dummy local player info */
                DsMapAddDouble_comaptibility(dsMapIndex, "local_context", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "local_date", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "local_rank", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "local_score", -1);
                DsMapAddString_comaptibility(dsMapIndex, "local_formatted_score", "");
                DsMapAddString_comaptibility(dsMapIndex, "local_info", "{}");
                
                DsMapAddDouble_comaptibility(dsMapIndex, "entries", 0);
                
                CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
                return;
            }
            
            GKLeaderboardPlayerScope ps = GKLeaderboardPlayerScopeGlobal;
            switch ((int)playerScope) {
                case 0: ps = GKLeaderboardPlayerScopeGlobal; break;
                case 1: ps = GKLeaderboardPlayerScopeFriendsOnly; break;
            }
            
            GKLeaderboardTimeScope ts = GKLeaderboardTimeScopeToday;
            switch ((int)timeScope) {
                case 0: ts = GKLeaderboardTimeScopeToday; break;
                case 1: ts = GKLeaderboardTimeScopeWeek; break;
                case 2: ts = GKLeaderboardTimeScopeAllTime; break;
            }
            
            NSRange r = NSMakeRange((NSUInteger)rangeStart, (NSUInteger)rangeEnd);
            
            GKLeaderboard* lb = [leaderboards objectAtIndex:0];
            [lb loadEntriesForPlayerScope:ps timeScope:ts range:r completionHandler:^(GKLeaderboardEntry* _Nullable_result localPlayerEntry, NSArray<GKLeaderboardEntry*>* _Nullable entries, NSInteger totalPlayerCount, NSError* _Nullable error) {
                int dsMapIndex = CreateDsMap_comaptibility();
                DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                DsMapAddDouble_comaptibility(dsMapIndex, "id", myId);
                DsMapAddDouble_comaptibility(dsMapIndex, "time_scope", timeScope);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_start", rangeStart);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_end", rangeEnd);
                DsMapAddDouble_comaptibility(dsMapIndex, "player_scope", playerScope);
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_title", (char*)[[lb title] UTF8String]);
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_group", (char*)[[lb groupIdentifier] UTF8String]);
                double lbtype = -1;
                switch ([lb type]) {
                    case GKLeaderboardTypeClassic: lbtype = 0; break;
                    case GKLeaderboardTypeRecurring: lbtype = 1; break;
                }
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_type", lbtype);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_start_date", [GameCenter Util_NSDateToGMDate:[lb startDate]]);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_next_start_date", [GameCenter Util_NSDateToGMDate:[lb nextStartDate]]);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_duration", [lb duration]);
                
                if (error != nil) {
                    DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                    DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                    DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
                
                DsMapAddDouble_comaptibility(dsMapIndex, "total_players_count", totalPlayerCount);
                
                if (localPlayerEntry != nil) {
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_context", [localPlayerEntry context]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_date", [GameCenter Util_NSDateToGMDate:[localPlayerEntry date]]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_rank", [localPlayerEntry rank]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_score", [localPlayerEntry score]);
                    DsMapAddString_comaptibility(dsMapIndex, "local_formatted_score", (char*)[[localPlayerEntry formattedScore] UTF8String]);
                    DsMapAddString_comaptibility(dsMapIndex, "local_info", (char*)[[GameCenter GKPlayerJSON:[localPlayerEntry player]] UTF8String]);
                }
                else {
                    /* dummy local player info */
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_context", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_date", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_rank", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_score", -1);
                    DsMapAddString_comaptibility(dsMapIndex, "local_formatted_score", "");
                    DsMapAddString_comaptibility(dsMapIndex, "local_info", "{}");
                }
                
                if (entries == nil || [entries count] < 1) {
                    /* don't even bother with entries... */
                    DsMapAddDouble_comaptibility(dsMapIndex, "entries", 0);
                }
                else {
                    DsMapAddDouble_comaptibility(dsMapIndex, "entries", [entries count]);
                    for (NSUInteger i = 0; i < [entries count]; ++i) {
                        GKLeaderboardEntry* e = [entries objectAtIndex:i];
                        
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_context_%lu", i] UTF8String], e?[e context]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_date_%lu", i] UTF8String], e?[GameCenter Util_NSDateToGMDate:[e date]]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_rank_%lu", i] UTF8String], e?[e rank]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_score_%lu", i] UTF8String], e?[e score]:-1);
                        DsMapAddString_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_formatted_score_%lu", i] UTF8String], e?(char*)[[e formattedScore] UTF8String]:"");
                        DsMapAddString_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_info_%lu", i] UTF8String], e?(char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]:"{}");
                    }
                    
                }
                
                CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
                /* we're done here */
            }];
        }];
        
        return myId;
    }
    else {
        GKLeaderboard *req = [[GKLeaderboard alloc] init];
        if (req != nil) {
            double myId = self.LastAsyncOpId++;
            
            req.identifier = leaderboardID;
            
            GKLeaderboardPlayerScope ps = GKLeaderboardPlayerScopeGlobal;
            switch ((int)playerScope) {
                case 0: ps = GKLeaderboardPlayerScopeGlobal; break;
                case 1: ps = GKLeaderboardPlayerScopeFriendsOnly; break;
            }
            req.playerScope = ps;
            
            GKLeaderboardTimeScope ts = GKLeaderboardTimeScopeToday;
            switch ((int)timeScope) {
                case 0: ts = GKLeaderboardTimeScopeToday; break;
                case 1: ts = GKLeaderboardTimeScopeWeek; break;
                case 2: ts = GKLeaderboardTimeScopeAllTime; break;
            }
            req.timeScope = ts;
            
            NSRange r = NSMakeRange((NSUInteger)rangeStart, (NSUInteger)rangeEnd);
            req.range = r;
            
            [req loadScoresWithCompletionHandler:^(NSArray<GKScore*>* _Nullable scores, NSError* _Nullable error) {
                int dsMapIndex = CreateDsMap_comaptibility();
                DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Leaderboard_Load");
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_id", (char*)[leaderboardID UTF8String]);
                DsMapAddDouble_comaptibility(dsMapIndex, "id", myId);
                DsMapAddDouble_comaptibility(dsMapIndex, "time_scope", timeScope);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_start", rangeStart);
                DsMapAddDouble_comaptibility(dsMapIndex, "range_end", rangeEnd);
                DsMapAddDouble_comaptibility(dsMapIndex, "player_scope", playerScope);
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_title", (char*)[[req title] UTF8String]);
                DsMapAddString_comaptibility(dsMapIndex, "leaderboard_group", (char*)[[req groupIdentifier] UTF8String]);
                /* sadly not present in old API */
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_type", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_start_date", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_next_start_date", -1);
                DsMapAddDouble_comaptibility(dsMapIndex, "leaderboard_duration", -1);
                
                if (error != nil) {
                    DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
                    DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
                    DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
                }
                else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
                
                DsMapAddDouble_comaptibility(dsMapIndex, "total_players_count", [req maxRange]);
                
                if ([req localPlayerScore] == nil) {
                    /* dummy local player info */
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_context", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_date", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_rank", -1);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_score", -1);
                    DsMapAddString_comaptibility(dsMapIndex, "local_formatted_score", "");
                    DsMapAddString_comaptibility(dsMapIndex, "local_info", "{}");
                }
                else {
                    GKScore* e = [req localPlayerScore];
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_context", [e context]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_date", [GameCenter Util_NSDateToGMDate:[e date]]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_rank", [e rank]);
                    DsMapAddDouble_comaptibility(dsMapIndex, "local_score", [e value]);
                    DsMapAddString_comaptibility(dsMapIndex, "local_formatted_score", (char*)[[e formattedValue] UTF8String]);
                    DsMapAddString_comaptibility(dsMapIndex, "local_info", (char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]);
                }
                
                if (scores == nil || [scores count] < 1) {
                    DsMapAddDouble_comaptibility(dsMapIndex, "entries", 0);
                }
                else {
                    DsMapAddDouble_comaptibility(dsMapIndex, "entries", [scores count]);
                    for (NSUInteger i = 0; i < [scores count]; ++i) {
                        GKScore* e = [scores objectAtIndex:i];
                        
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_context_%lu", i] UTF8String], e?[e context]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_date_%lu", i] UTF8String], e?[GameCenter Util_NSDateToGMDate:[e date]]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_rank_%lu", i] UTF8String], e?[e rank]:-1);
                        DsMapAddDouble_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_score_%lu", i] UTF8String], e?[e value]:-1);
                        DsMapAddString_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_formatted_score_%lu", i] UTF8String], e?(char*)[[e formattedValue] UTF8String]:"");
                        DsMapAddString_comaptibility(dsMapIndex, (char*)[[NSString stringWithFormat:@"entry_info_%lu", i] UTF8String], e?(char*)[[GameCenter GKPlayerJSON:[e player]] UTF8String]:"{}");
                    }
                }
                
                CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
            }];
            
            return myId;
        }
        
        return -1;
    }
}

-(double) GameCenter_Leaderboard_LoadGlobal: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd {
    return [self GameCenter_Leaderboard_LoadGeneric:leaderboardID timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd playerScope:0];
}
-(double) GameCenter_Leaderboard_LoadFriendsOnly: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd {
    return [self GameCenter_Leaderboard_LoadGeneric:leaderboardID timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd playerScope:1];
}

//GKAchievement
//https://developer.apple.com/documentation/gamekit/gkachievement?language=objc
-(double) GameCenter_Achievement_Report: (NSString*) identifier percentComplete: (double) percent showCompletionBanner:(double) showCompletionBanner
{
    GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: identifier];
    achievement.showsCompletionBanner = showCompletionBanner > 0.5;
    
    achievement.percentComplete = (float) percent;
    [GKAchievement reportAchievements:@[achievement] withCompletionHandler:^(NSError *error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Achievement_Report");
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 1;
}

-(double) GameCenter_Achievement_ResetAll
{
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Achievement_ResetAll");
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", (char*)[[error localizedDescription] UTF8String]);
        }
        else DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
        
    }];
    
    return 1;
}

//GKAchievement
//https://developer.apple.com/documentation/gamekit/gkachievement?language=objc

+(NSString *)GKAchievementArrayJSON:(NSArray *)array
{
    NSMutableArray *achievementsArray = [NSMutableArray array];
    for (GKAchievement *mGKAchievement in array) {
        NSDictionary *achievementDict = @{@"identifier": mGKAchievement.identifier,
                                          @"percentComplete": @(mGKAchievement.percentComplete),
                                          @"isCompleted": @(mGKAchievement.isCompleted),
                                          @"showsCompletionBanner": @(mGKAchievement.showsCompletionBanner),
                                          @"player": [GameCenter GKPlayerJSON:[mGKAchievement player]],
                                          @"lastReportedDate": @([GameCenter Util_NSDateToGMDate:[mGKAchievement lastReportedDate]])
        };
        [achievementsArray addObject:achievementDict];
    };
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:achievementsArray options:0 error:&error];
    if (!jsonData) {
        return @"[]";
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

-(double) GameCenter_Achievement_Load
{
    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray<GKAchievement *> * _Nullable achievements, NSError * _Nullable error)
    {
        int dsMapIndex = CreateDsMap_comaptibility();
        DsMapAddString_comaptibility(dsMapIndex, "type", "GameCenter_Achievement_Load");
        if (error != nil)
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 0);
            DsMapAddDouble_comaptibility(dsMapIndex, "error_code", [error code]);
            DsMapAddString_comaptibility(dsMapIndex, "error_message", [[error localizedDescription] UTF8String]);
        }
        else
        {
            DsMapAddDouble_comaptibility(dsMapIndex, "success", 1);
            DsMapAddString_comaptibility(dsMapIndex, "data", [[GameCenter GKAchievementArrayJSON: achievements] UTF8String]);
		}
        CreateAsyncEventWithDSMap_comaptibility(dsMapIndex);
    }];
    
    return 0;
}

////////////////// GKPlayer
//https://developer.apple.com/documentation/gamekit/gkplayer?language=objc
+(NSString*) GKPlayerJSON: (GKPlayer*) mGKPlayer
{
    NSDictionary *mNSDictionary = nil;
    
    if (@available(iOS 12.4, macOS 10.14.6, *)) {
        mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                         [mGKPlayer alias], @"alias",
                         [mGKPlayer displayName], @"displayName",
                         @"", @"playerID",
                         [mGKPlayer gamePlayerID], @"gamePlayerID",
                         [mGKPlayer teamPlayerID], @"teamPlayerID",
                         nil];
    }
    else {
        mNSDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                         [mGKPlayer alias], @"alias",
                         [mGKPlayer displayName], @"displayName",
                         [mGKPlayer playerID], @"playerID",
                         @"", @"gamePlayerID",
                         @"", @"teamPlayerID",
                         nil];
    }
    
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

-(double) RegisterCallbacks: (NSString*) a1 a2: (NSString*) a2 a3: (NSString*) a3 a4: (NSString*) a4 {
    // does nothing on iOS, the actual implementation is macOS specific.
    NSLog(@"YYGameCenter: %@", @"RegisterCallbacks should never be called on iOS. nik was here.");
    return 1;
}

-(double) GameCenter_AccessPoint_SetActive:(double)dactive {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKAccessPoint shared].active = dactive > 0.5;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetActive No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetActive {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].active == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetActive No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_SetLocation:(double)dlocation {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKAccessPointLocation location = GKAccessPointLocationTopLeading;
        
        switch ((int)dlocation) {
            case 0: location = GKAccessPointLocationTopLeading; break;
            case 1: location = GKAccessPointLocationTopTrailing; break;
            case 2: location = GKAccessPointLocationBottomLeading; break;
            case 3: location = GKAccessPointLocationBottomTrailing; break;
        }
        
        [GKAccessPoint shared].location = location;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetLocation No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetLocation {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKAccessPointLocation location = [GKAccessPoint shared].location;
        
        switch (location) {
            case GKAccessPointLocationTopLeading: return 0;
            case GKAccessPointLocationTopTrailing: return 1;
            case GKAccessPointLocationBottomLeading: return 2;
            case GKAccessPointLocationBottomTrailing: return 3;
        }
        
        /* technically should never happen */
        return -1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetLocation No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_IsPresentingGameCenter {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].isPresentingGameCenter == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_IsPresentingGameCenter No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_IsVisible {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].visible == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_IsVisible No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_SetShowHighlights:(double)dshow {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [GKAccessPoint shared].showHighlights = dshow > 0.5;
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_SetShowHighlights No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetShowHighlights {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        return [GKAccessPoint shared].showHighlights == YES;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetShowHighlights No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_GetCoordinate:(double)dcoordid {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        switch ((int)dcoordid) {
            case 0: return [GKAccessPoint shared].frameInScreenCoordinates.origin.x;
            case 1: return [GKAccessPoint shared].frameInScreenCoordinates.origin.y;
            case 2: return [GKAccessPoint shared].frameInScreenCoordinates.size.width;
            case 3: return [GKAccessPoint shared].frameInScreenCoordinates.size.height;
        }
        
        return 0;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_GetCoordinate No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_PresentWithState:(double)dstate {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        GKGameCenterViewControllerState state = GKGameCenterViewControllerStateDefault;
        
        switch ((int)dstate) {
            case -1: state = GKGameCenterViewControllerStateDefault; break;
            case 0: state = GKGameCenterViewControllerStateLeaderboards; break;
            case 1: state = GKGameCenterViewControllerStateAchievements; break;
            case 2: state = GKGameCenterViewControllerStateChallenges; break;
            case 3: state = GKGameCenterViewControllerStateLocalPlayerProfile; break;
            case 4: state = GKGameCenterViewControllerStateDashboard; break;
            case 5: state = GKGameCenterViewControllerStateLocalPlayerFriendsList; break;
        }
        
        [[GKAccessPoint shared] triggerAccessPointWithState:state handler:^(void) {
            
        }];
        
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_PresentWithState No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

-(double) GameCenter_AccessPoint_Present {
    if (@available(iOS 14.0, macOS 11.0, *)) {
        [[GKAccessPoint shared] triggerAccessPointWithHandler:^(void) {
            
        }];
        
        return 1;
    }
    else {
        NSLog(@"YYGameCenter: %@", @"GameCenter_AccessPoint_Present No Available Until iOS 14.0 or macOS 11.0");
        return 0;
    }
}

@end

#if TARGET_OS_OSX

YYEXPORT void /*double*/ GameCenter_MacOS_SetWindowHandle(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(void* ptrwindow)
{
    void* ptrwindow = YYGetPtr(arg, 0);
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_MacOS_SetWindowHandle: (__bridge NSWindow*)(ptrwindow)];
}

YYEXPORT void /*double*/ GameCenter_PresentView_Default(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_PresentView_Default];
}

YYEXPORT void /*double*/ GameCenter_PresentView_Achievements(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_PresentView_Achievements];
}

YYEXPORT void /*double*/ GameCenter_PresentView_Achievement(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* achid)
{
    const char* achid = YYGetString(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_PresentView_Achievement:@(achid)];
}

YYEXPORT void /*double*/ GameCenter_PresentView_Leaderboards(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_PresentView_Leaderboards];
}

YYEXPORT void /*double*/ GameCenter_PresentView_Leaderboard(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* leaderboardId, double leaderboardTimeScope, double playerScope)
{
    const char* leaderboardId = YYGetString(arg, 0);
    double leaderboardTimeScope = YYGetReal(arg, 1);
    double playerScope = YYGetReal(arg, 2);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_PresentView_Leaderboard:@(leaderboardId) leaderboardTimeScope:leaderboardTimeScope playerScope:playerScope];
}

YYEXPORT void /*double*/ GameCenter_LocalPlayer_Authenticate(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
	g_GameCenterSingleton = [GameCenter new];
	
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_LocalPlayer_Authenticate];
}

YYEXPORT void /*double*/ GameCenter_LocalPlayer_IsAuthenticated(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_LocalPlayer_IsAuthenticated];
}

YYEXPORT void /*double*/ GameCenter_LocalPlayer_IsUnderage(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_LocalPlayer_IsUnderage];
}

YYEXPORT void /*double*/ GameCenter_LocalPlayer_IsMultiplayerGamingRestricted(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_LocalPlayer_IsMultiplayerGamingRestricted];
}

YYEXPORT void /*double*/ GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted];
}

YYEXPORT void /*const char**/ GameCenter_LocalPlayer_GetInfo(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    YYCreateString(&Result,  [[g_GameCenterSingleton GameCenter_LocalPlayer_GetInfo] UTF8String]);
}

YYEXPORT void /*double*/ GameCenter_SavedGames_Fetch(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_SavedGames_Fetch];
}

YYEXPORT void /*double*/ GameCenter_SavedGames_Save(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* name, const char* data)
{
    const char* name = YYGetString(arg, 0);
    const char* data = YYGetString(arg, 1);
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_SavedGames_Save:@(name) data:@(data)];
}

YYEXPORT void /*double*/ GameCenter_SavedGames_Delete(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* name)
{
    const char* name = YYGetString(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_SavedGames_Delete:@(name)];
}

YYEXPORT void /*double*/ GameCenter_SavedGames_GetData(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* name)
{
    const char* name = YYGetString(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_SavedGames_GetData:@(name)];
}

YYEXPORT void /*double*/ GameCenter_SavedGames_ResolveConflict(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double conflict_ind, const char* data)
{
    double conflict_ind = YYGetReal(arg, 0);
    const char* data = YYGetString(arg, 1);
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_SavedGames_ResolveConflict:conflict_ind data:@(data)];
}

YYEXPORT void /*double*/ GameCenter_Leaderboard_Submit(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* leaderboardID, double score, double dcontext)
{
    const char* leaderboardID = YYGetString(arg, 0);
    double score = YYGetReal(arg, 1);
    double dcontext = YYGetReal(arg, 2);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Leaderboard_Submit:@(leaderboardID) score:score dcontext:dcontext];
}

YYEXPORT void /*double*/ GameCenter_Leaderboard_LoadGlobal(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* leaderboardID, double timeScope, double rangeStart, double rangeEnd)
{
    const char* leaderboardID = YYGetString(arg, 0);
    double timeScope = YYGetReal(arg, 1);
    double rangeStart = YYGetReal(arg, 2);
    double rangeEnd = YYGetReal(arg, 3);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Leaderboard_LoadGlobal: @(leaderboardID) timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd];
}

YYEXPORT void /*double*/ GameCenter_Leaderboard_LoadFriendsOnly(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* leaderboardID, double timeScope, double rangeStart, double rangeEnd)
{
    const char* leaderboardID = YYGetString(arg, 0);
    double timeScope = YYGetReal(arg, 1);
    double rangeStart = YYGetReal(arg, 2);
    double rangeEnd = YYGetReal(arg, 3);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Leaderboard_LoadFriendsOnly: @(leaderboardID) timeScope:timeScope rangeStart:rangeStart rangeEnd:rangeEnd];
}

YYEXPORT void /*double*/ GameCenter_Achievement_Load(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Achievement_Load];
}

YYEXPORT void /*double*/ GameCenter_Achievement_Report(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(const char* identifier, double percent, double showBanner)
{
    const char* identifier = YYGetString(arg, 0);
    double percent = YYGetReal(arg, 1);
    double showBanner = YYGetReal(arg, 2);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Achievement_Report:@(identifier) percentComplete:percent showCompletionBanner:showBanner];
}

YYEXPORT void /*double*/ GameCenter_Achievement_ResetAll(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_Achievement_ResetAll];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_SetActive(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double dactive)
{
    double dactive = YYGetReal(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_SetActive:dactive];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_GetActive(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_GetActive];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_SetLocation(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double dlocation)
{
    double dlocation = YYGetReal(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_SetLocation:dlocation];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_GetLocation(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_GetLocation];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_IsPresentingGameCenter(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_IsPresentingGameCenter];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_IsVisible(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_IsVisible];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_SetShowHighlights(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double dshow)
{
    double dshow = YYGetReal(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_SetShowHighlights:dshow];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_GetShowHighlights(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_GetShowHighlights];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_GetCoordinate(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double dcoordid)
{
    double dcoordid = YYGetReal(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_GetCoordinate:dcoordid];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_PresentWithState(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:(double dstate)
{
    double dstate = YYGetReal(arg, 0);
    
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_PresentWithState:dstate];
}

YYEXPORT void /*double*/ GameCenter_AccessPoint_Present(RValue& Result, CInstance* selfinst, CInstance* otherinst, int argc, RValue* arg)//:()
{
    Result.kind = VALUE_REAL;
    Result.val =  [g_GameCenterSingleton GameCenter_AccessPoint_Present];
}

#endif



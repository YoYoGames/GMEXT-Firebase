#import <GameKit/GameKit.h>

@interface GameCenter:NSObject <GKGameCenterControllerDelegate,GKLocalPlayerListener>
{
}

@property (nonatomic, strong) NSMutableArray *ArrayOfConflicts;

-(double) GameCenter_PresentView_Default;
-(double) GameCenter_PresentView_Achievements;
-(double) GameCenter_PresentView_Achievement:(NSString*) ach_id;
-(double) GameCenter_PresentView_Leaderboards;
-(double) GameCenter_PresentView_Leaderboard:(NSString*) leaderboardId leaderboardTimeScope: (double) leaderboardTimeScope playerScope:(double) playerScope;
-(void) GameCenter_LocalPlayer_Authenticate;
-(double) GameCenter_LocalPlayer_IsAuthenticated;
-(double) GameCenter_LocalPlayer_IsUnderage;
-(NSString*) GameCenter_LocalPlayer_GetInfo;

-(void) GameCenter_SavedGames_Fetch;
-(void) GameCenter_SavedGames_Save: (NSString*) name data: (NSString*) mNSData;
-(void) GameCenter_SavedGames_Delete: (NSString*) name;
-(void) GameCenter_SavedGames_GetData: (NSString*) name;
-(void) GameCenter_SavedGames_ResolveConflict:(double) conflict_ind data:(NSString*) data;

-(void) GameCenter_Leaderboard_Submit: (NSString*) leaderboardID score: (double) score;
-(void) GameCenter_Achievement_Report: (NSString*) identifier percentComplete: (double) percent;
-(void) GameCenter_Achievement_ResetAll;

@end

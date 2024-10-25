#import <GameKit/GameKit.h>

@interface GameCenter:NSObject <GKGameCenterControllerDelegate,GKLocalPlayerListener>
{
}

@property (nonatomic, strong) NSMutableArray *ArrayOfConflicts;
@property (nonatomic) double LastAsyncOpId;

@end

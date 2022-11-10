
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.os.Bundle;
import android.content.Context;
import android.app.Activity;
import android.util.Log;
import android.content.Intent;
import android.widget.AbsoluteLayout;
import android.view.ViewGroup;
import android.view.View;
import androidx.annotation.NonNull;//import android.support.annotation.NonNull;
import android.net.Uri;
import android.graphics.Bitmap;
import android.widget.ImageView;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.content.ContextWrapper;
import android.os.Build;
import android.widget.Toast;
import android.os.Environment;

import java.lang.Exception;
import java.lang.Boolean;
import java.lang.Void;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;


import org.json.JSONObject;
import org.json.JSONArray;

import java.util.ArrayList;
	
import com.google.android.gms.games.PlayGamesSdk;
import com.google.android.gms.games.PlayGames;
import com.google.android.gms.games.AuthenticationResult;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import com.google.android.gms.games.Game;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.AnnotatedData;
import com.google.android.gms.games.GamesClient;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.PlayersClient;

import com.google.android.gms.games.stats.PlayerStats;

import com.google.android.gms.games.achievement.Achievement;
import com.google.android.gms.games.achievement.AchievementBuffer;

import com.google.android.gms.games.LeaderboardsClient;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;
import com.google.android.gms.games.leaderboard.LeaderboardVariant;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;

import com.google.android.gms.games.SnapshotsClient;
import com.google.android.gms.games.SnapshotsClient.DataOrConflict;
import com.google.android.gms.games.SnapshotsClient.SnapshotConflict;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import com.google.android.gms.games.snapshot.Snapshot;
import com.google.android.gms.games.snapshot.SnapshotContents;
import com.google.android.gms.games.snapshot.SnapshotMetadataChange;
import com.google.android.gms.games.snapshot.SnapshotEntity;
import com.google.android.gms.games.snapshot.SnapshotMetadataBuffer;
import com.google.android.gms.games.snapshot.SnapshotMetadataChange;
import com.google.android.gms.games.snapshot.SnapshotMetadataEntity;

import com.google.android.gms.common.images.ImageManager;
import com.google.android.gms.common.images.ImageManager.OnImageLoadedListener;

import com.google.android.gms.common.api.Scope;

import com.google.android.gms.drive.Drive;

import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.ConnectionResult;

public class YYGooglePlayServices extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	
	private HashMap<String, Snapshot> mapSnapshot;
	
	private static Activity activity = RunnerActivity.CurrentActivity;
	
	int Ind;
	
	public YYGooglePlayServices()
	{
		PlayGamesSdk.initialize(activity);
		
		Ind = 1;
		mapSnapshot = new HashMap<String, Snapshot>();
	}
	
	public double GooglePlayServices_IsAvailable()
	{
		return (double) GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(activity) == ConnectionResult.SUCCESS ? 1.0 : 0.0;
	}
	
	public void GooglePlayServices_SignIn()
	{
		PlayGames.getGamesSignInClient(activity).signIn().addOnCompleteListener(new OnCompleteListener<AuthenticationResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthenticationResult> isAuthenticatedTask) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SignIn");
				if(isAuthenticatedTask.isSuccessful())
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"isAuthenticated",isAuthenticatedTask.getResult().isAuthenticated()?1.0:0.0);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				} 
				else 
				{
					Exception exception = isAuthenticatedTask.getException();
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_isAuthenticated()
	{
		PlayGames.getGamesSignInClient(activity).isAuthenticated().addOnCompleteListener(new OnCompleteListener<AuthenticationResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthenticationResult> isAuthenticatedTask) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_isAuthenticated");
				if(isAuthenticatedTask.isSuccessful())
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"isAuthenticated",isAuthenticatedTask.getResult().isAuthenticated()?1.0:0.0);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				} 
				else 
				{
					Exception exception = isAuthenticatedTask.getException();
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_RequestServerSideAccess(String serverClientId, double forceRefreshToken)
	{
		PlayGames.getGamesSignInClient(activity).requestServerSideAccess(serverClientId,forceRefreshToken>=0.5).addOnCompleteListener(new OnCompleteListener<String>() 
		{
			@Override
			public void onComplete(@NonNull Task<String> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_RequestServerSideAccess");
				if (task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"authCode",task.getResult());
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) 
	{
		
		super.onActivityResult(requestCode, resultCode, data);
		
		int dsMapIndex;

		switch(requestCode)
		{
			
			case RC_SAVED_GAMES:
			
				if(data == null) 
				{
					dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnExit");
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);					
				}
				else
				{
					if (data.hasExtra(SnapshotsClient.EXTRA_SNAPSHOT_METADATA)) 
					{
						SnapshotMetadata snapshotMetadata = data.getParcelableExtra(SnapshotsClient.EXTRA_SNAPSHOT_METADATA);
						dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnOpen");
						RunnerJNILib.DsMapAddString( dsMapIndex, "snapshotMetadata", SnapshotMetadataJSON(snapshotMetadata));
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
						GooglePlayServices_SavedGames_Open(snapshotMetadata.getUniqueName());
					} 
					else
					if (data.hasExtra(SnapshotsClient.EXTRA_SNAPSHOT_NEW)) 
					{
						dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnNew");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
					}
				}
				
			break;
			
			/*
			case RC_GETPLAYERSEARCHINTENT:
			break;
			
			case RC_ACHIEVEMENT_UI:
			break;
			
			
			case RC_LEADERBOARD_UI:
			break;
			*/
		}
	}
	
	//////////////////////////////////////////////////////////////////Player Info
	public void GooglePlayServices_Player_Current()
	{
		PlayGames.getPlayersClient(activity).getCurrentPlayer().addOnCompleteListener(new OnCompleteListener<Player>() 
		{
			@Override
			public void onComplete(@NonNull Task<Player> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Player_Current" );
				
				if (task.isSuccessful()) 
				{
					Player mPlayer = task.getResult();
					
					RunnerJNILib.DsMapAddString( dsMapIndex, "player", PlayerJSON(mPlayer) );
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	
	public void GooglePlayServices_Player_CurrentID()
	{
		PlayGames.getPlayersClient(activity).getCurrentPlayerId().addOnCompleteListener(new OnCompleteListener<String>() 
		{
			@Override
			public void onComplete(@NonNull Task<String> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type", "GooglePlayServices_Player_CurrentID");
				
				if (task.isSuccessful()) 
				{
					String PlayerID = task.getResult();
					RunnerJNILib.DsMapAddString(dsMapIndex,"playerID",PlayerID);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	
	////////////////////////////////////////////////////////////////////////////////Achievements
	
	private static final int RC_ACHIEVEMENT_UI = 9003;
	public void GooglePlayServices_Achievements_Show() 
	{
	Log.i("yoyo","GooglePlayServices_Achievements_Show HERE");
		PlayGames.getAchievementsClient(activity).getAchievementsIntent().addOnSuccessListener(new OnSuccessListener<Intent>() 
		{
			@Override
			public void onSuccess(Intent intent) 
			{
				activity.startActivityForResult(intent,RC_ACHIEVEMENT_UI);
			}
		});
		
	}

	public void GooglePlayServices_Achievements_Increment(final String arch_id,double steps) 
	{
		PlayGames.getAchievementsClient(activity).incrementImmediate(arch_id, (int)steps).addOnCompleteListener(new OnCompleteListener<Boolean>() 
		{
			@Override
			public void onComplete(@NonNull Task<Boolean> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_Increment" );
				RunnerJNILib.DsMapAddString( dsMapIndex, "achievement_id", arch_id);
				
				if (task.isSuccessful()) 
				{
					task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_Achievements_Reveal(final String arch_id) 
	{
		PlayGames.getAchievementsClient(activity).revealImmediate(arch_id).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
			@Override
			public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_Reveal" );
				RunnerJNILib.DsMapAddString( dsMapIndex, "achievement_id", arch_id);
				
				if (task.isSuccessful()) 
				{
					task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_Achievements_SetSteps(final String arch_id,double steps) 
	{
		PlayGames.getAchievementsClient(activity).setStepsImmediate(arch_id, (int)steps).addOnCompleteListener(new OnCompleteListener<Boolean>() 
		{
			@Override
			public void onComplete(@NonNull Task<Boolean> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_SetSteps" );
				RunnerJNILib.DsMapAddString( dsMapIndex, "achievement_id", arch_id);
				
				if (task.isSuccessful()) 
				{
					task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_Achievements_Unlock(final String arch_id) 
	{
		PlayGames.getAchievementsClient(activity).unlockImmediate(arch_id).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
			@Override
			public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_Unlock" );
				RunnerJNILib.DsMapAddString( dsMapIndex, "achievement_id", arch_id);
				
				if (task.isSuccessful()) 
				{
					task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	
	public void GooglePlayServices_Achievements_GetStatus(double force_reload)
	{
		PlayGames.getAchievementsClient(activity).load(force_reload >= 0.5).addOnCompleteListener(new OnCompleteListener<AnnotatedData<AchievementBuffer>>() 
		{
			@Override
			public void onComplete(@NonNull Task<AnnotatedData<AchievementBuffer>> task) 
			{
				AnnotatedData<AchievementBuffer> mAnnotated = task.getResult();
				AchievementBuffer mAchievementBuffer = mAnnotated.get();
				
				try
				{
					JSONArray list = new JSONArray();
					
					for(Achievement	achievement	: mAchievementBuffer)
					{
						//https://developers.google.com/android/reference/com/google/android/gms/games/achievement/Achievement
						JSONObject map = new JSONObject();
						
						map.put("id",achievement.getAchievementId());
						map.put("description",achievement.getDescription());
						map.put("lastUpdatedTimestamp",(double)achievement.getLastUpdatedTimestamp());
						map.put("name",achievement.getName());
						if(achievement.getRevealedImageUri() != null)
							map.put("revealedImage",achievement.getRevealedImageUri().toString());
						map.put("state",(double)achievement.getState());
						map.put("typeAchievement",(double)achievement.getType());
						if(achievement.getUnlockedImageUri() != null)
							map.put("unlockedImage",achievement.getUnlockedImageUri().toString());
						map.put("xpValue",(double)achievement.getXpValue());
						
						if(achievement.getType() == Achievement.TYPE_INCREMENTAL)
						{
							map.put("currentSteps",(double)achievement.getCurrentSteps());
							map.put("formattedCurrentSteps",achievement.getFormattedCurrentSteps());
							map.put("formattedTotalSteps",achievement.getFormattedTotalSteps());
							map.put("totalSteps",(double)achievement.getTotalSteps());
						}
						
						list.put(map);
					}
					
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_GetStatus");
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", task.isSuccessful()? 1:0);
					RunnerJNILib.DsMapAddString( dsMapIndex, "data", list.toString());
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				}
				catch(Exception e)
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_Achievements_GetStatus");
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);					
				}
			}
		});
	}

	
	///////////////////////////////////////////////////////////////////////////////Learderboards
	
	private static final int RC_LEADERBOARD_UI = 9004;
	
	public void GooglePlayServices_Leaderboard_ShowAll()
	{
		PlayGames.getLeaderboardsClient(activity).getAllLeaderboardsIntent().addOnSuccessListener(new OnSuccessListener<Intent>() 
		{
			@Override
			public void onSuccess(Intent intent) 
			{
				activity.startActivityForResult(intent, RC_LEADERBOARD_UI);
			}
		});
	}	
	
	public void GooglePlayServices_Leaderboard_Show(String leader_id) 
	{
		PlayGames.getLeaderboardsClient(activity).getLeaderboardIntent(leader_id).addOnSuccessListener(new OnSuccessListener<Intent>() 
		{
			@Override
			public void onSuccess(Intent intent) 
			{
				activity.startActivityForResult(intent, RC_LEADERBOARD_UI);
			}
		});
	}
	
	static String PlayerJSON(Player mPlayer)
	{
		
		//https://developers.google.com/android/reference/com/google/android/gms/games/Player
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(mPlayer.getBannerImageLandscapeUri() != null)
			map.put("bannerImageLandscapeUri",mPlayer.getBannerImageLandscapeUri().toString());
		if(mPlayer.getBannerImagePortraitUri() != null)
			map.put("bannerImagePortraitUri",mPlayer.getBannerImagePortraitUri().toString());
		if(mPlayer.getDisplayName() != null)
			map.put("displayName",mPlayer.getDisplayName());
		if(mPlayer.getHiResImageUri() != null)
			map.put("hiResImageUri",mPlayer.getHiResImageUri().toString());
		if(mPlayer.getIconImageUri() != null)
			map.put("iconImageUri",mPlayer.getIconImageUri().toString());
		//if(mPlayer.getLevelInfo().getCurrentXpTotal() != null)
			map.put("currentXpTotal",(double)mPlayer.getLevelInfo().getCurrentXpTotal());
		//if(mPlayer.getLevelInfo().getLastLevelUpTimestamp() != null)
			map.put("lastLevelUpTimestamp",(double)mPlayer.getLevelInfo().getLastLevelUpTimestamp());
		//if(mPlayer.getLevelInfo().getCurrentLevel().getLevelNumber() != null)
			map.put("currentLevelNumber",(double)mPlayer.getLevelInfo().getCurrentLevel().getLevelNumber());
		//if(mPlayer.getLevelInfo().getCurrentLevel().getMaxXp() != null)
			map.put("currentMaxXp",(double)mPlayer.getLevelInfo().getCurrentLevel().getMaxXp());
		//if(mPlayer.getLevelInfo().getCurrentLevel().getMinXp() != null)
			map.put("currentMinXp",(double)mPlayer.getLevelInfo().getCurrentLevel().getMinXp());
		//if(mPlayer.getLevelInfo().getNextLevel().getLevelNumber() != null)
			map.put("nextLevelNumber",(double)mPlayer.getLevelInfo().getNextLevel().getLevelNumber());
		//if(mPlayer.getLevelInfo().getNextLevel().getMaxXp() != null)
			map.put("nextMaxXp",(double)mPlayer.getLevelInfo().getNextLevel().getMaxXp());
		//if(mPlayer.getLevelInfo().getNextLevel().getMinXp() != null)
			map.put("nextMinXp",(double)mPlayer.getLevelInfo().getNextLevel().getMinXp());
		if(mPlayer.getPlayerId() != null)
			map.put("playerId",mPlayer.getPlayerId());
		//if(mPlayer.getRetrievedTimestamp() != null)
			map.put("retrievedTimestamp",(double)mPlayer.getRetrievedTimestamp());
		if(mPlayer.getTitle() != null)
			map.put("title",mPlayer.getTitle());
		
		if(mPlayer.hasHiResImage())
			map.put("hasHiResImage",(double)1.0);
		else
			map.put("hasHiResImage",(double)0.0);
		
		if(mPlayer.hasIconImage())
			map.put("hasIconImage",(double)1.0);
		else
			map.put("hasIconImage",(double)0.0);
		
		JSONObject obj = new JSONObject(map);
		
		return obj.toString();

	}
	
	public void GooglePlayServices_Leaderboard_SubmitScore(final String leader_id,final double score,final String scoreTag) 
	{
		PlayGames.getLeaderboardsClient(activity).submitScoreImmediate(leader_id,(long) score, scoreTag).addOnCompleteListener(new OnCompleteListener<ScoreSubmissionData>() 
		{
			@Override
			public void onComplete(@NonNull Task<ScoreSubmissionData> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GooglePlayServices_Leaderboard_SubmitScore" );
				
				RunnerJNILib.DsMapAddString(dsMapIndex,"leaderboardId",leader_id);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"score",score);
				RunnerJNILib.DsMapAddString(dsMapIndex,"scoreTag",scoreTag);
				
				if (task.isSuccessful()) 
				{
					task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
					
					ScoreSubmissionData result = task.getResult();
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					
					ScoreSubmissionData.Result resultDaily = result.getScoreResult(LeaderboardVariant.TIME_SPAN_DAILY);
					if(resultDaily != null)
					{
						HashMap<String, Object> period_map = new HashMap<String, Object>();
						period_map.put("isNewBest",(double)(resultDaily.newBest ? 1 : 0));
						period_map.put("score",(double)resultDaily.rawScore);
						period_map.put("scoreTag",resultDaily.scoreTag);
						map.put("daily",period_map);
					}
					
					ScoreSubmissionData.Result resultWeekly = result.getScoreResult(LeaderboardVariant.TIME_SPAN_WEEKLY);
					if(resultWeekly != null)
					{
						HashMap<String, Object> period_map = new HashMap<String, Object>();
						period_map.put("isNewBest",(double)(resultDaily.newBest ? 1 : 0));
						period_map.put("score",(double)resultDaily.rawScore);
						period_map.put("scoreTag",resultDaily.scoreTag);
						map.put("weekly",period_map);
					}
					
					ScoreSubmissionData.Result resultAllTime = result.getScoreResult(LeaderboardVariant.TIME_SPAN_ALL_TIME);
					if(resultAllTime != null)
					{
						HashMap<String, Object> period_map = new HashMap<String, Object>();
						period_map.put("isNewBest",(double)(resultDaily.newBest ? 1 : 0));
						period_map.put("score",(double)resultDaily.rawScore);
						period_map.put("scoreTag",resultDaily.scoreTag);
						map.put("allTime",period_map);
					}
					
					RunnerJNILib.DsMapAddString(dsMapIndex,"report",(new JSONObject(map)).toString());
				} 
				else 
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	static JSONObject LeaderboardScoreJSON(LeaderboardScore mLeaderboardScore) throws Exception
	{
		//https://developers.google.com/android/reference/com/google/android/gms/games/leaderboard/LeaderboardScore
		JSONObject map = new JSONObject();
		if(mLeaderboardScore.getDisplayRank() != null)
			map.put("displayRank",mLeaderboardScore.getDisplayRank());
		if(mLeaderboardScore.getDisplayScore() != null)
			map.put("displayScore",mLeaderboardScore.getDisplayScore());
		//if(mLeaderboardScore.getRank() != null)
			map.put("rank",(double)mLeaderboardScore.getRank());
		//if(mLeaderboardScore.getRawScore() != null)
			map.put("rawScore",(double)mLeaderboardScore.getRawScore());
		if(PlayerJSON(mLeaderboardScore.getScoreHolder()) != null)
			map.put("scoreHolder",PlayerJSON(mLeaderboardScore.getScoreHolder()));
		if(mLeaderboardScore.getScoreHolderDisplayName() != null)
			map.put("scoreHolderDisplayName",mLeaderboardScore.getScoreHolderDisplayName());
		if(mLeaderboardScore.getScoreHolderHiResImageUri() != null)
			map.put("scoreHolderHiResImageUri",mLeaderboardScore.getScoreHolderHiResImageUri().toString());
		if(mLeaderboardScore.getScoreHolderIconImageUri() != null)
			map.put("scoreHolderIconImageUri",mLeaderboardScore.getScoreHolderIconImageUri().toString());
		if(mLeaderboardScore.getScoreTag() != null)
			map.put("scoreTag",mLeaderboardScore.getScoreTag());
		//if(mLeaderboardScore.getTimestampMillis() != null)
			map.put("timestampMillis",(double)mLeaderboardScore.getTimestampMillis());
		return map;
	}
	
	static String LeaderboardJSON(Leaderboard mLeaderboard)
	{
		//https://developers.google.com/android/reference/com/google/android/gms/games/leaderboard/Leaderboard
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(mLeaderboard.getDisplayName() != null)
			map.put("displayName", mLeaderboard.getDisplayName());
		if(mLeaderboard.getIconImageUri() != null)
			map.put("iconImageUri", mLeaderboard.getIconImageUri().toString());
		if(mLeaderboard.getLeaderboardId() != null)
			map.put("leaderboardId", mLeaderboard.getLeaderboardId());
		//if(mLeaderboard.getScoreOrder() != null)
			map.put("scoreOrder", mLeaderboard.getScoreOrder());
		//getVariants()//Not today . . . .
		JSONObject obj = new JSONObject(map);
		return obj.toString();
	}
	
	public void GooglePlayServices_Leaderboard_LoadPlayerCenteredScores(String leaderboardId, double span, double leaderboardCollection, double maxResults, double forceReload)
	{
		PlayGames.getLeaderboardsClient(activity)
		.loadPlayerCenteredScores(leaderboardId, (int) span, (int) leaderboardCollection, (int) maxResults, forceReload >= 0.5)
		.addOnCompleteListener(new OnCompleteListener<AnnotatedData<LeaderboardsClient.LeaderboardScores>>() 
		{
			@Override
			public void onComplete(@NonNull Task<AnnotatedData<LeaderboardsClient.LeaderboardScores>> task) 
			{
				try
				{
					// This can thrown an extension needs to be inside the try/catch
					LeaderboardsClient.LeaderboardScores mLeaderboardScores = task.getResult().get();

					JSONArray list = new JSONArray();
					
					LeaderboardScoreBuffer mLeaderboardScoreBuffer = mLeaderboardScores.getScores();
					for(LeaderboardScore mLeaderboardScore : mLeaderboardScoreBuffer)
					{
						JSONObject map = LeaderboardScoreJSON(mLeaderboardScore);
						list.put(map);
					}
						
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GooglePlayServices_Leaderboard_LoadPlayerCenteredScores" );
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", task.isSuccessful()? 1:0);
					if(task.isSuccessful())
					{
						RunnerJNILib.DsMapAddString( dsMapIndex, "leaderboard", LeaderboardJSON(mLeaderboardScores.getLeaderboard()));
						RunnerJNILib.DsMapAddString( dsMapIndex, "data", list.toString());
					}

					// LeaderboardsClient.LeaderboardScores is a releasable object that needs to be release after use (causes memory leaks otherwise)
					mLeaderboardScores.release();

					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				}
				catch(Exception e)
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GooglePlayServices_Leaderboard_LoadPlayerCenteredScores" );
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);					
				}
			}
		});
	}
	
	public void GooglePlayServices_Leaderboard_LoadTopScores(String leaderboardId, double span, double leaderboardCollection, double maxResults, double forceReload)
	{
		PlayGames.getLeaderboardsClient(activity)
		.loadTopScores(leaderboardId, (int) span, (int) leaderboardCollection, (int) maxResults, forceReload >= 0.5)
		.addOnCompleteListener(new OnCompleteListener<AnnotatedData<LeaderboardsClient.LeaderboardScores>>() 
		{
			@Override
			public void onComplete(@NonNull Task<AnnotatedData<LeaderboardsClient.LeaderboardScores>> task) 
			{
				try
				{
					// This can thrown an extension needs to be inside the try/catch
					LeaderboardsClient.LeaderboardScores mLeaderboardScores = task.getResult().get();

					JSONArray list = new JSONArray();
					
					LeaderboardScoreBuffer mLeaderboardScoreBuffer = mLeaderboardScores.getScores();
					for(LeaderboardScore mLeaderboardScore : mLeaderboardScoreBuffer)
					{
						JSONObject map = LeaderboardScoreJSON(mLeaderboardScore);
						list.put(map);
					}
						
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GooglePlayServices_Leaderboard_LoadTopScores" );
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", task.isSuccessful()? 1:0);
					if(task.isSuccessful())
					{
						RunnerJNILib.DsMapAddString( dsMapIndex, "leaderboard", LeaderboardJSON(mLeaderboardScores.getLeaderboard()));
						RunnerJNILib.DsMapAddString( dsMapIndex, "data", list.toString());
					}

					// LeaderboardsClient.LeaderboardScores is a releasable object that needs to be release after use (causes memory leaks otherwise)
					mLeaderboardScores.release();

					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				}
				catch(Exception e)
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GooglePlayServices_Leaderboard_LoadTopScores" );
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);					
				}
			}
		});
		
	}	
	
	public double GooglePlayServices_UriToPath(String uriString)
	{
		double ind = (double) Ind;
		Ind++;
		
		(new Obj_UriToPath()).UriToPath(uriString,ind);
		
		return(ind);
	}
	
	private class Obj_UriToPath
	{
		public void UriToPath(final String uriString,final double ind)
		{
			if (Build.VERSION.SDK_INT >= 11) 
			activity.runOnUiThread(new Runnable() 
			{
				@Override
				public void run() 
				{
					Uri uri = Uri.parse(uriString);
					try
					{
						ImageView mImageView = new ImageView(activity);
						ImageManager mgr = ImageManager.create(activity);
						mgr.loadImage(new OnImageLoadedListener()
						{
							@Override
							public void onImageLoaded (Uri uri, Drawable drawable, boolean isRequestedDrawable)
							{
								try
								{
									int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
									RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_UriToPath" );
									RunnerJNILib.DsMapAddDouble( dsMapIndex, "ind", ind );
									
									if(isRequestedDrawable)
									{
										Bitmap mBitmap = ((BitmapDrawable)drawable).getBitmap();
										 
										 ContextWrapper cw = new ContextWrapper(activity.getApplicationContext());
										File directory = cw.getDir("profile", Context.MODE_PRIVATE);
										
										if (!directory.exists()) 
											directory.mkdir();
										
										File mypath = new File(directory, "thumbnail"+String.valueOf(ind)+".png");
										
										String path = mypath.getPath();

										FileOutputStream fos = null;
										
										fos = new FileOutputStream(mypath);
										mBitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
										
										fos.close();
										
										RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",1);
										RunnerJNILib.DsMapAddString( dsMapIndex, "path", path );

									}
									else
										RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
									
									RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
								
								}
								catch(Exception e)
								{
									Log.e("yoyo", "URI2PATH failed: " +e.getMessage());
									int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
									RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_UriToPath" );
									RunnerJNILib.DsMapAddDouble( dsMapIndex, "ind", ind );
									RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
									RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
								}
							}
						},uri);
					}					
					catch(Exception e)
					{
						Log.e("yoyo", "URI2PATH failed: " + e.getMessage());
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_UriToPath" );
						RunnerJNILib.DsMapAddDouble( dsMapIndex, "ind", ind );
						RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",0);
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
					}
				}
			});
		}
	}
	
	///////////////////////////////////////////Saved Games
	
	
	private String SnapshotMetadataJSON(SnapshotMetadata mSnapshotMetadata)
	{		
		return SnapshotMetadataJSONObj(mSnapshotMetadata).toString();
	}
	
	private JSONObject SnapshotMetadataJSONObj(SnapshotMetadata mSnapshotMetadata)
	{
		//https://developers.google.com/android/reference/com/google/android/gms/games/snapshot/SnapshotMetadata	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//if(mSnapshotMetadata.getCoverImageAspectRatio() != null) 
			map.put("coverImageAspectRatio",(double)mSnapshotMetadata.getCoverImageAspectRatio());
		if(mSnapshotMetadata.getCoverImageUri() != null) 
			map.put("coverImageUri",mSnapshotMetadata.getCoverImageUri().toString());
		if(mSnapshotMetadata.getDescription() != null) 
			map.put("description",mSnapshotMetadata.getDescription());
		if(mSnapshotMetadata.getDeviceName() != null) 
			map.put("deviceName",mSnapshotMetadata.getDeviceName());
		map.put("game",gameJSON(mSnapshotMetadata.getGame()));
		//if(mSnapshotMetadata.getLastModifiedTimestamp() != null) 
			map.put("lastModifiedTimestamp",(double)mSnapshotMetadata.getLastModifiedTimestamp());
		//if( != null) 
			map.put("owner",PlayerJSON(mSnapshotMetadata.getOwner()));
		//if(mSnapshotMetadata.getPlayedTime() != null) 
			map.put("playedTime",(double)mSnapshotMetadata.getPlayedTime());
		//if(mSnapshotMetadata.getProgressValue() != null) 
			map.put("progressValue",(double)mSnapshotMetadata.getProgressValue());
		if(mSnapshotMetadata.getUniqueName() != null) 
			map.put("uniqueName",mSnapshotMetadata.getUniqueName());
		
		if(mSnapshotMetadata.hasChangePending())
			map.put("hasChangePending",(double) 1.0);
		else
			map.put("hasChangePending",(double) 0.0);
	
		JSONObject obj = new JSONObject(map);
		
		return obj;
	}
	
	private static final int RC_SAVED_GAMES = 9009;
	public void GooglePlayServices_SavedGames_ShowSavedGamesUI(String title, double button_add, double button_delete, double max) 
	{
		try
		{
			boolean button_add_;
			if(button_add > 0.5)
				button_add_ = true;
			else
				button_add_ = false;
			
			boolean button_delete_;
			if(button_delete > 0.5)
				button_delete_ = true;
			else
				button_delete_ = false;

			PlayGames.getSnapshotsClient(activity).getSelectSnapshotIntent(title, button_add_, button_delete_, (int)max).addOnSuccessListener(new OnSuccessListener<Intent>()
			{
				@Override
				public void onSuccess(Intent intent) 
				{
					activity.startActivityForResult(intent, RC_SAVED_GAMES);
				}
			});
		}
		catch(Exception e)
		{
			Log.e("yoyo", e.getMessage(), e);
		}
	}
	
	
	public void GooglePlayServices_SavedGames_CommitAndClose(String name , final String desc, final String data,final String pathConverIamge) // Snapshot snapshot,byte[] data, Bitmap coverImage
	{
		boolean data_Ok;
		byte[] data_;
		try
		{
			data_ = data.getBytes("UTF-8");
			data_Ok = true;
		}
		catch(Exception e)
		{
			data_Ok = false;
			data_ = null;
		}
		
		if (data_Ok)
		{		
			Snapshot snapshot = mapSnapshot.get(name);
			snapshot.getSnapshotContents().writeBytes(data_);
			  
			SnapshotMetadataChange.Builder metadataChange_builder = new SnapshotMetadataChange.Builder();
			
			String localImgPath = activity.getFilesDir() + "/" + pathConverIamge;
			File imgFile = new File(localImgPath);
			
			if(desc != "")
				metadataChange_builder.setDescription(desc);
			
			if(imgFile.exists())
			{
				Bitmap myBitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath());
				if(myBitmap != null)
					metadataChange_builder.setCoverImage(myBitmap);
			}
			
			SnapshotMetadataChange metadataChange = metadataChange_builder.build();

			PlayGames.getSnapshotsClient(activity).commitAndClose(snapshot, metadataChange).addOnCompleteListener(new OnCompleteListener<SnapshotMetadata>() 
			{
				@Override
				public void onComplete(@NonNull Task<SnapshotMetadata> task) 
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_CommitAndClose" );
					
					if (task.isSuccessful()) 
					{
						SnapshotMetadata snapshotMetadata = task.getResult();
						RunnerJNILib.DsMapAddString( dsMapIndex, "snapshotMetadata", SnapshotMetadataJSON(snapshotMetadata));
						RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
					} 
					else 
					{
						Exception exception = task.getException();
						RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
					}
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				}
			});
		
		}
	  
	}
	
	public void GooglePlayServices_SavedGames_CommitNew(String name, final String desc, final String data,final String pathConverIamge) // Snapshot snapshot,byte[] data, Bitmap coverImage
	{
		boolean createIfNotFound = true;
		double conflictPolicy = 1;
		
		
		PlayGames.getSnapshotsClient(activity).open(name,createIfNotFound,(int)conflictPolicy).addOnCompleteListener(new OnCompleteListener <DataOrConflict<Snapshot>>()
		{
			@Override
			public void onComplete(@NonNull Task<DataOrConflict<Snapshot>> task) 
			{
				boolean data_Ok;
				byte[] data_;
				try
				{
					data_ = data.getBytes("UTF-8");
					data_Ok = true;
				}
				catch(Exception e)
				{
					data_Ok = false;
					data_ = null;
				}
				
				if(task.isSuccessful() && !task.getResult().isConflict()  && data_Ok)
				{
					DataOrConflict mDataOrConflict = task.getResult();
					Snapshot snapshot = (Snapshot)mDataOrConflict.getData();
					mapSnapshot.put(snapshot.getMetadata().getUniqueName(),snapshot);
					snapshot.getSnapshotContents().writeBytes(data_);

					SnapshotMetadataChange.Builder metadataChange_builder = new SnapshotMetadataChange.Builder();
					metadataChange_builder.setDescription(desc);
					
					if(pathConverIamge != "")
					{
						String localImgPath = activity.getFilesDir() + "/" + pathConverIamge;
						File imgFile = new File(localImgPath);
						
						if(imgFile.exists())
						{
							Bitmap myBitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath());
							if(myBitmap != null)
								metadataChange_builder.setCoverImage(myBitmap);
						}
					}
					
					SnapshotMetadataChange metadataChange = metadataChange_builder.build();

					PlayGames.getSnapshotsClient(activity).commitAndClose(snapshot, metadataChange).addOnCompleteListener(new OnCompleteListener<SnapshotMetadata>() 
					{
						@Override
						public void onComplete(@NonNull Task<SnapshotMetadata> task) 
						{
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_CommitNew" );
							
							if (task.isSuccessful()) 
							{
								SnapshotMetadata snapshotMetadata = task.getResult();
								RunnerJNILib.DsMapAddString( dsMapIndex, "snapshotMetadata", SnapshotMetadataJSON(snapshotMetadata));
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
							} 
							else 
							{
								Exception exception = task.getException();
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
								Log.i("yoyo",exception.getMessage());
							}
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
						}
					});
				}
				else 
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_CommitNew" );
					
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
					
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);	
				}
			}
		});
	}

	public void GooglePlayServices_SavedGames_Load(final double forceReload)
	{
		boolean forceReload_ = forceReload >= 0.5;
		PlayGames.getSnapshotsClient(activity).load(forceReload_).addOnCompleteListener(new OnCompleteListener<AnnotatedData<SnapshotMetadataBuffer>>()
		{
			@Override
			public void onComplete(@NonNull Task<AnnotatedData<SnapshotMetadataBuffer>> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_Load");
				
				if(!task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
					return;
				}
				
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
				
				AnnotatedData mAnnotatedData = task.getResult();
				SnapshotMetadataBuffer mSnapshotMetadataBuffer = (SnapshotMetadataBuffer) mAnnotatedData.get();
				
				JSONArray snapshots = new JSONArray();
				for(SnapshotMetadata mSnapshotMetadata : mSnapshotMetadataBuffer)
					snapshots.put(SnapshotMetadataJSONObj(mSnapshotMetadata));
				
				RunnerJNILib.DsMapAddString(dsMapIndex,"snapshots", snapshots.toString());
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_SavedGames_Open(String fileName)
	{
		double createIfNotFound = 0;
		double conflictPolicy = 1;
		
		boolean createIfNotFound_;
		
		if(createIfNotFound >= 0.5)
			createIfNotFound_ = true;
		else
			createIfNotFound_ = false;
		
		PlayGames.getSnapshotsClient(activity).open(fileName,createIfNotFound_,(int) conflictPolicy).addOnCompleteListener(new OnCompleteListener<DataOrConflict<Snapshot>>() 
		{
			@Override
			public void onComplete(@NonNull Task<DataOrConflict<Snapshot>>task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_Open" );
				
				if(!task.isSuccessful()) 
				{
					Exception exception = task.getException();
					Log.i("yoyo","GooglePlayServices_SavedGames_Open ERROR:" + exception.getMessage());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
					return;
				}
				
				RunnerJNILib.DsMapAddDouble( dsMapIndex, "success",1);
				DataOrConflict mDataOrConflict = task.getResult();
				Snapshot mSnapshot = (Snapshot) mDataOrConflict.getData();
				mapSnapshot.put(mSnapshot.getMetadata().getUniqueName(),mSnapshot);
				
				RunnerJNILib.DsMapAddString( dsMapIndex, "snapshotMetadata", SnapshotMetadataJSON(mSnapshot.getMetadata()));
				
				try
				{
					SnapshotContents mSnapshotContents = mSnapshot.getSnapshotContents();
					byte[] mDataInBytes = mSnapshotContents.readFully();
					String dataString = new String(mDataInBytes, "UTF-8");
					RunnerJNILib.DsMapAddString( dsMapIndex, "data", dataString);
				}
				catch(Exception e)
				{}

				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void GooglePlayServices_SavedGames_Delete(String fileName)
	{
		Snapshot mSnapshot = (Snapshot) mapSnapshot.get(fileName);
		SnapshotMetadata mSnapshotMetadata = mSnapshot.getMetadata();
		
		PlayGames.getSnapshotsClient(activity).delete(mSnapshotMetadata).addOnCompleteListener(new OnCompleteListener<String>() 
		{
			@Override
			public void onComplete(@NonNull Task<String>task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_Delete" );
				
				if (task.isSuccessful()) 
				{
					 String snapshotID = task.getResult();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
					RunnerJNILib.DsMapAddString( dsMapIndex, "snapshotID.", snapshotID);
				}
				else
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );					
					Log.i("yoyo","GooglePlayServices_SavedGames_Delete FAIL: " + exception.getMessage());
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);	
			}
		});
	}
	
	
	public void GooglePlayServices_SavedGames_DiscardAndClose(String fileName)
	{
		Snapshot mSnapshot = (Snapshot) mapSnapshot.get(fileName);
		PlayGames.getSnapshotsClient(activity).discardAndClose(mSnapshot).addOnCompleteListener(new OnCompleteListener<Void>()
		{
			@Override
			public void onComplete(@NonNull Task<Void>task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_SavedGames_DiscardAndClose" );
				
				if (task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1);	
				else
				{
					Exception exception = task.getException();
					Log.i("yoyo","GooglePlayServices_SavedGames_DiscardAndClose FAIL: " + exception.getMessage());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);	
			}
		});
	}
	
	static String gameJSON(Game mGame)
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(mGame.areSnapshotsEnabled())
			map.put("areSnapshotsEnabled",(double) 1);
		else
			map.put("areSnapshotsEnabled",(double) 0);
			
		map.put("achievementTotalCount",(double)mGame.getAchievementTotalCount());
		map.put("applicationId",mGame.getApplicationId());
		map.put("description",mGame.getDescription());
		map.put("developerName",mGame.getDeveloperName());
		if(mGame.getDisplayName() != null)
			map.put("displayName",mGame.getDisplayName());
		if(mGame.getFeaturedImageUri() != null)
			map.put("featuredImageUri",mGame.getFeaturedImageUri().toString());
		if(mGame.getHiResImageUri() != null)
			map.put("hiResImageUri",mGame.getHiResImageUri().toString());
		if(mGame.getIconImageUri() != null)
			map.put("iconImageUri",mGame.getIconImageUri().toString());
		map.put("leaderboardCount",mGame.getLeaderboardCount());
		map.put("primaryCategory",mGame.getPrimaryCategory());
		map.put("secondaryCategory",mGame.getSecondaryCategory());
		map.put("themeColor",mGame.getThemeColor());
		
		if(mGame.hasGamepadSupport())
			map.put("gamepadSupport", 1);
		else
			map.put("gamepadSupport", 0);
		
		JSONObject obj = new JSONObject(map);
		
		return obj.toString();
	}
	
	////////////////////////////////Player Stats
	public void GooglePlayServices_PlayerStats_LoadPlayerStats(double forcedLoad)
	{
		PlayGames.getPlayerStatsClient(activity).loadPlayerStats(forcedLoad>=0.5).addOnCompleteListener(new OnCompleteListener<AnnotatedData<PlayerStats>>() 
		{
			@Override
			public void onComplete(@NonNull Task<AnnotatedData<PlayerStats>> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "GooglePlayServices_PlayerStats_LoadPlayerStats" );
				
				if (task.isSuccessful()) 
				{
					AnnotatedData mAnnotatedData = task.getResult();
					PlayerStats mPlayerStats = (PlayerStats) mAnnotatedData.get();
					
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1 );
					
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "AverageSessionLength", mPlayerStats.getAverageSessionLength());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "DaysSinceLastPlayed", mPlayerStats.getDaysSinceLastPlayed());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "NumberOfPurchases", mPlayerStats.getNumberOfPurchases());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "NumberOfSessions", mPlayerStats.getNumberOfSessions());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "SessionPercentile", mPlayerStats.getSessionPercentile());
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "SpendPercentile", mPlayerStats.getSpendPercentile());
				}
				else
				{
					Exception exception = task.getException();
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0 );					
				}
				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);	
			}
		});
	}
}


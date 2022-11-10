
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.auth.AuthCredential;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.UserInfo;
import com.google.firebase.auth.UserProfileChangeRequest;
import com.google.firebase.auth.EmailAuthProvider;
import com.google.firebase.auth.FacebookAuthProvider;
import com.google.firebase.auth.GoogleAuthProvider;
import com.google.firebase.auth.GetTokenResult;
import com.google.firebase.auth.PlayGamesAuthProvider;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;
import com.google.firebase.auth.EmailAuthCredential;
import com.google.firebase.auth.OAuthProvider;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import android.content.Context;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.ViewGroup;
import android.util.Log;
import android.net.Uri;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONObject;
import org.json.JSONArray;

import java.util.List;
import java.util.ArrayList;
import java.lang.Exception;

public class YYFirebaseAuthentication extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	public static Activity activity = RunnerActivity.CurrentActivity;
	
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
	private double Auth_valueListernerInd = 5000;
	
	
	private double Auth_getListenerInd()
	{
		Auth_valueListernerInd  ++;
		return(Auth_valueListernerInd );
	}
	
	public String SDKFirebaseAuthentication_GetUserData()
	{
		FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
		return SDKFirebaseAuthentication_GetUserData_From(user);
	}
	
	public String SDKFirebaseAuthentication_GetUserData_From(FirebaseUser user)
	{
		try
		{
			JSONObject UserMap = new JSONObject();
			UserMap.put("displayName",user.getDisplayName());
			UserMap.put("email",user.getEmail());
			UserMap.put("localId",user.getUid());
			UserMap.put("emailVerified",user.isEmailVerified()); 
			UserMap.put("phoneNumber",user.isEmailVerified());
			UserMap.put("photoUrl",user.getPhotoUrl());
			UserMap.put("lastLoginAt",user.getMetadata().getCreationTimestamp());
			UserMap.put("createdAt",user.getMetadata().getLastSignInTimestamp());
			
			List list = user.getProviderData();
			JSONArray providerArray = new JSONArray();
			for(Object obj : list) 
			{
				UserInfo userInfo = (UserInfo) obj;
				if(userInfo.getProviderId().equals("firebase"))
					continue;
				
				JSONObject providerObj = new JSONObject();
				providerObj.put("displayName",userInfo.getDisplayName());
				providerObj.put("email",userInfo.getEmail());
				providerObj.put("phoneNumber",userInfo.getPhoneNumber());
				providerObj.put("photoUrl",userInfo.getPhotoUrl());
				providerObj.put("providerId",userInfo.getProviderId());
				providerObj.put("rawId",userInfo.getUid());
				providerObj.put("federatedId",userInfo.getUid());
				// providerObjput("",userInfo.isEmailVerified());
				providerArray.put(providerObj);
			}
			UserMap.put("providerUserInfo",providerArray);
			
			JSONObject root = new JSONObject();
			root.put("kind","identitytoolkit#GetAccountInfoResponse");
			JSONArray array = new JSONArray();
			array.put(UserMap);
			root.put("users",array);
			
			return root.toString();
		}
		catch(Exception e)
		{
			return "{}";
		}	
	}
	
	public double SDKFirebaseAuthentication_SignInWithCustomToken(String token)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().signInWithCustomToken(token).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignInWithCustomToken");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SignIn_Email(String email,String password)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().signInWithEmailAndPassword(email,password).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{			
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignIn_Email");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SignUp_Email(String email,String password)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().createUserWithEmailAndPassword(email,password).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) 
			{			
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignUp_Email");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SignIn_Anonymously()
	{
		final double listenerInd = Auth_getListenerInd();
        FirebaseAuth.getInstance().signInAnonymously().addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{			
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignIn_Anonymously");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
				}
				else 
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SendPasswordResetEmail(String email)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth auth = FirebaseAuth.getInstance();
		auth.sendPasswordResetEmail(email).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SendPasswordResetEmail");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });	
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ChangeEmail(String email)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().updateEmail(email).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ChangeEmail");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ChangePassword(String password)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().updatePassword(password).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ChangePassword");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ChangeDisplayName(String name)
	{
		final double listenerInd = Auth_getListenerInd();
		UserProfileChangeRequest profileUpdates = new UserProfileChangeRequest.Builder().setDisplayName(name).build();
		FirebaseAuth.getInstance().getCurrentUser().updateProfile(profileUpdates).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ChangeDisplayName");     
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				
				if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });	
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ChangePhotoURL(String photoURL)
	{
		final double listenerInd = Auth_getListenerInd();
		UserProfileChangeRequest profileUpdates = new UserProfileChangeRequest.Builder().setPhotoUri(Uri.parse(photoURL)).build();
		FirebaseAuth.getInstance().getCurrentUser().updateProfile(profileUpdates).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ChangePhotoURL");     
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				
				if(task.isSuccessful())
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });	
		return listenerInd;
	}
		
	public double SDKFirebaseAuthentication_SendEmailVerification()
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().sendEmailVerification().addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SendEmailVerification");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_DeleteAccount()
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().delete().addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_DeleteAccount");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public void SDKFirebaseAuthentication_SignOut()
	{
		FirebaseAuth.getInstance().signOut();
	}
	
	public double SDKFirebaseAuthentication_LinkWithEmailPassword(String email,String password)
	{
		final double listenerInd = Auth_getListenerInd();
		AuthCredential credential = EmailAuthProvider.getCredential(email,password);
		FirebaseAuth.getInstance().getCurrentUser().linkWithCredential(credential).addOnCompleteListener(new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_LinkWithEmailPassword");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SignIn_OAuth(String token,String token_kind,String provider,String requestUri)
	{
		final double listenerInd = Auth_getListenerInd();
		AuthCredential authCredential = getAuthCredentialFromProvider(token,token_kind,provider);
		FirebaseAuth.getInstance().signInWithCredential(authCredential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignIn_OAuth");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
				}
				else 
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_LinkWithOAuthCredential(String token,String token_kind,String provider,String requestUri)
	{
		final double listenerInd = Auth_getListenerInd();
		AuthCredential authCredential = getAuthCredentialFromProvider(token,token_kind,provider);
		FirebaseAuth.getInstance().getCurrentUser().linkWithCredential(authCredential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_LinkWithOAuthCredential");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
				}
				else 
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public AuthCredential getAuthCredentialFromProvider(String token,String token_kind,String provider)
	{
		final double listenerInd = Auth_getListenerInd();
		AuthCredential authCredential = null;
		switch(provider)
		{
			case "facebook.com":
				authCredential = FacebookAuthProvider.getCredential(token);	
			break;
			
			case "google.com":
				if(token_kind.equals("id_token"))
					authCredential = GoogleAuthProvider.getCredential(token,null);
				else
				if(token_kind.equals("access_token"))
					authCredential = GoogleAuthProvider.getCredential(null,token);
			break;
			
			case "playgames.google.com":
				authCredential = PlayGamesAuthProvider.getCredential(token);
			break;
		}
		
		return authCredential;
	}
	
	public double SDKFirebaseAuthentication_UnlinkProvider(String provider)
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().unlink(provider).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{			
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_UnlinkProvider");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_RefreshUserData()
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseAuth.getInstance().getCurrentUser().reload().addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_RefreshUserData");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_GetIdToken()
	{
		final double listenerInd = Auth_getListenerInd();
		FirebaseUser mUser = FirebaseAuth.getInstance().getCurrentUser();		
		mUser.getIdToken(true).addOnCompleteListener(new OnCompleteListener<GetTokenResult>()
		{
			public void onComplete(@NonNull Task<GetTokenResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_GetIdToken");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					String idToken = task.getResult().getToken();					
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",idToken);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				} 
				else 
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"value","null");
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_SignInWithPhoneNumber(String phoneNumber,String code,String sessionInfo)
	{
		final double listenerInd = Auth_getListenerInd();
		PhoneAuthCredential credential = PhoneAuthProvider.getCredential(sessionInfo, code);
		FirebaseAuth.getInstance().signInWithCredential(credential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_SignInWithPhoneNumber");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
				}
				else 
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_LinkWithPhoneNumber(String phoneNumber,String code,String sessionInfo)
	{
		final double listenerInd = Auth_getListenerInd();
		PhoneAuthCredential credential = PhoneAuthProvider.getCredential(sessionInfo, code);
		FirebaseAuth.getInstance().getCurrentUser().linkWithCredential(credential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
			@Override
			public void onComplete(@NonNull Task<AuthResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_LinkWithPhoneNumber");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
				}
				else 
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ReauthenticateWithEmail(String email,String  password)
	{
		final double listenerInd = Auth_getListenerInd();
		
		AuthCredential credential = EmailAuthProvider.getCredential(email,password);
		FirebaseAuth.getInstance().getCurrentUser().reauthenticateAndRetrieveData(credential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ReauthenticateWithEmail");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful())
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ReauthenticateWithOAuth(String token,String token_kind,String provider,String requestUri)
	{
		final double listenerInd = Auth_getListenerInd();
		
		AuthCredential credential = getAuthCredentialFromProvider(token,token_kind,provider);
		FirebaseAuth.getInstance().getCurrentUser().reauthenticateAndRetrieveData(credential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>()
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ReauthenticateWithOAuth");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber(String phoneNumber,String code,String sessionInfo)
	{
		final double listenerInd = Auth_getListenerInd();
		
		PhoneAuthCredential credential = PhoneAuthProvider.getCredential(sessionInfo, code);
		FirebaseAuth.getInstance().getCurrentUser().reauthenticateAndRetrieveData(credential).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_ReauthenticateWithPhoneNumber");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		
		return listenerInd;
	}
	
	public List<String> jsonArrayString2List(String jsonArrayString)
	{
		try
		{
			JSONArray jsonArray = new JSONArray(jsonArrayString);
			List<String> scopes = new ArrayList<>();
			for (int i = 0; i < jsonArray.length(); i++) 
				scopes.add(jsonArray.getString(i));
			return scopes;
		}
		catch(Exception e)
		{
			List<String> empty = new ArrayList<>();
			return empty;
		}
	}
	
	public double SDKFirebaseAuthentication_SignInWithProvider(String provider,String jsonArray_scopes)
	{
		final double listenerInd = Auth_getListenerInd();
		
		OAuthProvider.Builder auth_provider = OAuthProvider.newBuilder(provider);
		auth_provider.setScopes(jsonArrayString2List(jsonArray_scopes));
		
		FirebaseAuth.getInstance().startActivityForSignInWithProvider(activity, auth_provider.build()).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","SDKFirebaseAuthentication_SignInWithProvider");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
				{
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_LinkWithProvider(String provider,String jsonArray_scopes)
	{
		final double listenerInd = Auth_getListenerInd();
		
		OAuthProvider.Builder auth_provider = OAuthProvider.newBuilder(provider);
		auth_provider.setScopes(jsonArrayString2List(jsonArray_scopes));
		
		FirebaseAuth.getInstance().startActivityForSignInWithProvider(activity, auth_provider.build()).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","SDKFirebaseAuthentication_LinkWithProvider");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	public double SDKFirebaseAuthentication_ReauthenticateWithProvider(String provider,String jsonArray_scopes)
	{
		final double listenerInd = Auth_getListenerInd();
		
		OAuthProvider.Builder auth_provider = OAuthProvider.newBuilder(provider);
		auth_provider.setScopes(jsonArrayString2List(jsonArray_scopes));
		
		FirebaseAuth.getInstance().getCurrentUser().startActivityForLinkWithProvider(activity, auth_provider.build()).addOnCompleteListener(activity,new OnCompleteListener<AuthResult>() 
		{
            @Override
            public void onComplete(@NonNull Task<AuthResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","SDKFirebaseAuthentication_ReauthenticateWithProvider");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",SDKFirebaseAuthentication_GetUserData_From(task.getResult().getUser()));
                }
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",400); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",task.getException().getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
            }
        });
		return listenerInd;
	}
	
	private FirebaseAuth.IdTokenListener mIdTokenListener = null;
	public double SDKFirebaseAuthentication_IdTokenListener()
	{
		final double listenerInd = Auth_getListenerInd();
		mIdTokenListener = new FirebaseAuth.IdTokenListener()
		{
			@Override
			public void onIdTokenChanged(@NonNull FirebaseAuth firebaseAuth) 
			{
				FirebaseUser mUser = firebaseAuth.getCurrentUser();
				if(mUser == null)
				{
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
					RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_IdTokenListener");
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value","");
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);				
					return;
				}
				
				mUser.getIdToken(false).addOnCompleteListener(new OnCompleteListener<GetTokenResult>()
				{
					public void onComplete(@NonNull Task<GetTokenResult> task) 
					{
						if (task.isSuccessful()) 
						{
							String idToken = task.getResult().getToken();
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
							RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_IdTokenListener");
							RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
							RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
							RunnerJNILib.DsMapAddString(dsMapIndex,"value",idToken);
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
						} 
						else//ignore...
						{}
					}
				});
			}
		};
		FirebaseAuth.getInstance().addIdTokenListener(mIdTokenListener);
		return listenerInd;
	}
	
	public void SDKFirebaseAuthentication_IdTokenListener_Remove()
	{
		if(mIdTokenListener != null)
		{
			FirebaseAuth.getInstance().removeIdTokenListener(mIdTokenListener);
			mIdTokenListener = null;
		}
	}
}


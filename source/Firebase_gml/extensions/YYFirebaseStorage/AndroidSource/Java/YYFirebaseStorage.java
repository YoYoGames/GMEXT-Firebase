
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;

import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.OnPausedListener;
import com.google.firebase.storage.OnProgressListener;
//import com.google.firebase.storage.StorageTask.ProvideError;
import com.google.firebase.storage.StreamDownloadTask.StreamProcessor;
import com.google.firebase.storage.CancellableTask;
import com.google.firebase.storage.ControllableTask;
import com.google.firebase.storage.FileDownloadTask;
//import com.google.firebase.storage.FileDownloadTask.TaskSnapshot;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageMetadata;
//import com.google.firebase.storage.StorageMetadata.Builder;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.StorageTask;
import com.google.firebase.storage.StorageTask.SnapshotBase;
import com.google.firebase.storage.StreamDownloadTask;
//import com.google.firebase.storage.StreamDownloadTask.TaskSnapshot;
import com.google.firebase.storage.UploadTask;
//import com.google.firebase.storage.UploadTask.TaskSnapshot;
import com.google.firebase.storage.StorageException;
import com.google.firebase.storage.ListResult;

import java.util.HashMap;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import org.json.JSONObject;
import org.json.JSONArray;

import android.util.Log;
import java.io.File;
import android.net.Uri;
import java.net.URL;
import java.lang.Exception;
import java.util.List;
import androidx.annotation.NonNull;

public class YYFirebaseStorage extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	
	public static Activity activity = RunnerActivity.CurrentActivity;	
	
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
	private double listernerInd = 7000;
	private HashMap<String,StorageTask> taskMap;
	
	public YYFirebaseStorage()
	{
		taskMap = new HashMap<String,StorageTask>();
	}
	
	
	private void Storage_addToTaskMap(StorageTask task,double ind)
	{
		taskMap.put(String.valueOf(ind),task);
	}
	
	private double Firestore_getListenerInd()
	{
		listernerInd ++;
		return(listernerInd);
	}
	
	public void SDKFirebaseStorage_Cancel(double ind)
	{
		taskMap.remove(String.valueOf(ind)).cancel();
	}
	
	public double SDKFirebaseStorage_Download(final String localPath,final String firebasePath,final String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		StorageReference islandRef = FirebaseStorage.getInstance().getReference().child(firebasePath);

		File localFile = new File(activity.getFilesDir()+"/"+localPath);
		StorageTask task = islandRef.getFile(localFile).addOnSuccessListener(new OnSuccessListener<FileDownloadTask.TaskSnapshot>() 
		{
			@Override
			public void onSuccess(FileDownloadTask.TaskSnapshot taskSnapshot) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Download");	
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				
				if(taskSnapshot.getError() != null)
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"error",taskSnapshot.getError().getMessage());
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
					return;
				}
				
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"transferred",taskSnapshot.getBytesTransferred());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"total",taskSnapshot.getTotalByteCount());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
			
		}).addOnFailureListener(new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception e) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Download");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		}).addOnProgressListener(new OnProgressListener<FileDownloadTask.TaskSnapshot>() 
		{
			@Override
			public void onProgress(FileDownloadTask.TaskSnapshot taskSnapshot) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Download");	
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				
				if(taskSnapshot.getError() != null)
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"error",taskSnapshot.getError().getMessage());
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
					return;
				}
				
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"transferred",taskSnapshot.getBytesTransferred());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"total",taskSnapshot.getTotalByteCount());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		
		Storage_addToTaskMap(task,listenerInd);
		
		return listenerInd;
	}
	
	public double SDKFirebaseStorage_Upload(final String localPath,final String firebasePath,final String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		File localFile = new File(activity.getFilesDir()+"/"+localPath);
		Uri uriFile = Uri.fromFile(localFile);
		StorageReference storageRef = FirebaseStorage.getInstance().getReference();
		UploadTask uploadTask = storageRef.child(firebasePath).putFile(uriFile);
		StorageTask task = uploadTask.addOnFailureListener(new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception exception) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Upload");	
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		}).addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() 
		{
			@Override
			public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Upload");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				
				if(taskSnapshot.getError() != null)
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"error",taskSnapshot.getError().getMessage());
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
					return;
				}
				
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"transferred",taskSnapshot.getBytesTransferred());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"total",taskSnapshot.getTotalByteCount());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		}).addOnProgressListener(new OnProgressListener<UploadTask.TaskSnapshot>() 
		{
			@Override
			public void onProgress(UploadTask.TaskSnapshot taskSnapshot) 
			{
				double progress = (100.0 * taskSnapshot.getBytesTransferred()) / taskSnapshot.getTotalByteCount();
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Upload");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddString(dsMapIndex,"localPath",localPath);
				
				if(taskSnapshot.getError() != null)
				{
					RunnerJNILib.DsMapAddString(dsMapIndex,"error",taskSnapshot.getError().getMessage());
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
					return;
				}
				
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"transferred",taskSnapshot.getBytesTransferred());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"total",taskSnapshot.getTotalByteCount());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		Storage_addToTaskMap(task,listenerInd);
		return listenerInd;
	}
	
	public double SDKFirebaseStorage_Delete(final String firebasePath,final String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		StorageReference storageRef = FirebaseStorage.getInstance().getReference();
		StorageReference desertRef = storageRef.child(firebasePath);
		desertRef.delete().addOnSuccessListener(new OnSuccessListener<Void>() 
		{
			@Override
			public void onSuccess(Void aVoid) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Delete");	
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		}).addOnFailureListener(new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception exception) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_Delete");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		
		return listenerInd;
	}
		
	public double SDKFirebaseStorage_GetURL(final String firebasePath,final String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		FirebaseStorage.getInstance().getReference().child(firebasePath).getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() 
		{
			@Override
			public void onSuccess(Uri uri) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_GetURL");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
				try
				{RunnerJNILib.DsMapAddString(dsMapIndex,"value",uri.toString());}
				catch(Exception e)
				{RunnerJNILib.DsMapAddString(dsMapIndex,"value","");}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		}).addOnFailureListener(new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception exception)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_GetURL");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	
	public double SDKFirebaseStorage_List(final String firebasePath,double maxResults,String pageToken,String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		Task<ListResult> task;
		
		if(pageToken.equals(""))
			task = FirebaseStorage.getInstance().getReference().child(firebasePath).list((int)maxResults);
		else
			task = FirebaseStorage.getInstance().getReference().child(firebasePath).list((int)maxResults,pageToken);
		
		task.addOnCompleteListener(new OnCompleteListener<ListResult>() 
		{
            @Override
            public void onComplete(Task<ListResult> task)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_List");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
					RunnerJNILib.DsMapAddString(dsMapIndex,"pageToken",task.getResult().getPageToken());
					RunnerJNILib.DsMapAddString(dsMapIndex,"files",listOfReferencesToJSON(task.getResult().getItems()));
					RunnerJNILib.DsMapAddString(dsMapIndex,"folders",listOfReferencesToJSON(task.getResult().getPrefixes()));
				}
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });	
		
		return listenerInd;
	}
	
	public double SDKFirebaseStorage_ListAll(final String firebasePath,String bucket)
	{
		final double listenerInd = Firestore_getListenerInd();
		
		FirebaseStorage.getInstance().getReference().child(firebasePath).listAll().addOnCompleteListener(new OnCompleteListener<ListResult>() 
		{
            @Override
            public void onComplete(Task<ListResult> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseStorage_ListAll");
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",firebasePath);
                if(task.isSuccessful()) 
				{
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1.0);
					// RunnerJNILib.DsMapAddString(dsMapIndex,"pageToken",task.getResult().getPageToken());
					RunnerJNILib.DsMapAddString(dsMapIndex,"files",listOfReferencesToJSON(task.getResult().getItems()));
					RunnerJNILib.DsMapAddString(dsMapIndex,"folders",listOfReferencesToJSON(task.getResult().getPrefixes()));
				}
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0.0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });	
		
		return listenerInd;
	}
	
	public static String listOfReferencesToJSON(List<StorageReference> list)
	{
		try
		{
			JSONArray array = new JSONArray();
			for (int i = 0 ; i < list.size(); i++)
				array.put(list.get(i).getPath());
			
			return (array.toString());
		}
		catch(Exception e)
		{
			return "[]";
		}
	}
	
	///////////////////// ESSENCIAL TOOLS
	public static String MapToJSON(HashMap map)
	{
		try
		{
			return (new JSONObject(map).toString());
		}
		catch(Exception e)
		{
			return "{}";
		}
	}
	
}


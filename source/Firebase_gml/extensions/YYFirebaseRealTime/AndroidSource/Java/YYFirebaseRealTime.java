
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.database.DatabaseReference.CompletionListener;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.Query;
import com.google.firebase.database.ServerValue;

import org.json.JSONObject;
import org.json.JSONException;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import java.lang.Exception;

import android.util.Log;
import android.content.Context;
import android.app.Activity;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class YYFirebaseRealTime extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	
	public static Activity activity;
	
	private HashMap<String,ValueEventListener> RealTime_valueListernerMap;
	private HashMap<String,DatabaseReference> RealTime_valueListernerRefMap;
	
	//Start point of index
	//Autentication 5000
	//storage 6000
	//Firestore 7000
	//RealTime 10000
	private double RealTime_valueListernerInd = 10000;
	
	private HashMap<String,ValueEventListener> crashMap;
	
	public YYFirebaseRealTime()
	{
		RealTime_valueListernerMap = new HashMap<String,ValueEventListener>();
		RealTime_valueListernerRefMap = new HashMap<String,DatabaseReference>();
	}
	
	public double FirebaseRealTime_SDK(String fluent_json)
	{
		JSONObject fluent_obj;
		
		try 
		{fluent_obj = new JSONObject(fluent_json);}
		catch (Exception e) 
		{return(0.0);}
		
		String action = (String) JSONObjectGet(fluent_obj,"_action");
		if(action.equals("Set"))
			return FirebaseRealTime_Set(fluent_obj);
		else if(action.equals("Read") || action.equals("Listener"))
			return  FirebaseRealTime_Read(fluent_obj);
		else if(action.equals("Exists"))
			return  FirebaseRealTime_Exists(fluent_obj);
		else if(action.equals("Delete"))
			return FirebaseRealTime_Delete(fluent_obj);
		else if(action.equals("ListenerRemove"))
			FirebaseRealTime_ListenerRemove(fluent_obj);
		else if(action.equals("ListenerRemoveAll"))
			FirebaseRealTime_ListenerRemoveAll();
		return 0.0;
	}
	
	private double FirebaseRealTime_Set(final JSONObject fluent_obj)
	{
		final double listenerInd = RealTime_getListenerInd();
		
		Object obj = JSONObjectGet(fluent_obj,"_value");
		
		if(obj instanceof String)
		{
			try 
			{obj = toMap(new JSONObject((String)obj));}
			catch (Exception e) 
			{}
		}
		
		BuildReference(fluent_obj).setValue(obj,new DatabaseReference.CompletionListener() 
		{
			@Override
			public void onComplete(DatabaseError error, DatabaseReference ref) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Set");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if (error == null) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",getErrorCodeHTTP(error)); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",error.getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);		
			}
		});
		
		return listenerInd;
	}
	
	private double FirebaseRealTime_Read(final JSONObject fluent_obj)
	{
		final double listenerInd = RealTime_getListenerInd();
		
		ValueEventListener valueEventListener = new ValueEventListener() 
		{
			@Override
			public void onDataChange(DataSnapshot dataSnapshot) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				String action = (String) JSONObjectGet(fluent_obj,"_action");
				if(action.equals("Read"))
					RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Read");
				else if(action.equals("Listener"))
					RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Listener");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);

				if(dataSnapshot.exists())
				{					
					if((dataSnapshot.getValue() instanceof Boolean) || (dataSnapshot.getValue() instanceof Double) || (dataSnapshot.getValue() instanceof Long))
						RunnerJNILib.DsMapAddDouble(dsMapIndex,"value",(double) dataSnapshot.getValue(Double.class));
					
					if(dataSnapshot.getValue() instanceof String)
						RunnerJNILib.DsMapAddString(dsMapIndex,"value",(String) dataSnapshot.getValue(String.class));
					
					if(dataSnapshot.getValue() instanceof Map)
						RunnerJNILib.DsMapAddString(dsMapIndex,"value",MapToJSON((Map<String, Object>)dataSnapshot.getValue()));
						
					
					if(dataSnapshot.getValue() instanceof List)//MAPTOJSON() Correctly??
						RunnerJNILib.DsMapAddString(dsMapIndex,"value",MapToJSON((Map<String, Object>)dataSnapshot.getValue()));
				}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
			
			@Override
			public void onCancelled(DatabaseError error) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Read");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",getErrorCodeHTTP(error)); 
				RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",error.getMessage());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		};
		
		if(((String) JSONObjectGet(fluent_obj,"_action")).equals("Read"))
			BuildQuery(fluent_obj,BuildReference(fluent_obj)).addListenerForSingleValueEvent(valueEventListener);
		else
		if(((String) JSONObjectGet(fluent_obj,"_action")).equals("Listener"))
		{
			DatabaseReference dataRef = BuildReference(fluent_obj);
			RealTime_listenerToMaps(dataRef,valueEventListener,listenerInd);
			BuildQuery(fluent_obj,dataRef).addValueEventListener(valueEventListener);
		}
		
		return listenerInd;
	}
	
	private double FirebaseRealTime_Delete(final JSONObject fluent_obj)
	{
		final double listenerInd = RealTime_getListenerInd();
		BuildReference(fluent_obj).removeValue(new DatabaseReference.CompletionListener() 
		{
			@Override
			public void onComplete(DatabaseError error, DatabaseReference ref) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Delete");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
                if(error == null)
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				else
					{RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",getErrorCodeHTTP(error)); RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",error.getMessage());}
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);		
			}
		});
		return listenerInd;
	}
	
	private double FirebaseRealTime_Exists(final JSONObject fluent_obj)
	{
		final double listenerInd = RealTime_getListenerInd();
		BuildReference(fluent_obj).addListenerForSingleValueEvent(new ValueEventListener() 
		{
			@Override
			public void onDataChange(DataSnapshot dataSnapshot) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Exists");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",200);
				if(dataSnapshot.exists())
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"value",1.0);
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"value",0.0);
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
			@Override
			public void onCancelled(DatabaseError error) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRealTime_Exists");
				RunnerJNILib.DsMapAddString(dsMapIndex,"path",(String)JSONObjectGet(fluent_obj,"_path"));
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"status",getErrorCodeHTTP(error)); 
				RunnerJNILib.DsMapAddString(dsMapIndex,"errorMessage",error.getMessage());
				RunnerJNILib.DsMapAddDouble(dsMapIndex,"listener",listenerInd);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
		return listenerInd;
	}
	
	public void FirebaseRealTime_ListenerRemove(JSONObject fluent_obj)
	{
		double ind = ((Double)JSONObjectGet(fluent_obj,"_value")).doubleValue();
		DatabaseReference dataRef = RealTime_valueListernerRefMap.remove(String.valueOf(ind));
		dataRef.getRef().removeEventListener(RealTime_valueListernerMap.remove(String.valueOf(ind)));
	}
	
	public void FirebaseRealTime_ListenerRemoveAll()
	{
		for(String key : RealTime_valueListernerRefMap.keySet())
		{
			DatabaseReference dataRef = RealTime_valueListernerRefMap.get(key);
			dataRef.removeEventListener(RealTime_valueListernerMap.get(key));
		}
		RealTime_valueListernerMap.clear();
		RealTime_valueListernerRefMap.clear();		
	}
	
	///////////////////////// Firease RealTime TOOLS
	
	private double RealTime_getListenerInd()
	{
		RealTime_valueListernerInd ++;
		return(RealTime_valueListernerInd);
	}

	private void RealTime_listenerToMaps(DatabaseReference dataRef,ValueEventListener valueEventListener,double ind)
	{
		RealTime_valueListernerMap.put(String.valueOf(ind),valueEventListener);
		RealTime_valueListernerRefMap.put(String.valueOf(ind),dataRef);
	}
	
	public DatabaseReference BuildReference(JSONObject fluent_obj)
	{
		DatabaseReference dataRef;
		if(fluent_obj.isNull("_database"))
			dataRef = FirebaseDatabase.getInstance().getReference();
		else
			dataRef = FirebaseDatabase.getInstance((String)JSONObjectGet(fluent_obj,"_database")).getReference();
		
		if(!fluent_obj.isNull("_path"))
			dataRef = dataRef.child((String) JSONObjectGet(fluent_obj,"_path"));
		
		if(!fluent_obj.isNull("_push"))
			dataRef = dataRef.push();
		
		return dataRef;
	}
	
	public Query BuildQuery(JSONObject fluent_obj,DatabaseReference dataRef)
	{
		Query mQuery = (Query)dataRef;
		
		if(!fluent_obj.isNull("_OrderBy"))
		if(JSONObjectGet(fluent_obj,"_OrderBy") instanceof String)
		{
			mQuery = mQuery.orderByChild((String)JSONObjectGet(fluent_obj,"_OrderBy"));
		}
		else
		switch(((Double)JSONObjectGet(fluent_obj,"_OrderBy")).intValue())
		{
			// case 0: dataRef = dataRef.orderByChild(JSONObjectGet(fluent_obj,"_OrderBy")); break;
			case 1: mQuery = mQuery.orderByKey(); break;
			case 2: mQuery = mQuery.orderByValue(); break;
		}
		
		if(!fluent_obj.isNull("_StartValue"))
		if(JSONObjectGet(fluent_obj,"_StartValue") instanceof String)
			mQuery = mQuery.startAt((String)JSONObjectGet(fluent_obj,"_StartValue"));
		else
			mQuery = mQuery.startAt((double)JSONObjectGet(fluent_obj,"_StartValue"));
		
		if(!fluent_obj.isNull("_EndValue"))
		if(JSONObjectGet(fluent_obj,"_EndValue") instanceof String)
			mQuery = mQuery.endAt((String)JSONObjectGet(fluent_obj,"_EndValue"));
		else
			mQuery = mQuery.endAt((double)JSONObjectGet(fluent_obj,"_EndValue"));
			
		if(!fluent_obj.isNull("_EqualTo"))
		if(JSONObjectGet(fluent_obj,"_EqualTo") instanceof String)
			mQuery = mQuery.equalTo((String)JSONObjectGet(fluent_obj,"_EqualTo"));
		else
			mQuery = mQuery.equalTo((double)JSONObjectGet(fluent_obj,"_EqualTo"));
			
		if(!fluent_obj.isNull("_LimitKind"))
		if(!fluent_obj.isNull("_LimitValue"))
		{
			switch(((Double)JSONObjectGet(fluent_obj,"_LimitKind")).intValue())
			{
				case 0: mQuery = mQuery.limitToFirst(((Double)JSONObjectGet(fluent_obj,"_LimitValue")).intValue()); break;
				case 1: mQuery = mQuery.limitToLast(((Double)JSONObjectGet(fluent_obj,"_LimitValue")).intValue()); break;
			}			
		}
		return mQuery;
	}
	
	private Object JSONObjectGet(JSONObject jsonObj,String key)
	{
		try 
		{
			if(jsonObj.isNull(key)) 
				return null;
			return jsonObj.get(key);
		}
		catch(Exception e)
		{return null;}
	}

	
	
	///////////////////// LIST/MAP TOOLS
	
	public static String MapToJSON(Map map)
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
	
	public static String ListToJSON(Map map)
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

	public static Map<String,Object> jsonToMap(String jsonStr)
	{
		try
		{
			JSONObject json = new JSONObject(jsonStr);
			Map<String,Object> retMap = new HashMap<String,Object>();
			if(json != JSONObject.NULL) 
				retMap = toMap(json);
			return retMap;
		}
		catch(Exception e)
		{
			return new HashMap<String,Object>();
		}	
	}

	public static Map<String,Object> toMap(JSONObject object) throws Exception
	{
		Map<String,Object> map = new HashMap<String,Object>();
		Iterator<String> keysItr = object.keys();
		while(keysItr.hasNext()) 
		{
			String key = keysItr.next();
			Object value = object.get(key);

			if(value instanceof JSONArray) 
			{
				value = toList((JSONArray) value);
			}
			else 
				if(value instanceof JSONObject) 
				{
					value = toMap((JSONObject) value);
				}
				
			map.put(key,value);
		}
		return map;
	}

	public static List<Object> toList(JSONArray array) throws Exception
	{
		List<Object> list = new ArrayList<Object>();
		for(int i = 0; i < array.length(); i++) 
		{
			Object value = array.get(i);
			if(value instanceof JSONArray) 
			{
				value = toList((JSONArray) value);
			}
			else 
				if(value instanceof JSONObject) 
				{
					value = toMap((JSONObject) value);
				}
			list.add(value);
		}
		return list;
	}
	
	public double getErrorCodeHTTP(DatabaseError error)
	{
		//SDK https://firebase.google.com/docs/reference/android/com/google/firebase/database/DatabaseError
		//REST API https://firebase.google.com/docs/reference/rest/database
		switch(error.getCode())
		{
			case DatabaseError.DISCONNECTED: return 400;
			case DatabaseError.EXPIRED_TOKEN: return 401;
			case DatabaseError.INVALID_TOKEN: return 401;
			case DatabaseError.MAX_RETRIES: return 400;
			case DatabaseError.NETWORK_ERROR: return 400;
			case DatabaseError.OPERATION_FAILED: return 400;
			case DatabaseError.OVERRIDDEN_BY_SET: return 400;
			case DatabaseError.PERMISSION_DENIED: return 401;
			case DatabaseError.UNAVAILABLE: return 503;
			case DatabaseError.UNKNOWN_ERROR: return 400;
			case DatabaseError.USER_CODE_EXCEPTION: return 400;
			case DatabaseError.WRITE_CANCELED: return 400;
		}
		return 400;
	}
}


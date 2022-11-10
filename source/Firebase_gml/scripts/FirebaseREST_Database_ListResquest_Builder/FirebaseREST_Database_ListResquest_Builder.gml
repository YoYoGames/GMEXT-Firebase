function FirebaseREST_Database_ListResquest_Builder(event,obj,orderType,orderKey,filterType,filterKey,filterType2,filterKey2,limitType,limitValue,path,database)
{
	var url = FirebaseREST_RealTime_getURL(path,database)

	//url__encode() solve problems on iOS more info:
	//https://help.yoyogames.com/hc/en-us/articles/216754718-Encoding-URLs

	switch(orderType)
	{
	    case Firebase_OrderBy_Child: url=FirebaseREST_URL_nextInfo(url) url+="orderBy=" + url_encode("\""+orderKey+"\"") break;
	    case Firebase_OrderBy_Key: url=FirebaseREST_URL_nextInfo(url) url+="orderBy="+url_encode("\"$key\"") break;
	    case Firebase_OrderBy_Value: url=FirebaseREST_URL_nextInfo(url) url+="orderBy="+url_encode("\"$value\"") break;
	}

	if(is_string(filterKey))
	switch(filterType)
	{
	    case Firebase_Filter_StartAt: url=FirebaseREST_URL_nextInfo(url) url+="startAt=" + url_encode("\""+filterKey+"\"") break;
	    case Firebase_Filter_EndAt: url=FirebaseREST_URL_nextInfo(url) url+="endAt=" + url_encode("\""+filterKey+"\"") break;
	    case Firebase_Filter_EqualTo: url=FirebaseREST_URL_nextInfo(url) url+="equalTo=" + url_encode("\""+filterKey+"\"") break;
	}
	else
	switch(filterType)
	{
	    case Firebase_Filter_StartAt: url=FirebaseREST_URL_nextInfo(url) url+="startAt=" + url_encode(string(filterKey)) break;
	    case Firebase_Filter_EndAt: url=FirebaseREST_URL_nextInfo(url) url+="endAt=" + url_encode(string(filterKey)) break;
	    case Firebase_Filter_EqualTo: url=FirebaseREST_URL_nextInfo(url) url+="equalTo=" + url_encode(string(filterKey)) break;
	}

	if(is_string(filterType2))
	switch(filterType2)
	{
	    case Firebase_Filter_StartAt: url=FirebaseREST_URL_nextInfo(url) url+="startAt=" + url_encode("\""+filterKey2+"\"") break;
	    case Firebase_Filter_EndAt: url=FirebaseREST_URL_nextInfo(url) url+="endAt=" + url_encode("\""+filterKey2+"\"") break;
	    case Firebase_Filter_EqualTo: url=FirebaseREST_URL_nextInfo(url) url+="equalTo=" + url_encode("\""+filterKey2+"\"") break;
	}
	else
	switch(filterType2)
	{
	    case Firebase_Filter_StartAt: url=FirebaseREST_URL_nextInfo(url) url+="startAt=" + url_encode(string(filterKey2)) break;
	    case Firebase_Filter_EndAt: url=FirebaseREST_URL_nextInfo(url) url+="endAt=" + url_encode(string(filterKey2)) break;
	    case Firebase_Filter_EqualTo: url=FirebaseREST_URL_nextInfo(url) url+="equalTo=" + url_encode(string(filterKey2)) break;
	}

	switch(limitType)
	{
	    case Firebase_LimitTo_First: url=FirebaseREST_URL_nextInfo(url) url+="limitToFirst=" + url_encode(string(limitValue)) break;
	    case Firebase_LimitTo_Last: url=FirebaseREST_URL_nextInfo(url) url+="limitToLast=" + url_encode(string(limitValue)) break;
	}
	
	var ins = FirebaseREST_asyncFunction_RealTime(
				event,
				obj,
				url,
				"GET",//Metod
				/* "{}" */ "X-Firebase-Decoding: 1", // "X-Firebase-Decoding: 1" is the solution until febrery2019 then return to "{}"
				""//Data
				);

	ins.path = path

	return(ins)
}

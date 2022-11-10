
function FirebaseRealTime_List_Builder(event,obj,path,orderBy,equalTo,startValue,endValue,limitType,limitValue,database)
{
	var builder_orderType = ""
	var builder_orderKey = ""
	var builder_filterType = ""
	var builder_filterKey = ""
	var builder_filterType2 = ""
	var builder_filterKey2 = ""
	var builder_limitType = ""
	var builder_limitValue = noone
	
	if(!is_undefined(orderBy))
	if(orderBy == Firebase_OrderBy_Value or orderBy == Firebase_OrderBy_Key)
	{
		builder_orderType = orderBy
		builder_orderKey = ""
	}
	else//if(orderBy == Firebase_OrderBy_Child)
	{
		builder_orderType = Firebase_OrderBy_Child
		builder_orderKey = orderBy
	}
	
	var filter_array = []
	if(!is_undefined(equalTo))
		array_push(filter_array,Firebase_Filter_EqualTo,equalTo)
	
	if(!is_undefined(startValue))
		array_push(filter_array,Firebase_Filter_StartAt,startValue)
		
	if(!is_undefined(endValue))
		array_push(filter_array,Firebase_Filter_EndAt,endValue)
	
	if(array_length(filter_array) > 0)
	{
		builder_filterType = filter_array[0]
		builder_filterKey = filter_array[1]
	}
	
	if(array_length(filter_array) > 2)
	{
		builder_filterType2 = filter_array[2]
		builder_filterKey2 = filter_array[3]
	}
	
	var builder_limitType
	var builder_limitValue
	if(!is_undefined(limitType))
	if(!is_undefined(limitValue))
	{
		builder_limitType = limitType
		builder_limitValue = limitValue
	}
	
	return FirebaseREST_Database_ListResquest_Builder(event,obj,builder_orderType,builder_orderKey,builder_filterType,builder_filterKey,builder_filterType2,builder_filterKey2,builder_limitType,builder_limitValue,path,database)
}

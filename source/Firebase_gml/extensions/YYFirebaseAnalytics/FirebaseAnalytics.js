
//https://firebase.google.com/docs/reference/js/v8/firebase.analytics.Analytics#setuserproperties
function FirebaseAnalytics_SetAnalyticsCollectionEnabled(enabled)
{
	firebase.analytics().setAnalyticsCollectionEnabled(enabled >= .5);
}

function FirebaseAnalytics_LogEvent(event,jsonValues)
{
	if(jsonValues == "" || jsonValues == "{}")
		firebase.analytics().logEvent(event);
	else
		firebase.analytics().logEvent(event,jsonValues);
}

function FirebaseAnalytics_ResetAnalyticsData()
{
	console.log("FirebaseAnalytics_ResetAnalyticsData: Feature not availalee in Web");
}
	
function FirebaseAnalytics_SetDefaultEventParameters(jsonValues)
{
	console.log("FirebaseAnalytics_SetDefaultEventParameters: Feature not availalee in Web");
}
	
function FirebaseAnalytics_SetSessionTimeoutDuration(time)
{
	console.log("FirebaseAnalytics_SetSessionTimeoutDuration: Feature not availalee in Web");
}
	
function FirebaseAnalytics_SetUserId(userID)
{
	firebase.analytics().setUserId(userID);
}
	
function FirebaseAnalytics_SetUserProperty(event,value)
{
	firebase.analytics().setUserProperties(event,value);
}

function FirebaseAnalytics_SetConsent(ads,analytics)
{
	console.log("FirebaseAnalytics_SetConsent: Functions not available on Web");
}


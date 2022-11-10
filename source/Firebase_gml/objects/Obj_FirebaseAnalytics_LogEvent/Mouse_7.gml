
//https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event
//https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param


//Example:
//The event that you want log is: SCREEN_VIEW
//https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#SCREEN_VIEW
//The link tell us that the value: "screen_view"
//and tell us too  possiblies values SCREEN_CLASS  or SCREEN_NAME, we will use SCREEN_NAME
//https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param#SCREEN_NAME
//so the name of param is "screen_name" and now we can set the value that we want: room_get_name(room)

var value = {
			    screen_name : room_get_name(room),
			};

FirebaseAnalytics_LogEvent("screen_view",json_stringify(value))

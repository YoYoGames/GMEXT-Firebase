/// @description Initialize variables

// Initialize the Firabase Remote Extension
// This function lets you setup the server refresh rate
// In this case this means the extension will refresh every hour.
// For testing purposes you might want to change this to "0" but to
// avoid unecessary queries you should up the value for production.
FirebaseRemoteConfig_Initialize(3600)

// Definition of the default values
var defaults = {
   Data0: "default_data0",
   Data1: "default_data1",
   Data2: "default_data2",
   Data3: "default_data3",
   Data4: "default_data4",
   Data5: "default_data5"
};

// This will set the default values, default values are retreived for keys that don't exist
// on the remote server and when the application fails to fetch from remote.
var defaultsJSON = json_stringify(defaults);
FirebaseRemoteConfig_SetDefaultsAsync(defaultsJSON);

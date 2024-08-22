/**
 * @module remote_config
 * @title Remote Config
 * @desc 
 * 
 * ![](assets/remoteconfigBanner.png)
 * 
 * Firebase Remote Config is a cloud service that lets you change the behavior and appearance of your app without requiring users to download an app update. When using Remote Config, you create in-app default values that control the behavior and appearance of your app. Then, you can later use the Firebase console or the Remote Config backend APIs to override in-app default values for all app users or for segments of your user base. Your app controls when updates are applied, and it can frequently check for updates and apply them with a negligible impact on performance.
 * Check the [official page](https://firebase.google.com/docs/remote-config) for more information.
 * 
 * @section Setup
 * @desc Before you can start using any Firebase module extensions you are required to follow some initial configuration. However if you've already done these for any of the other modules you can skip this configuration section and go straight to using the API functions.
 * 
 * * ${page.Guides_Analytics#Create_Project}
 * * ${page.Guides_Cloud_Messaging#Platform_Setup} (**Remote Config** enabling steps are required)
 * 
 * @section_end
 * 
 * @section_func Functions
 * @desc The following functions are given for working with Firebase Remote Config extension:
 * @ref FirebaseRemoteConfig_FetchAndActivate
 * @ref FirebaseRemoteConfig_GetDouble
 * @ref FirebaseRemoteConfig_GetKeys
 * @ref FirebaseRemoteConfig_GetString
 * @ref FirebaseRemoteConfig_Initialize
 * @ref FirebaseRemoteConfig_Reset
 * @ref FirebaseRemoteConfig_SetDefaultsAsync
 * @section_end
 * 
 * @module_end
 */

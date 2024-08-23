/**
 * @module authentication
 * @title Authentication
 * @desc 
 * ![](assets/authenticationBanner.png)
 * 
 * Firebase Authentication provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users to your app. It supports authentication using passwords, phone numbers, popular federated identity providers like Google, Facebook and Twitter, and more.
 * Check the [official page](https://firebase.google.com/docs/auth) for more information.
 * 
 * @section Setup
 * @desc 
 * 
 * [[Note: The **SDK** version is only available for Android, iOS and Web targets; if you're targeting other devices please follow the steps for **REST API**.]]
 * 
 * Before starting to use any Firebase extensions, you are required to follow some initial configuration steps.
 * 
 * * ${page.Guides_Analytics#Create_Project} (skip this if you already have a project)
 * * ${page.Guides_Authentication#Firebase_Console} (enabling Firebase Authentication)
 * * ${page.Guides_Authentication#Platform_Setup} (configure SDKs or REST API)
 * 
 * @section_end
 * 
 * @section Compatibility
 * @desc Below is the GameMaker compatibility table for each provider depending on the target platform (keep in mind that the **REST API** can be used on every platform).
 * 
 * |Provider|Android|iOS|Web|REST API|
 * |----|----|----|----|----|
 * |Custom|yes|yes|yes|yes|
 * |Anonymous|yes|yes|yes|yes|
 * |Email/Password|yes|yes|yes|yes|
 * |Phone|yes|yes|yes|yes|
 * |Google|yes|yes|yes|yes|
 * |Apple|yes|yes|yes|yes|
 * |Facebook|yes|yes|yes|yes|
 * |Google Play|yes|no|no|yes|
 * |GameCenter|no|yes|no|no|
 * 
 * @section_end
 * 
 * @section Auth Configuration
 * @desc These are the available authentication setup guides that you can follow to implement the desired authentication method in your project.
 * 
 * * ${page.LogIns_Authentication#Apple_Authentication}
 * * ${page.LogIns_Authentication#Custom_Authentication}
 * * ${page.LogIns_Authentication#Email_Authentication}
 * * ${page.LogIns_Authentication#Facebook_Authentication}
 * * ${page.LogIns_Authentication#GameCenter_Authentication}
 * * ${page.LogIns_Authentication#Google_Authentication}
 * * ${page.LogIns_Authentication#Google_Play_Services_Authentication}
 * * ${page.LogIns_Authentication#Phone_Authentication}
 * 
 * @section_end
 * 
 * @section_func Functions
 * @desc The functions listed here are given for working with Firebase Authentication extension.
 * 
 * These functions are only available on SDK targets (Android, iOS, Web). Check the **compatibility** table above.
 * 
 * @ref FirebaseAuthentication_ChangeDisplayName
 * @ref FirebaseAuthentication_ChangeEmail
 * @ref FirebaseAuthentication_ChangePassword
 * @ref FirebaseAuthentication_ChangePhotoURL
 * @ref FirebaseAuthentication_DeleteAccount
 * @ref FirebaseAuthentication_GetDisplayName
 * @ref FirebaseAuthentication_GetEmail
 * @ref FirebaseAuthentication_GetEmailVerified
 * @ref FirebaseAuthentication_GetIdToken
 * @ref FirebaseAuthentication_GetLocalId
 * @ref FirebaseAuthentication_GetPhotoUrl
 * @ref FirebaseAuthentication_GetProviderUserInfo
 * @ref FirebaseAuthentication_GetUID
 * @ref FirebaseAuthentication_GetUserData_raw
 * @ref FirebaseAuthentication_LinkWithEmailPassword
 * @ref FirebaseAuthentication_LinkWithOAuthCredential
 * @ref FirebaseAuthentication_LinkWithPhoneNumber
 * @ref FirebaseAuthentication_ReauthenticateWithEmail
 * @ref FirebaseAuthentication_ReauthenticateWithOAuth
 * @ref FirebaseAuthentication_ReauthenticateWithPhoneNumber
 * @ref FirebaseAuthentication_RecaptchaParams
 * @ref FirebaseAuthentication_RefreshUserData
 * @ref FirebaseAuthentication_SendEmailVerification
 * @ref FirebaseAuthentication_SendPasswordResetEmail
 * @ref FirebaseAuthentication_SendVerificationCode
 * @ref FirebaseAuthentication_SignIn_Anonymously
 * @ref FirebaseAuthentication_SignIn_Email
 * @ref FirebaseAuthentication_SignIn_OAuth
 * @ref FirebaseAuthentication_SignInWithCustomToken
 * @ref FirebaseAuthentication_SignInWithPhoneNumber
 * @ref FirebaseAuthentication_SignOut
 * @ref FirebaseAuthentication_SignUp_Email
 * @ref FirebaseAuthentication_UnlinkProvider
 * @ref SDKFirebaseAuthentication_LinkWithGameCenter
 * @ref SDKFirebaseAuthentication_LinkWithProvider
 * @ref SDKFirebaseAuthentication_ReauthenticateWithGameCenter
 * @ref SDKFirebaseAuthentication_ReauthenticateWithProvider
 * @ref SDKFirebaseAuthentication_SignIn_GameCenter
 * @ref SDKFirebaseAuthentication_SignInWithProvider
 * @section_end
 * 
 * @module_end
 */

{
  "$GMExtension":"",
  "%Name":"GameCenter",
  "androidactivityinject":"",
  "androidclassname":"",
  "androidcodeinjection":"",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":false,
  "androidsourcedir":"",
  "author":"",
  "classname":"GameCenter",
  "copyToTargets":9007199254740996,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"0.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"GameCenter.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"GameCenter_Leaderboard_PlayerScope_Global","hidden":false,"name":"GameCenter_Leaderboard_PlayerScope_Global","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"GameCenter_Leaderboard_PlayerScope_FriendsOnly","hidden":false,"name":"GameCenter_Leaderboard_PlayerScope_FriendsOnly","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1",},
        {"$GMExtensionConstant":"","%Name":"GameCenter_Leaderboard_TimeScope_Today","hidden":false,"name":"GameCenter_Leaderboard_TimeScope_Today","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"GameCenter_Leaderboard_TimeScope_Week","hidden":false,"name":"GameCenter_Leaderboard_TimeScope_Week","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1",},
        {"$GMExtensionConstant":"","%Name":"GameCenter_Leaderboard_TimeScope_AllTime","hidden":false,"name":"GameCenter_Leaderboard_TimeScope_AllTime","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"2",},
      ],"copyToTargets":-1,"filename":"GameCenter.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"GameCenter_PresentView_Default","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_PresentView_Default","help":"GameCenter_PresentView_Default()","hidden":false,"kind":4,"name":"GameCenter_PresentView_Default","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_PresentView_Achievements","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_PresentView_Achievements","help":"GameCenter_PresentView_Achievements","hidden":false,"kind":4,"name":"GameCenter_PresentView_Achievements","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_PresentView_Leaderboards","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_PresentView_Leaderboards","help":"GameCenter_PresentView_Leaderboards()","hidden":false,"kind":4,"name":"GameCenter_PresentView_Leaderboards","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_PresentView_Leaderboard","argCount":0,"args":[1,2,],"documentation":"","externalName":"GameCenter_PresentView_Leaderboard","help":"GameCenter_PresentView_Leaderboard(id,timescope,playerscope)","hidden":false,"kind":4,"name":"GameCenter_PresentView_Leaderboard","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_LocalPlayer_Authenticate","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_LocalPlayer_Authenticate","help":"GameCenter_LocalPlayer_Authenticate()","hidden":false,"kind":4,"name":"GameCenter_LocalPlayer_Authenticate","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_LocalPlayer_IsAuthenticated","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_LocalPlayer_IsAuthenticated","help":"GameCenter_LocalPlayer_IsAuthenticated()","hidden":false,"kind":4,"name":"GameCenter_LocalPlayer_IsAuthenticated","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_LocalPlayer_IsUnderage","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_LocalPlayer_IsUnderage","help":"GameCenter_LocalPlayer_IsUnderage()","hidden":false,"kind":4,"name":"GameCenter_LocalPlayer_IsUnderage","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_LocalPlayer_GetInfo","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_LocalPlayer_GetInfo","help":"GameCenter_LocalPlayer_GetInfo()","hidden":false,"kind":4,"name":"GameCenter_LocalPlayer_GetInfo","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_SavedGames_Fetch","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_SavedGames_Fetch","help":"GameCenter_SavedGames_Fetch()","hidden":false,"kind":4,"name":"GameCenter_SavedGames_Fetch","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_SavedGames_Save","argCount":0,"args":[1,1,],"documentation":"","externalName":"GameCenter_SavedGames_Save","help":"GameCenter_SavedGames_Save(name,data)","hidden":false,"kind":4,"name":"GameCenter_SavedGames_Save","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_SavedGames_Delete","argCount":0,"args":[1,],"documentation":"","externalName":"GameCenter_SavedGames_Delete","help":"GameCenter_SavedGames_Delete(name)","hidden":false,"kind":4,"name":"GameCenter_SavedGames_Delete","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_SavedGames_GetData","argCount":0,"args":[1,],"documentation":"","externalName":"GameCenter_SavedGames_GetData","help":"GameCenter_SavedGames_GetData(name)","hidden":false,"kind":4,"name":"GameCenter_SavedGames_GetData","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_SavedGames_ResolveConflict","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_SavedGames_ResolveConflict","help":"GameCenter_SavedGames_ResolveConflict(conlfict_id,data)","hidden":false,"kind":4,"name":"GameCenter_SavedGames_ResolveConflict","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_Leaderboard_Submit","argCount":0,"args":[1,2,],"documentation":"","externalName":"GameCenter_Leaderboard_Submit","help":"GameCenter_Leaderboard_Submit(id,score)","hidden":false,"kind":4,"name":"GameCenter_Leaderboard_Submit","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_Achievement_Report","argCount":0,"args":[1,2,],"documentation":"","externalName":"GameCenter_Achievement_Report","help":"GameCenter_Achievement_Report(identifier,percent)","hidden":false,"kind":4,"name":"GameCenter_Achievement_Report","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_Achievement_ResetAll","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_Achievement_ResetAll","help":"GameCenter_Achievement_ResetAll()","hidden":false,"kind":4,"name":"GameCenter_Achievement_ResetAll","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_PresentView_Achievement","argCount":0,"args":[1,],"documentation":"","externalName":"GameCenter_PresentView_Achievement","help":"GameCenter_PresentView_Achievement(achievement_id)","hidden":false,"kind":4,"name":"GameCenter_PresentView_Achievement","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"GameCenter_FetchItemsForIdentityVerificationSignature","argCount":0,"args":[],"documentation":"","externalName":"GameCenter_FetchItemsForIdentityVerificationSignature","help":"GameCenter_FetchItemsForIdentityVerificationSignature()","hidden":false,"kind":4,"name":"GameCenter_FetchItemsForIdentityVerificationSignature","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"GameCenter.ext","order":[
        {"name":"GameCenter_PresentView_Default","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Achievements","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Achievement","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Leaderboards","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Leaderboard","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_Authenticate","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsAuthenticated","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsUnderage","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_GetInfo","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Fetch","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Save","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Delete","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_GetData","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_ResolveConflict","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Leaderboard_Submit","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Achievement_Report","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Achievement_ResetAll","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_FetchItemsForIdentityVerificationSignature","path":"extensions/GameCenter/GameCenter.yy",},
      ],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"",
  "ioscodeinjection":"",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[
    {"$GMExtensionFrameworkEntry":"","%Name":"GameKit.framework","embed":0,"name":"GameKit.framework","resourceType":"GMExtensionFrameworkEntry","resourceVersion":"2.0","weakReference":false,},
  ],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"GameCenter",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Firebase Authentication Extras Logins (Extensions)",
    "path":"folders/__ReleaseThings__/Firebase Authentication Extras Logins (Extensions).yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":"",
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":"",
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}
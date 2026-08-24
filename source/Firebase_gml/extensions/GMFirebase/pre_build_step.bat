@echo off
set Utils="%~dp0\scriptUtils.bat"

:: ######################################################################################
:: Script Logic

call %Utils% scriptInit

:: Version locks
call %Utils% optionGetValue "versionStable" RUNTIME_VERSION_STABLE
call %Utils% optionGetValue "versionBeta" RUNTIME_VERSION_BETA
call %Utils% optionGetValue "versionDev" RUNTIME_VERSION_DEV
call %Utils% optionGetValue "versionLTS" RUNTIME_VERSION_LTS
call %Utils% versionLockCheck "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV% %RUNTIME_VERSION_LTS%

:: Remove files staged by a previous build.
call %Utils% itemClearDir "%~dp0\AndroidSource\ProjectFiles\"
call %Utils% itemClearDir "%~dp0\iOSProjectFiles\"
if exist "%~dp0\AndroidSource\libs-aar\firebase_messaging_cpp.aar" del /F /Q "%~dp0\AndroidSource\libs-aar\firebase_messaging_cpp.aar"

:: Do not use dynamic labels for desktop platforms: GameMaker platform names can
:: vary (Windows/Mac/Ubuntu/etc.). Android/iOS are handled explicitly; every
:: other native non-web target uses the desktop Firebase JSON.
if /I "%YYPLATFORM_name%"=="Android" (
    call :setupAndroid "%~dp0"
    exit /b %errorlevel%
)
if /I "%YYPLATFORM_name%"=="iOS" (
    call :setupIOS "%~dp0"
    exit /b %errorlevel%
)
if /I "%YYPLATFORM_name%"=="tvOS" exit /b 0
if /I "%YYPLATFORM_name%"=="HTML5" exit /b 0

call :setupDesktop "%~dp0"
exit /b %errorlevel%

:: ######################################################################################
:: Platform setup

:setupAndroid
    echo [FirebaseSetup] Staging Android Firebase files from extension options.

    call %Utils% optionGetValue "jsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [FirebaseSetup] ERROR: Extension option 'jsonFile' is empty.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\AndroidSource\ProjectFiles" mkdir "%~1\AndroidSource\ProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\AndroidSource\ProjectFiles\google-services.json" >nul
    if errorlevel 1 (
        echo [FirebaseSetup] ERROR: Failed to stage google-services.json.
        exit /b 1
    )

    call %Utils% optionGetValue "firebaseCppSdkPath" FIREBASE_CPP_SDK_OPTION
    if not defined FIREBASE_CPP_SDK_OPTION (
        echo [FirebaseSetup] ERROR: Extension option 'firebaseCppSdkPath' is empty.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%FIREBASE_CPP_SDK_OPTION%" FIREBASE_CPP_SDK
    if errorlevel 1 exit /b 1

    if not exist "%FIREBASE_CPP_SDK%\include\firebase\app.h" (
        echo [FirebaseSetup] ERROR: '%FIREBASE_CPP_SDK%' is not a Firebase C++ SDK root.
        echo [FirebaseSetup] Expected: %FIREBASE_CPP_SDK%\include\firebase\app.h
        exit /b 1
    )

    set "MESSAGING_AAR=%FIREBASE_CPP_SDK%\libs\android\firebase_messaging_cpp.aar"
    if not exist "%MESSAGING_AAR%" (
        echo [FirebaseSetup] ERROR: Firebase Messaging C++ AAR not found:
        echo [FirebaseSetup]   %MESSAGING_AAR%
        exit /b 1
    )

    if not exist "%~1\AndroidSource\libs-aar" mkdir "%~1\AndroidSource\libs-aar"
    copy /Y "%MESSAGING_AAR%" "%~1\AndroidSource\libs-aar\firebase_messaging_cpp.aar" >nul
    if errorlevel 1 (
        echo [FirebaseSetup] ERROR: Failed to stage firebase_messaging_cpp.aar.
        exit /b 1
    )

    echo [FirebaseSetup] Android Firebase assets staged successfully.
exit /b 0

:setupIOS
    echo [FirebaseSetup] Staging iOS Firebase credentials from extension options.

    call %Utils% optionGetValue "plistFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [FirebaseSetup] ERROR: Extension option 'plistFile' is empty.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\iOSProjectFiles" mkdir "%~1\iOSProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\iOSProjectFiles\GoogleService-Info.plist" >nul
    if errorlevel 1 (
        echo [FirebaseSetup] ERROR: Failed to stage GoogleService-Info.plist.
        exit /b 1
    )

    echo [FirebaseSetup] iOS Firebase credentials staged successfully.
exit /b 0

:setupDesktop
    echo [FirebaseSetup] Validating desktop Firebase JSON from extension options.

    call %Utils% optionGetValue "desktopJsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [FirebaseSetup] ERROR: Extension option 'desktopJsonFile' is empty.
        echo [FirebaseSetup] This option is required for Windows/macOS/Linux Firebase C++ builds.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    :: Do not copy into the GameMaker project's datafiles directory.
    :: post_build_step.bat copies this file into the compiled desktop output,
    :: beside the executable when one exists there.
    echo [FirebaseSetup] Desktop Firebase config resolved:
    echo [FirebaseSetup]   %FILE_PATH%
exit /b 0

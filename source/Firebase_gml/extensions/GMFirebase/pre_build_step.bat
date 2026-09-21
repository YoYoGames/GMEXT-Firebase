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
:: The setup result has to leave the script from outside any parenthesised
:: block: inside one, %errorlevel% is expanded before the call runs, and an
:: "exit /b" after a call in the same block reaches cmd as 0 anyway.
if /I "%YYPLATFORM_name%"=="Android" goto :stageAndroid
if /I "%YYPLATFORM_name%"=="iOS" goto :stageIOS
if /I "%YYPLATFORM_name%"=="tvOS" exit /b 0
if /I "%YYPLATFORM_name%"=="HTML5" exit /b 0

call :setupDesktop "%~dp0"
exit /b %errorlevel%

:stageAndroid
call :setupAndroid "%~dp0"
exit /b %errorlevel%

:stageIOS
call :setupIOS "%~dp0"
exit /b %errorlevel%

:: ######################################################################################
:: Platform setup

:setupAndroid
    call %Utils% logInformation "Staging Android Firebase files from extension options."

    call %Utils% optionGetValue "jsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE call %Utils% logError "Extension option 'jsonFile' is empty."

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\AndroidSource\ProjectFiles" mkdir "%~1\AndroidSource\ProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\AndroidSource\ProjectFiles\google-services.json" >nul
    if errorlevel 1 call %Utils% logError "Failed to stage google-services.json into AndroidSource\ProjectFiles."

    call %Utils% optionGetValue "sdkPath" FIREBASE_CPP_SDK_OPTION
    if not defined FIREBASE_CPP_SDK_OPTION call %Utils% logError "Extension option 'sdkPath' is empty."

    call %Utils% pathResolveExisting "%YYprojectDir%" "%FIREBASE_CPP_SDK_OPTION%" FIREBASE_CPP_SDK
    if errorlevel 1 exit /b 1

    if not exist "%FIREBASE_CPP_SDK%\include\firebase\app.h" call %Utils% logError "'%FIREBASE_CPP_SDK%' is not a Firebase C++ SDK root. Expected '%FIREBASE_CPP_SDK%\include\firebase\app.h'."

    set "MESSAGING_AAR=%FIREBASE_CPP_SDK%\libs\android\firebase_messaging_cpp.aar"
    if not exist "%MESSAGING_AAR%" call %Utils% logError "Firebase Messaging C++ AAR not found: '%MESSAGING_AAR%'."

    if not exist "%~1\AndroidSource\libs-aar" mkdir "%~1\AndroidSource\libs-aar"
    copy /Y "%MESSAGING_AAR%" "%~1\AndroidSource\libs-aar\firebase_messaging_cpp.aar" >nul
    if errorlevel 1 call %Utils% logError "Failed to stage firebase_messaging_cpp.aar into AndroidSource\libs-aar."

    call %Utils% logInformation "Android Firebase assets staged successfully."
exit /b 0

:setupIOS
    call %Utils% logInformation "Staging iOS Firebase credentials from extension options."

    call %Utils% optionGetValue "plistFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE call %Utils% logError "Extension option 'plistFile' is empty."

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\iOSProjectFiles" mkdir "%~1\iOSProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\iOSProjectFiles\GoogleService-Info.plist" >nul
    if errorlevel 1 call %Utils% logError "Failed to stage GoogleService-Info.plist into iOSProjectFiles."

    call %Utils% logInformation "iOS Firebase credentials staged successfully."

    :: Stage the Firebase C++ SDK's prebuilt iOS xcframeworks into
    :: iOSSourceFromMac as one .zip per module (matching each entry already
    :: declared under iosThirdPartyFrameworkEntries in GMFirebase.yy), so the
    :: GameMaker iOS build links them without any manual zipping/Included
    :: Files step. Each framework binary is a plain static archive (no
    :: codesign involved), so Compress-Archive alone is enough - no macOS-only
    :: tooling is required here.
    call %Utils% optionGetValue "sdkPath" FIREBASE_CPP_SDK_OPTION
    if not defined FIREBASE_CPP_SDK_OPTION call %Utils% logError "Extension option 'sdkPath' is empty."

    call %Utils% pathResolveExisting "%YYprojectDir%" "%FIREBASE_CPP_SDK_OPTION%" FIREBASE_CPP_SDK
    if errorlevel 1 exit /b 1

    set "IOS_DIR=%~1\iOSSourceFromMac"
    if not exist "%IOS_DIR%" mkdir "%IOS_DIR%"

    for %%M in (firebase firebase_analytics firebase_app_check firebase_auth firebase_database firebase_firestore firebase_functions firebase_installations firebase_messaging firebase_remote_config firebase_storage firebase_ump) do (
        call :stageFirebaseXcframework "%FIREBASE_CPP_SDK%\xcframeworks\%%M.xcframework" "%IOS_DIR%\%%M.zip"
        if errorlevel 1 exit /b 1
    )

    call %Utils% logInformation "iOS Firebase SDK xcframeworks staged successfully."
exit /b 0

:: Zips a single Firebase xcframework, skipping the work if the destination
:: zip is already newer than every file under the source xcframework (avoids
:: re-zipping ~900MB of SDK binaries on every build when nothing changed).
:stageFirebaseXcframework
    set "XCFW=%~1"
    set "ZIP=%~2"

    if not exist "%XCFW%" call %Utils% logError "Firebase xcframework not found: '%XCFW%'."

    set "PS_XCFW=%XCFW%"
    set "PS_ZIP=%ZIP%"
    for /f %%R in ('powershell -NoLogo -NoProfile -Command "$z = $env:PS_ZIP; if (Test-Path $z) { $zipTime = (Get-Item $z).LastWriteTime; $srcTime = (Get-ChildItem -Recurse -File $env:PS_XCFW | Measure-Object -Property LastWriteTime -Maximum).Maximum; if ($srcTime -le $zipTime) { 'skip' } else { 'stale' } } else { 'stale' }"') do set "ZIP_STATE=%%R"

    if "%ZIP_STATE%"=="skip" (
        call %Utils% logInformation "%~nx2 is up to date, skipping."
        set "PS_XCFW="
        set "PS_ZIP="
        exit /b 0
    )

    call %Utils% logInformation "Staging iOS dependency: '%XCFW%' -> '%~nx2'."
    if exist "%ZIP%" del /F /Q "%ZIP%"

    :: Compress-Archive writes zip entries with backslash path separators,
    :: which mangles the nested folder structure when extracted on macOS/Xcode
    :: (the ZIP spec requires "/"). Windows 10's bundled bsdtar (tar.exe)
    :: produces spec-correct "/" separators and, run from inside the parent
    :: folder, keeps "<name>.xcframework/" as the top-level entry - matching
    :: what ditto --keepParent produces on the Mac side.
    for %%F in ("%XCFW%") do set "XCFW_DIR=%%~dpF" & set "XCFW_NAME=%%~nxF"
    pushd "%XCFW_DIR%"
    tar -a -c -f "%ZIP%" "%XCFW_NAME%"
    set "PS_ERR=%errorlevel%"
    popd

    set "PS_XCFW="
    set "PS_ZIP="

    if not "%PS_ERR%"=="0" call %Utils% logError "Failed to zip '%XCFW%' into '%ZIP%'."
exit /b 0

:setupDesktop
    call %Utils% logInformation "Validating desktop Firebase JSON from extension options."

    call %Utils% optionGetValue "jsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE call %Utils% logError "Extension option 'jsonFile' is empty. This option is required for Windows/macOS/Linux Firebase C++ builds."

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    :: Do not copy into the GameMaker project's datafiles directory.
    :: post_build_step.bat copies this file into the compiled desktop output,
    :: beside the executable when one exists there.
    call %Utils% logInformation "Desktop Firebase config resolved: '%FILE_PATH%'."
exit /b 0

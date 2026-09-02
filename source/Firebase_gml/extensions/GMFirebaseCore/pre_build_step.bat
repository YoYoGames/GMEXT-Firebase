@echo off
set Utils="%~dp0\scriptUtils.bat"

:: ######################################################################################
:: Script Logic

call %Utils% scriptInit
if errorlevel 1 exit /b 1

:: Version locks
call %Utils% optionGetValue "versionStable" RUNTIME_VERSION_STABLE
call %Utils% optionGetValue "versionBeta" RUNTIME_VERSION_BETA
call %Utils% optionGetValue "versionDev" RUNTIME_VERSION_DEV
call %Utils% optionGetValue "versionLTS" RUNTIME_VERSION_LTS
call %Utils% versionLockCheck "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV% %RUNTIME_VERSION_LTS%

:: Remove files staged by a previous build.
call %Utils% itemClearDir "%~dp0\AndroidSource\ProjectFiles\"
call %Utils% itemClearDir "%~dp0\iOSProjectFiles\"


:: -----------------------------------------------------------------------------
:: Windows desktop: derive enabled Firebase products from the actual GameMaker
:: project and incrementally relink GMFirebaseCore.dll from the PREBUILT SDK.
::
:: Static Firebase product .libs cannot be unloaded individually at runtime.
:: Relinking Core here is what makes "remove extension from IDE -> product .lib
:: disappears on the next GameMaker build" possible while firebase_app.lib and
:: firebase::App continue to exist exactly once.
:: -----------------------------------------------------------------------------
if /I "%OS%"=="Windows_NT" (
    echo(%YYPLATFORM_name%| findstr /I /C:"Windows" >nul
    if not errorlevel 1 (
        call :syncWindowsFirebaseRuntime "%~dp0"
        if errorlevel 1 exit /b 1
    )
)

:: Do not use dynamic labels for desktop platforms: GameMaker platform names can
:: vary (Windows/Mac/Ubuntu/etc.). Android/iOS are handled explicitly; every
:: other native non-web target uses the desktop Firebase JSON.
if /I "%YYPLATFORM_name%"=="Android" (
    call :setupAndroid "%~dp0"
    if errorlevel 1 exit /b 1
    exit /b 0
)
if /I "%YYPLATFORM_name%"=="iOS" (
    call :setupIOS "%~dp0"
    if errorlevel 1 exit /b 1
    exit /b 0
)
if /I "%YYPLATFORM_name%"=="tvOS" exit /b 0
if /I "%YYPLATFORM_name%"=="HTML5" exit /b 0

call :setupDesktop "%~dp0"
exit /b %errorlevel%


:: ######################################################################################
:: Project-selected Windows Firebase runtime

:syncWindowsFirebaseRuntime
    setlocal EnableExtensions

    set "GMF_CORE_DIR=%~1"
    set "GMF_PROJECT_PATH=%YYprojectPath%"

    if not defined GMF_PROJECT_PATH (
        for %%F in ("%YYprojectDir%\\*.yyp") do (
            if not defined GMF_PROJECT_PATH set "GMF_PROJECT_PATH=%%~fF"
        )
    )

    if not defined GMF_PROJECT_PATH (
        echo [GMFirebaseCore] ERROR: Could not determine the GameMaker .yyp path.
        endlocal & exit /b 1
    )

    if not exist "%GMF_PROJECT_PATH%" (
        echo [GMFirebaseCore] ERROR: GameMaker project does not exist:
        echo [GMFirebaseCore]   %GMF_PROJECT_PATH%
        endlocal & exit /b 1
    )

    set "GMF_MODULE_FILE=%GMF_CORE_DIR%source\\third_party\\GMFirebaseEnabledModules.cmake"

    where powershell.exe >nul 2>nul
    if errorlevel 1 (
        echo [GMFirebaseCore] ERROR: powershell.exe is required to read the GameMaker project.
        endlocal & exit /b 1
    )

    powershell.exe -NoProfile -ExecutionPolicy Bypass ^
        -File "%GMF_CORE_DIR%generate_firebase_modules.ps1" ^
        -ProjectPath "%GMF_PROJECT_PATH%" ^
        -OutputPath "%GMF_MODULE_FILE%"
    if errorlevel 1 (
        echo [GMFirebaseCore] ERROR: Failed to generate Firebase module manifest.
        endlocal & exit /b 1
    )

    where cmake.exe >nul 2>nul
    if errorlevel 1 (
        echo [GMFirebaseCore] ERROR: cmake.exe was not found in PATH.
        echo [GMFirebaseCore] The Windows modular runtime needs CMake to relink the prebuilt Firebase .libs.
        endlocal & exit /b 1
    )

    :: Prefer the Firebase C++ SDK path configured in the extension options.
    :: If it is empty, CMake falls back to the repository-relative Firebase_sdk.
    set "GMF_CMAKE_SDK_ARG="
    call %Utils% optionGetValue "firebaseCppSdkPath" GMF_SDK_OPTION
    if defined GMF_SDK_OPTION (
        call %Utils% pathResolveExisting "%YYprojectDir%" "%GMF_SDK_OPTION%" GMF_SDK_RESOLVED
        if errorlevel 1 (
            echo [GMFirebaseCore] ERROR: firebaseCppSdkPath does not resolve to an existing Firebase C++ SDK.
            endlocal & exit /b 1
        )
        set "GMF_CMAKE_SDK_ARG=-DFIREBASE_SDK_ROOT:PATH=%GMF_SDK_RESOLVED%"
    )

    echo [GMFirebaseCore] Relinking project-selected prebuilt Firebase runtime...
    pushd "%GMF_CORE_DIR%source" >nul

    :: GameMaker builds always use the .yyp-generated manifest, even if a
    :: developer previously configured a manual CMake module override.
    set "GMF_PROJECT_MODULE_ARG=-DGMFIREBASE_PRODUCT_MODULES_OVERRIDE:STRING="

    if defined GMF_CMAKE_SDK_ARG (
        cmake.exe --preset win-x64-release "%GMF_PROJECT_MODULE_ARG%" "%GMF_CMAKE_SDK_ARG%"
    ) else (
        cmake.exe --preset win-x64-release "%GMF_PROJECT_MODULE_ARG%"
    )
    if errorlevel 1 (
        popd >nul
        echo [GMFirebaseCore] ERROR: CMake configure failed.
        endlocal & exit /b 1
    )

    cmake.exe --build --preset win-x64-release
    if errorlevel 1 (
        popd >nul
        echo [GMFirebaseCore] ERROR: CMake build failed.
        endlocal & exit /b 1
    )

    popd >nul
    echo [GMFirebaseCore] Project-selected Firebase runtime ready.
    endlocal & exit /b 0

:: ######################################################################################
:: Platform setup

:setupAndroid
    echo [GMFirebaseCore] Staging Android Firebase files from extension options.

    call %Utils% optionGetValue "jsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [GMFirebaseCore] ERROR: Extension option 'jsonFile' is empty.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\AndroidSource\ProjectFiles" mkdir "%~1\AndroidSource\ProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\AndroidSource\ProjectFiles\google-services.json" >nul
    if errorlevel 1 (
        echo [GMFirebaseCore] ERROR: Failed to stage google-services.json.
        exit /b 1
    )

    echo [GMFirebaseCore] Android Firebase credentials staged successfully.
exit /b 0

:setupIOS
    echo [GMFirebaseCore] Staging iOS Firebase credentials from extension options.

    call %Utils% optionGetValue "plistFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [GMFirebaseCore] ERROR: Extension option 'plistFile' is empty.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    if not exist "%~1\iOSProjectFiles" mkdir "%~1\iOSProjectFiles"
    copy /Y "%FILE_PATH%" "%~1\iOSProjectFiles\GoogleService-Info.plist" >nul
    if errorlevel 1 (
        echo [GMFirebaseCore] ERROR: Failed to stage GoogleService-Info.plist.
        exit /b 1
    )

    echo [GMFirebaseCore] iOS Firebase credentials staged successfully.
exit /b 0

:setupDesktop
    echo [GMFirebaseCore] Validating desktop Firebase JSON from extension options.

    call %Utils% optionGetValue "desktopJsonFile" CREDENTIAL_FILE
    if not defined CREDENTIAL_FILE (
        echo [GMFirebaseCore] ERROR: Extension option 'desktopJsonFile' is empty.
        echo [GMFirebaseCore] This option is required for Windows/macOS/Linux Firebase C++ builds.
        exit /b 1
    )

    call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FILE_PATH
    if errorlevel 1 exit /b 1

    :: Do not copy into the GameMaker project's datafiles directory.
    :: post_build_step.bat copies this file into the compiled desktop output,
    :: beside the executable when one exists there.
    echo [GMFirebaseCore] Desktop Firebase config resolved:
    echo [GMFirebaseCore]   %FILE_PATH%
exit /b 0

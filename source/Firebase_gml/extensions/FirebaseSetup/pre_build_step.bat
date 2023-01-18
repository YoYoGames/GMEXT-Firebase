@echo off

set Utils="%~dp0\scriptUtils.bat"

:: ######################################################################################
:: Macros

call %Utils% pathExtractDirectory "%~0" SCRIPT_PATH
call %Utils% pathExtractBase "%~0" EXTENSION_NAME
call %Utils% toUpper "%EXTENSION_NAME%" EXTENSION_NAME

:: ######################################################################################
:: Script Logic

:: Version locks
set RUNTIME_VERSION_STABLE="2022.9.0.0"
set RUNTIME_VERSION_BETA="2022.900.0.0"
set RUNTIME_VERSION_DEV="9.1.1.0"

:: Checks IDE and Runtime versions
call %Utils% checkMinVersion "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV% runtime

call %Utils% logInformation "We are copying the Firebase configuration files into your project."
call :setup%YYPLATFORM_name%

exit 0

:: ######################################################################################
:: Script Functions

:setupAndroid
    :: Resolve the credentials file path and copy it to the Android ProjectFiles folder
    call :pathResolveExisting "%YYprojectDir%" "%YYEXTOPT_FirebaseSetup_jsonFile%" FILE_PATH
    xcopy /y "%FILE_PATH%" "%SCRIPT_PATH%\AndroidSource\ProjectFiles\"
exit /b 0

:setupIOS
    :: Resolve the credentials file path and copy it to the iOS ProjectFiles folder
    call :pathResolveExisting "%YYprojectDir%" "%YYEXTOPT_FirebaseSetup_plistFile%" FILE_PATH
    xcopy /y "%FILE_PATH%" "%SCRIPT_PATH%\iOSProjectFiles\"
exit /b 0
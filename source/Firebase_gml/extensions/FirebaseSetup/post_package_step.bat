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

call %Utils% logInformation "We are cleaning the configuration files from your project."

if exist "%SCRIPT_PATH%\AndroidSource\ProjectFiles\" ( rmdir /s /q "%SCRIPT_PATH%\AndroidSource\ProjectFiles\" )
if exist "%SCRIPT_PATH%\iOSProjectFiles\" ( rmdir /s /q "%SCRIPT_PATH%\iOSProjectFiles\" )

exit 0


@echo off
set Utils="%~dp0\scriptUtils.bat"

:: ######################################################################################
:: Script Logic

:: Always init the script
call %Utils% scriptInit

:: Version locks
call %Utils% optionGetValue "versionStable" RUNTIME_VERSION_STABLE
call %Utils% optionGetValue "versionBeta" RUNTIME_VERSION_BETA
call %Utils% optionGetValue "versionDev" RUNTIME_VERSION_DEV

:: Checks IDE and Runtime versions
call %Utils% versionLockCheck "%YYruntimeVersion%" %RUNTIME_VERSION_STABLE% %RUNTIME_VERSION_BETA% %RUNTIME_VERSION_DEV%

echo "Removing credential files from your project."

call %Utils% itemDelete "%~dp0\AndroidSource\ProjectFiles\"
call %Utils% itemDelete "%~dp0\iOSProjectFiles\"

exit %errorlevel%


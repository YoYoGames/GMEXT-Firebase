@echo off
set Utils="%~dp0\scriptUtils.bat"
call %Utils% scriptInit
if errorlevel 1 exit /b %errorlevel%

echo [GMFirebaseCore] Removing staged Firebase build assets.
call %Utils% itemDelete "%~dp0\AndroidSource\ProjectFiles\"
call %Utils% itemDelete "%~dp0\iOSProjectFiles\"
exit %errorlevel%

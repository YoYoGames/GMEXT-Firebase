@echo off
set Utils="%~dp0\scriptUtils.bat"
call %Utils% scriptInit

echo [FirebaseSetup] Removing staged Firebase build assets.
call %Utils% itemDelete "%~dp0\AndroidSource\ProjectFiles\"
call %Utils% itemDelete "%~dp0\iOSProjectFiles\"
call %Utils% itemDelete "%~dp0\AndroidSource\libs-aar\firebase_messaging_cpp.aar"
exit %errorlevel%

echo off

if "%YYPLATFORM_name%" == "Android" (
    rmdir /s /q "%YYprojectDir%\extensions\FirebaseSetup\AndroidSource\ProjectFiles\"
)

if "%YYPLATFORM_name%" == "iOS" (
    rmdir /s /q "%YYprojectDir%\extensions\FirebaseSetup\iOSProjectFiles\iOSProjectFiles\"
)

echo "############################## FIREBASE CONFIGURATION ##############################"
echo "We are currently cleaning the configuration files from your project"
echo "####################################################################################"
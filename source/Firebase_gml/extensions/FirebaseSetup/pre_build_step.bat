echo off

echo "############################## FIREBASE CONFIGURATION ##############################"
echo "We are currently configuring the firebase using your private key files"
echo "####################################################################################"

if "%YYPLATFORM_name%" == "Android" (

    if not exist "%YYEXTOPT_FirebaseSetup_jsonFile%" (
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
        echo "The path to google-services.json file was not configured correctly."
        echo "####################################################################################"
        exit 1
    )

    xcopy /y "%YYEXTOPT_FirebaseSetup_jsonFile%" "%YYprojectDir%\extensions\FirebaseSetup\AndroidSource\ProjectFiles\"
)

if "%YYPLATFORM_name%" == "iOS" (

    if not exist "%YYEXTOPT_FirebaseSetup_plistFile%" (
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
	    echo "The path to GoogleServices-Info.plist file was not configured correctly."
        echo "####################################################################################"
        exit 1
    )

    xcopy /y "%YYEXTOPT_FirebaseSetup_plistFile%" "%YYprojectDir%\extensions\FirebaseSetup\iOSProjectFiles\"
)
#!/bin/bash

set echo off

echo "####################### FIREBASE CONFIGURATION #######################"
echo "We are currently configuring the firebase using your private key files"
echo "######################################################################"

if [[ "${YYPLATFORM_name}" == "Android" ]]; then

    if [[ ! -f "${YYEXTOPT_FirebaseSetup_jsonFile}" ]]; then
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
        echo "The path to google-services.json file was not configured correctly."
        echo "####################################################################################"
        exit 1
    fi

    mkdir -p "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/" && cp -rf "${YYEXTOPT_FirebaseSetup_jsonFile}" "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/"

elif [[ "${YYPLATFORM_name}" == "iOS" ]]; then

    if [[ ! -f "${YYEXTOPT_FirebaseSetup_plistFile}" ]]; then
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
	    echo "The path to GoogleServices-Info.plist file was not configured correctly."
        echo "####################################################################################"
        exit 1
    fi

    mkdir -p "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/" && cp -rf "${YYEXTOPT_FirebaseSetup_plistFile}" "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/"
fi


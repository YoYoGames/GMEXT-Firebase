#!/bin/bash

set echo off

echo "###################### FIREBASE CONFIGURATION ######################"
echo "We are currently cleaning the configuration files from your project"
echo "####################################################################"

if [[ "${YYPLATFORM_name}" == "Android" ]]; then

    rm -r "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/"

elif [[ "${YYPLATFORM_name}" == "iOS" ]]; then

    rm -r "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/iOSProjectFiles/"
fi

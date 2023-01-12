#!/bin/bash

echo "############################## FIREBASE CONFIGURATION ##############################"
echo "We are currently cleaning the configuration files from your project"
echo "####################################################################################"

rm -r "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/"
rm -r "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/"

#!/bin/bash

utils="$(dirname "$0")/scriptUtils.sh"
[ ! -x "$utils" ] && chmod +x "$utils"
[[ $(file "$utils") =~ CRLF ]] && sed -i 's/\r$//' "$utils"
source "$utils"

# ######################################################################################
# Macros

pathExtractDirectory "$0" SCRIPT_PATH
pathExtractBase "$0" EXTENSION_NAME
toUpper "$EXTENSION_NAME" EXTENSION_NAME

RUNTIME_VERSION_STABLE="2022.9.0.0"
RUNTIME_VERSION_BETA="2022.900.0.0"
RUNTIME_VERSION_RED="9.1.1.0"

# ######################################################################################
# Script Functions

setupAndroid() {
    # Resolve the credentials file path and copy it to the Android ProjectFiles folder
    pathResolveExisting "$YYprojectDir" "$YYEXTOPT_FirebaseSetup_jsonFile" FILE_PATH
    mkdir -p "${SCRIPT_PATH}/AndroidSource/ProjectFiles/" && cp -rf "${FILE_PATH}" "${SCRIPT_PATH}/AndroidSource/ProjectFiles/"
}

setupiOS() {
    # Resolve the credentials file path and copy it to the iOS ProjectFiles folder
    pathResolveExisting "$YYprojectDir" "$YYEXTOPT_FirebaseSetup_plistFile" FILE_PATH
    mkdir -p "${SCRIPT_PATH}/iOSProjectFiles/" && cp -rf "${FILE_PATH}" "${SCRIPT_PATH}/iOSProjectFiles/"
}

# ######################################################################################
# Script Logic

# Version lock
checkMinVersion "$RUNTIME_VERSION_STABLE" "$RUNTIME_VERSION_BETA" "$RUNTIME_VERSION_RED" "runtime"

logInformation "We are copying the Firebase configuration files into your project."

setup$YYPLATFORM_name


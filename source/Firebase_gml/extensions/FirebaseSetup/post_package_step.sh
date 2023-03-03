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

# ######################################################################################
# Script Logic

# Version lock
checkMinVersion "$RUNTIME_VERSION_STABLE" "$RUNTIME_VERSION_BETA" "$RUNTIME_VERSION_RED" "runtime"

logInformation "We are cleaning the configuration files from your project."

[[ -d "${SCRIPT_PATH}/AndroidSource/ProjectFiles/" ]] && rm -r "${SCRIPT_PATH}/AndroidSource/ProjectFiles/"
[[ -d "${SCRIPT_PATH}/iOSProjectFiles/" ]] && rm -r "${SCRIPT_PATH}/iOSProjectFiles/"

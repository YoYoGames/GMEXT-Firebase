#!/bin/bash

sed -i -e 's/\r$//' "$(dirname "$0")/scriptUtils.sh"
chmod +x "$(dirname "$0")/scriptUtils.sh"
source "$(dirname "$0")/scriptUtils.sh"

# ######################################################################################
# Script Functions

# setupAndroid: Copies the Android Firebase credentials JSON file into the project's
# AndroidSource/ProjectFiles directory. If the destination directory doesn't exist, it
# will be created. If a file with the same name exists, it will be deleted before
# creating the directory.
setupAndroid() {
    echo "Copying Android Firebase credentials into your project."
    optionGetValue "jsonFile" CREDENTIAL_FILE

    # Resolve the credentials file path and copy it to the Android ProjectFiles folder
    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    itemCopyTo "${FILE_PATH}" "$1/AndroidSource/ProjectFiles/"
}

# setupiOS: Copies the iOS Firebase credentials plist file into the project's
# iOSProjectFiles directory. If the destination directory doesn't exist, it will be
# created. If a file with the same name exists, it will be deleted before creating the
# directory.
setupiOS() {
    echo "Copying iOS Firebase credentials into your project."
    optionGetValue "plistFile" CREDENTIAL_FILE

    # Resolve the credentials file path and copy it to the iOS ProjectFiles folder
    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    itemCopyTo "${FILE_PATH}" "$1/iOSProjectFiles/"
}

setupHTML5() {
    echo "Building for HTML5 no extra setup required"
}

# ######################################################################################
# Script Logic

# Always init the script
scriptInit

# Version locks
optionGetValue "versionStable" RUNTIME_VERSION_STABLE
optionGetValue "versionBeta" RUNTIME_VERSION_BETA
optionGetValue "versionDev" RUNTIME_VERSION_DEV
optionGetValue "versionLTS" RUNTIME_VERSION_LTS

# Version lock
versionLockCheck "$YYruntimeVersion" \
    $RUNTIME_VERSION_STABLE \
    $RUNTIME_VERSION_BETA \
    $RUNTIME_VERSION_DEV \
    $RUNTIME_VERSION_LTS

itemClearDir "$(dirname "$0")/AndroidSource/ProjectFiles"
itemClearDir "$(dirname "$0")/iOSProjectFiles"

setup$YYPLATFORM_name "$(dirname "$0")"
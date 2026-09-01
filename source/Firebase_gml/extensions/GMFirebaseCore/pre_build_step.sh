#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
sed -i.bak -e 's/\r$//' "$SCRIPT_DIR/scriptUtils.sh" 2>/dev/null || true
rm -f "$SCRIPT_DIR/scriptUtils.sh.bak"
chmod +x "$SCRIPT_DIR/scriptUtils.sh"
source "$SCRIPT_DIR/scriptUtils.sh"

setupAndroid() {
    echo "[GMFirebaseCore] Staging Android Firebase files from extension options."

    optionGetValue "jsonFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'jsonFile' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    mkdir -p "$1/AndroidSource/ProjectFiles"
    cp -f "$FILE_PATH" "$1/AndroidSource/ProjectFiles/google-services.json"

    echo "[GMFirebaseCore] Android Firebase credentials staged successfully."
}

setupiOS() {
    echo "[GMFirebaseCore] Staging iOS Firebase credentials from extension options."

    optionGetValue "plistFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'plistFile' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    mkdir -p "$1/iOSProjectFiles"
    cp -f "$FILE_PATH" "$1/iOSProjectFiles/GoogleService-Info.plist"

    echo "[GMFirebaseCore] iOS Firebase credentials staged successfully."
}

setupDesktop() {
    echo "[GMFirebaseCore] Validating desktop Firebase JSON from extension options."

    optionGetValue "desktopJsonFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'desktopJsonFile' is empty. This option is required for Windows/macOS/Linux Firebase C++ builds."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH

    # Do not copy into the GameMaker project's datafiles directory.
    # post_build_step.sh copies this file into the compiled desktop output,
    # beside the executable when one exists there.
    echo "[GMFirebaseCore] Desktop Firebase config resolved: $FILE_PATH"
}

setupHTML5() {
    echo "[GMFirebaseCore] HTML5: no native Firebase C++ staging required."
}

scriptInit

optionGetValue "versionStable" RUNTIME_VERSION_STABLE
optionGetValue "versionBeta" RUNTIME_VERSION_BETA
optionGetValue "versionDev" RUNTIME_VERSION_DEV
optionGetValue "versionLTS" RUNTIME_VERSION_LTS
versionLockCheck "$YYruntimeVersion" "$RUNTIME_VERSION_STABLE" "$RUNTIME_VERSION_BETA" "$RUNTIME_VERSION_DEV" "$RUNTIME_VERSION_LTS"

itemClearDir "$SCRIPT_DIR/AndroidSource/ProjectFiles"
itemClearDir "$SCRIPT_DIR/iOSProjectFiles"

case "$YYPLATFORM_name" in
    Android)
        setupAndroid "$SCRIPT_DIR"
        ;;
    iOS)
        setupiOS "$SCRIPT_DIR"
        ;;
    tvOS|HTML5)
        echo "[GMFirebaseCore] $YYPLATFORM_name: no desktop Firebase JSON staging required."
        ;;
    *)
        # Windows/macOS/Linux native targets land here. This intentionally avoids
        # depending on GameMaker's exact desktop platform display names.
        setupDesktop "$SCRIPT_DIR"
        ;;
esac

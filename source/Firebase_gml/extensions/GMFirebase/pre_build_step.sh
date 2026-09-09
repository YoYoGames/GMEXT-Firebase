#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
sed -i.bak -e 's/\r$//' "$SCRIPT_DIR/scriptUtils.sh" 2>/dev/null || true
rm -f "$SCRIPT_DIR/scriptUtils.sh.bak"
chmod +x "$SCRIPT_DIR/scriptUtils.sh"
source "$SCRIPT_DIR/scriptUtils.sh"

setupAndroid() {
    echo "[FirebaseSetup] Staging Android Firebase files from extension options."

    optionGetValue "jsonFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'jsonFile' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    mkdir -p "$1/AndroidSource/ProjectFiles"
    cp -f "$FILE_PATH" "$1/AndroidSource/ProjectFiles/google-services.json"

    optionGetValue "firebaseCppSdkPath" FIREBASE_CPP_SDK_OPTION
    if [ -z "$FIREBASE_CPP_SDK_OPTION" ]; then
        logError "Extension option 'firebaseCppSdkPath' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$FIREBASE_CPP_SDK_OPTION" FIREBASE_CPP_SDK

    if [ ! -f "$FIREBASE_CPP_SDK/include/firebase/app.h" ]; then
        logError "'$FIREBASE_CPP_SDK' is not a Firebase C++ SDK root. Expected '$FIREBASE_CPP_SDK/include/firebase/app.h'."
        exit 1
    fi

    MESSAGING_AAR="$FIREBASE_CPP_SDK/libs/android/firebase_messaging_cpp.aar"
    if [ ! -f "$MESSAGING_AAR" ]; then
        logError "Firebase Messaging C++ AAR not found: '$MESSAGING_AAR'."
        exit 1
    fi

    mkdir -p "$1/AndroidSource/libs-aar"
    cp -f "$MESSAGING_AAR" "$1/AndroidSource/libs-aar/firebase_messaging_cpp.aar"

    echo "[FirebaseSetup] Android Firebase assets staged successfully."
}

setupiOS() {
    echo "[FirebaseSetup] Staging iOS Firebase credentials from extension options."

    optionGetValue "plistFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'plistFile' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH
    mkdir -p "$1/iOSProjectFiles"
    cp -f "$FILE_PATH" "$1/iOSProjectFiles/GoogleService-Info.plist"

    echo "[FirebaseSetup] iOS Firebase credentials staged successfully."

    # Stage the Firebase C++ SDK's prebuilt iOS xcframeworks into
    # iOSSourceFromMac as one .zip per module (matching each entry already
    # declared under iosThirdPartyFrameworkEntries in GMFirebase.yy), so the
    # GameMaker iOS build links them without any manual zipping/Included
    # Files step. Each framework binary is a plain static archive (no
    # codesign involved), so no signature stripping is needed here -
    # ditto alone produces a build-ready zip.
    optionGetValue "firebaseCppSdkPath" FIREBASE_CPP_SDK_OPTION
    if [ -z "$FIREBASE_CPP_SDK_OPTION" ]; then
        logError "Extension option 'firebaseCppSdkPath' is empty."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$FIREBASE_CPP_SDK_OPTION" FIREBASE_CPP_SDK

    IOS_DIR="$1/iOSSourceFromMac"
    mkdir -p "$IOS_DIR"

    FIREBASE_XCFRAMEWORK_MODULES="firebase firebase_analytics firebase_app_check firebase_auth firebase_database firebase_firestore firebase_functions firebase_installations firebase_messaging firebase_remote_config firebase_storage firebase_ump"

    for module in $FIREBASE_XCFRAMEWORK_MODULES; do
        XCFW="$FIREBASE_CPP_SDK/xcframeworks/$module.xcframework"
        if [ ! -d "$XCFW" ]; then
            logError "Firebase xcframework not found: '$XCFW'."
            exit 1
        fi

        ZIP="$IOS_DIR/$module.zip"

        # Skip re-zipping when the existing zip is already newer than every
        # file under the source xcframework (avoids re-zipping ~900MB of
        # SDK binaries on every build when nothing changed).
        if [ -f "$ZIP" ] && [ -z "$(find "$XCFW" -newer "$ZIP" -print -quit)" ]; then
            echo "[FirebaseSetup] $module.zip is up to date, skipping."
            continue
        fi

        echo "[FirebaseSetup] Staging iOS dependency: $XCFW -> $module.zip"
        rm -f "$ZIP"
        # --keepParent keeps the top-level <module>.xcframework folder inside
        # the archive; --norsrc/--noextattr avoid AppleDouble "._" files that
        # break ProcessXCFramework.
        if ! ditto -c -k --norsrc --noextattr --keepParent "$XCFW" "$ZIP"; then
            logError "Failed to zip '$XCFW' into '$ZIP'."
        fi
    done

    echo "[FirebaseSetup] iOS Firebase SDK xcframeworks staged successfully."
}

setupDesktop() {
    echo "[FirebaseSetup] Validating desktop Firebase JSON from extension options."

    optionGetValue "desktopJsonFile" CREDENTIAL_FILE
    if [ -z "$CREDENTIAL_FILE" ]; then
        logError "Extension option 'desktopJsonFile' is empty. This option is required for Windows/macOS/Linux Firebase C++ builds."
        exit 1
    fi

    pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FILE_PATH

    # Do not copy into the GameMaker project's datafiles directory.
    # post_build_step.sh copies this file into the compiled desktop output,
    # beside the executable when one exists there.
    echo "[FirebaseSetup] Desktop Firebase config resolved: $FILE_PATH"
}

setupHTML5() {
    echo "[FirebaseSetup] HTML5: no native Firebase C++ staging required."
}

scriptInit

optionGetValue "versionStable" RUNTIME_VERSION_STABLE
optionGetValue "versionBeta" RUNTIME_VERSION_BETA
optionGetValue "versionDev" RUNTIME_VERSION_DEV
optionGetValue "versionLTS" RUNTIME_VERSION_LTS
versionLockCheck "$YYruntimeVersion" "$RUNTIME_VERSION_STABLE" "$RUNTIME_VERSION_BETA" "$RUNTIME_VERSION_DEV" "$RUNTIME_VERSION_LTS"

itemClearDir "$SCRIPT_DIR/AndroidSource/ProjectFiles"
itemClearDir "$SCRIPT_DIR/iOSProjectFiles"
rm -f "$SCRIPT_DIR/AndroidSource/libs-aar/firebase_messaging_cpp.aar"

case "$YYPLATFORM_name" in
    Android)
        setupAndroid "$SCRIPT_DIR"
        ;;
    iOS)
        setupiOS "$SCRIPT_DIR"
        ;;
    tvOS|HTML5)
        echo "[FirebaseSetup] $YYPLATFORM_name: no desktop Firebase JSON staging required."
        ;;
    *)
        # Windows/macOS/Linux native targets land here. This intentionally avoids
        # depending on GameMaker's exact desktop platform display names.
        setupDesktop "$SCRIPT_DIR"
        ;;
esac

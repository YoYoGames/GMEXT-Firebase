#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/scriptUtils.sh"
scriptInit

# Mobile/web platforms use their normal Firebase platform configuration.
case "$YYPLATFORM_name" in
    Android|iOS|tvOS|HTML5)
        exit 0
        ;;
esac

echo "[FirebaseSetup] Copying desktop Firebase JSON beside the built executable."

optionGetValue "desktopJsonFile" CREDENTIAL_FILE
if [ -z "$CREDENTIAL_FILE" ]; then
    logError "Extension option 'desktopJsonFile' is empty."
fi

pathResolveExisting "$YYprojectDir" "$CREDENTIAL_FILE" FIREBASE_JSON_SOURCE

if [ -z "$YYoutputFolder" ]; then
    logError "GameMaker variable 'YYoutputFolder' is empty."
fi

if [ ! -d "$YYoutputFolder" ]; then
    logError "GameMaker output folder does not exist: '$YYoutputFolder'."
fi

copyFirebaseJson() {
    local destination_dir="$1"

    mkdir -p "$destination_dir"
    cp -f "$FIREBASE_JSON_SOURCE" "$destination_dir/google-services.json"

    echo "[FirebaseSetup] Desktop Firebase config copied:"
    echo "[FirebaseSetup]   $destination_dir/google-services.json"
}

COPIED_NEXT_TO_EXE=0

case "$YYPLATFORM_name" in
    macOS|Mac|MacOS|OSX)
        # macOS executable(s) live inside <Game>.app/Contents/MacOS.
        while IFS= read -r -d '' macos_dir; do
            copyFirebaseJson "$macos_dir"
            COPIED_NEXT_TO_EXE=1
        done < <(
            find "$YYoutputFolder" \
                -type d \
                -path "*.app/Contents/MacOS" \
                -print0 2>/dev/null
        )
        ;;

    *)
        # Linux/Ubuntu: prefer the executable whose basename matches the
        # GameMaker project name.
        if [ -n "$YYprojectName" ]; then
            while IFS= read -r -d '' exe; do
                copyFirebaseJson "$(dirname "$exe")"
                COPIED_NEXT_TO_EXE=1
            done < <(
                find "$YYoutputFolder" \
                    -type f \
                    -name "$YYprojectName" \
                    -perm -111 \
                    -print0 2>/dev/null
            )
        fi
        ;;
esac

# Fallback, and also useful because Firebase desktop searches the process
# working directory: keep a copy at GameMaker's compiled output root.
if [ "$COPIED_NEXT_TO_EXE" -eq 0 ]; then
    echo "[FirebaseSetup] Exact desktop executable was not found; using YYoutputFolder."
fi

copyFirebaseJson "$YYoutputFolder"

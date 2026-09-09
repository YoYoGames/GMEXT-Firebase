#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
sed -i.bak -e 's/\r$//' "$SCRIPT_DIR/scriptUtils.sh" 2>/dev/null || true
rm -f "$SCRIPT_DIR/scriptUtils.sh.bak"
chmod +x "$SCRIPT_DIR/scriptUtils.sh"
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

packageLinuxFirebaseJson() {
    local project_name="$YYprojectName"

    # Match the Steamworks Linux post-build convention. When CI does not set
    # YYprojectName, derive it from YYprojectPath.
    if [ -z "$project_name" ] && [ -n "$YYprojectPath" ]; then
        project_name="$(basename "${YYprojectPath%.*}")"
    fi

    if [ -z "$project_name" ]; then
        logError "Unable to determine the GameMaker project name for Linux asset ZIP staging."
    fi

    local project_zip="$YYoutputFolder/${project_name}.zip"
    if [ ! -f "$project_zip" ]; then
        logError "GameMaker Linux asset ZIP does not exist: '$project_zip'."
    fi

    local temp_folder="$YYoutputFolder/${project_name}___firebase_temp___"
    rm -rf "$temp_folder"
    mkdir -p "$temp_folder/assets"

    # Firebase C++ desktop searches the process current working directory for
    # google-services-desktop.json and then google-services.json. In a packaged
    # GameMaker Linux build the executable is at the project ZIP root, so stage
    # the Android JSON at the ZIP root beside the executable. Keep an assets
    # copy as well for GameMaker asset/debug workflows.
    cp -f "$FIREBASE_JSON_SOURCE" "$temp_folder/google-services.json"
    cp -f "$FIREBASE_JSON_SOURCE" "$temp_folder/assets/google-services.json"

    pushd "$YYoutputFolder" >/dev/null
    zipUpdate "$(basename "$temp_folder")" "$(basename "$project_zip")"
    popd >/dev/null

    rm -rf "$temp_folder"

    echo "[FirebaseSetup] Linux Firebase config added to GameMaker package ZIP:"
    echo "[FirebaseSetup]   $project_zip -> google-services.json"
    echo "[FirebaseSetup]   $project_zip -> assets/google-services.json (fallback)"
}

# GameMaker's Linux package ZIP contains the executable at its root and normal
# runner assets under assets/. Firebase C++ desktop searches the process current
# working directory, so package google-services.json at ZIP root beside the
# executable. We also retain an assets/ copy as a fallback/debug convenience.
case "$YYPLATFORM_name" in
    Linux|Ubuntu)
        packageLinuxFirebaseJson
        ;;
esac

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

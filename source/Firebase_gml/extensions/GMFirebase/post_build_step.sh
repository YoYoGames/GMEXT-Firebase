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

logInformation "Copying desktop Firebase JSON beside the built executable."

optionGetValue "jsonFile" CREDENTIAL_FILE
if [ -z "$CREDENTIAL_FILE" ]; then
    logError "Extension option 'jsonFile' is empty."
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

    logInformation "Desktop Firebase config copied: '$destination_dir/google-services.json'."
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

    # Firebase C++ desktop searches the process current working directory for
    # google-services-desktop.json and then google-services.json. In a packaged
    # GameMaker Linux build the executable is at the project ZIP root, so stage
    # the Android JSON at the ZIP root beside the executable. Keep an assets
    # copy as well for GameMaker asset/debug workflows.
    addFirebaseJsonToZip "$project_zip" 1

    logInformation "Linux Firebase config added to GameMaker package ZIP '$project_zip': google-services.json at the root, assets/google-services.json as the fallback."
}

# Adds google-services.json to a GameMaker package ZIP under assets/, where the
# asset compiler puts an Included File, and at the ZIP root too when asked.
addFirebaseJsonToZip() {
    local zip_path="$1"
    local at_root="$2"
    local zip_dir
    zip_dir="$(dirname "$zip_path")"

    local temp_folder="$zip_dir/$(basename "${zip_path%.*}")___firebase_temp___"
    rm -rf "$temp_folder"
    mkdir -p "$temp_folder/assets"

    cp -f "$FIREBASE_JSON_SOURCE" "$temp_folder/assets/google-services.json"
    if [ "$at_root" -eq 1 ]; then
        cp -f "$FIREBASE_JSON_SOURCE" "$temp_folder/google-services.json"
    fi

    pushd "$zip_dir" >/dev/null
    zipUpdate "$(basename "$temp_folder")" "$(basename "$zip_path")"
    popd >/dev/null

    rm -rf "$temp_folder"
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
        # This step runs before xcodebuild, so there is no <Game>.app yet. A YYC
        # export is an Xcode project at this point, and its
        # <Proj>/<Proj>/Supporting Files folder is what Xcode copies into
        # <Game>.app/Contents/Resources - the directory getConfigSearchDir()
        # reads on macOS. A VM export is a package ZIP (game.zip, or
        # <project>.zip for a run) whose assets/ is where an Included File goes.
        while IFS= read -r -d '' supporting_dir; do
            copyFirebaseJson "$supporting_dir"
            COPIED_NEXT_TO_EXE=1
        done < <(
            find "$YYoutputFolder" \
                -mindepth 3 -maxdepth 3 \
                -type d \
                -name "Supporting Files" \
                -print0 2>/dev/null
        )

        package_name="$YYprojectName"
        if [ -z "$package_name" ] && [ -n "$YYprojectPath" ]; then
            package_name="$(basename "${YYprojectPath%.*}")"
        fi

        package_zips=("$YYoutputFolder/game.zip")
        if [ -n "$package_name" ] && [ "$package_name" != "game" ]; then
            package_zips+=("$YYoutputFolder/${package_name}.zip")
        fi

        for package_zip in "${package_zips[@]}"; do
            [ -f "$package_zip" ] || continue
            addFirebaseJsonToZip "$package_zip" 0
            logInformation "Desktop Firebase config added to package ZIP '$package_zip': assets/google-services.json."
            COPIED_NEXT_TO_EXE=1
        done

        if [ "$COPIED_NEXT_TO_EXE" -eq 0 ]; then
            logWarning "No Xcode project (<Proj>/<Proj>/Supporting Files) or package ZIP (game.zip, ${package_name:-<project>}.zip) under '$YYoutputFolder'; the Firebase config was not staged into the macOS bundle."
        fi
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
# working directory: keep a copy at GameMaker's compiled output root. Not a
# warning: a Run has no executable in the output (the runner is the runtime's),
# on Linux it normally sits inside the package ZIP staged above, and the macOS
# branch has already warned when nothing was found.
if [ "$COPIED_NEXT_TO_EXE" -eq 0 ]; then
    logInformation "Exact desktop executable was not found; using YYoutputFolder."
fi

copyFirebaseJson "$YYoutputFolder"

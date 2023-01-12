#!/bin/bash

#!/bin/bash

# ######################################################################################
# Auxiliar Functions

# Sets a string to uppercase
toUpper() { # str result
    export $2=$(echo $1 | tr '[:lower:]' '[:upper:]')
}

# Extracts the full folder path from a filepath
pathExtract() { # fullpath result
    export $2="$(dirname "${$1}")"
}

# Extracts the parent folder from a path
pathExtractParent() { # fullpath result
    # https://www.linuxquestions.org/questions/linux-newbie-8/bash-getting-parent-folder-name-4175662474/
}

# Checks minimum product version for the 3 available builds (handles errors)
checkMinVersion() { # current stable beta develop identifier
    compareVersions "$1" "$3" result
    [[ "$result" -ge "0" ]] && return
    compareVersions "$1" "$2" result
    [[ "$result" -ge "0" ]] && return
    compareVersions "$1" "$4" result
    [[ "$result" -ge "0" ]] && return
    errorMinVersion "$1" "STABLE v$2 or BETA v$3" "$5"
}

# Resolves a relative path if required
pathResolve() { # basePath relativePath result
    pushd "$1" >/dev/null
    if [[ -d "$2" ]]
    then
        cd "$2" >/dev/null
        export $3="$(pwd)" && popd >/dev/null
    elif [[ -e "$2" ]]
    then
        cd "$(dirname "$2")" >/dev/null
        export $3="$(pwd)/$(basename "$2")" && popd >/dev/null
    fi
}

# Resolves an existing relative path if required (handles errors)
pathResolveExisting() { # basePath relativePath result
    pushd "$1" >/dev/null
    [[ ! -d "$2" ]] && errorPathInexistant "$2"
    popd >/dev/null

    local loc_test
    pathResolve "$1" "$2" loc_test
    export $3=$loc_test
}

# Copies file to provided location (handles errors)
fileCopyTo() { # srcFile destFolder
    cp -fr "$1" "$2"
    [[ $? != 0 ]] && errorFileCopy "$1" "$2"
}

# Extracts a zip file to a folder (handles errors)
fileExtract() { # srcFile destFolder identifier
    unzip $1.zip -d "$2"
    [[ $? != 0 ]] && errorFileExtract "$1" "$2" "$3"
}

# Compresses folder into a zip file (handles errors)
folderCompress() { # srcFolder destFile identifier
    zip -FS -j -r "$2" "$1/*"
    [[ $? != 0 ]] && errorFolderCompress "$1" "$2" "$3"
}

# Generates a SHA256 hash of a file and stores it into a variable
fileGetHash() { # pathToBinary
    export $2=$(shasum -a 256 "$1" | cut -d ' ' -f 1)
}

# Asserts a file hash
assertFileHash() { # pathToBinary hash name
    local loc_name=$(basename -- "$1")
    [[ $# == 3 ]] && loc_name="$3"
    local loc_output
    fileGetHash "$1" loc_output
    shopt -s nocasematch
    case "$loc_output" in
    $2 ) return;;
    *) echo errorHashMismatch "$loc_name";;
    esac
}

# Compares two version numbers and saves result into variable
compareVersions() { # version1 version2 result
    if [[ $1 == $2 ]]
    then
        export $3=0 && return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done

    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            export $3=1 && return 0
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            export $3=-1 && return 0
        fi
    done
    export $3=0 %% return 0
}

# Asserts an exact version number
assertExactVersion() { # version reqVersion name
    local loc_name="file"
    [[ $# == 3 ]] && loc_name=$3
    local loc_output
    compareVersion "$1" "$2" loc_output
    [[ $loc_output != 0 ]] && errorExactVersion "$1" "$2" "$loc_name"
}

# Asserts a minimum version number
assertMinVersion() { # version minVersion name
    local loc_name="file"
    [[ $# == 3 ]] && loc_name=$3
    local loc_output
    compareVersion "$1" "$2" loc_output
    [[ $loc_output == -1 ]] && errorMinVersion "$1" "$2" "$loc_name"
}

# Sets a variable to a given value with default
setWithDefault() { # variable optional value
    export $1=$2
    [[ $# == 3 ]] && loc_name=$3
}

# Unsets a collection of variables
unset() { # variables
    for var in "$@" do; unset $var; done
}

# Logs a information message
logInformation() { # message
    log "Information" "$1"
}

# Logs a warning message
logWarning() { # message
    log "Warning" "$1"
}

# Logs a error message
logError() { # message
    log "Error" "$1"
}

# Logs a message with a tag
log() { # tag message
    echo [$EXTENSION_NAME] $1: $2
}


# ######################################################################################
# Error Messages

errorExactVersion() { # version reqVersion name
    echo "########################################## ERROR ##########################################"
    echo "# Invalid '$3' version, requires '$2' (got '$1')"
    echo "###########################################################################################"
    exit 1
}

errorMinVersion() { # version minVersion name
    echo "########################################## ERROR ##########################################"
    echo "# Invalid '$3' version, requires at least '$2' (got '$1')"
    echo "###########################################################################################"
    exit 1
}

errorHashMismatch() { # identifier
    echo "########################################## ERROR ##########################################"
    echo "# Invalid '$1' version, sha256 hash mismatch. Please check documentation."
    echo "###########################################################################################"
    exit 1
}

errorPathInexistant() { # fullpath
    echo "########################################## ERROR ##########################################"
    echo "# Invalid path '$1' does not exist."
    echo "###########################################################################################"
    exit 1
}

errorFileExtract() { # filepath identifier
    local loc_name="file"
    [[ $# == 2 ]] && loc_name=$2
    echo "########################################## ERROR ##########################################"
    echo "# Failed to expand $loc_name '$1' (please file a bug on this issue)."
    echo "###########################################################################################"
    exit 1
}

errorFolderCompress() { # folderpath identifier
    local loc_name="folder"
    [[ $# == 2 ]] && loc_name=$2
    echo "########################################## ERROR ##########################################"
    echo "# Failed to compress $loc_name '$1' (please file a bug on this issue)."
    echo "###########################################################################################"
    exit 1
}

errorDirectoryDelete() { # fullpath
    echo "########################################## ERROR ##########################################"
    echo "# Failed to delete folder '$1' (please file a bug on this issue)."
    echo "###########################################################################################"
    exit 1
}

errorFileCopy() { # source destination
    echo "########################################## ERROR ##########################################"
    echo "# Failed to copy file '$1' to '$2' (please file a bug on this issue)."
    echo "###########################################################################################"
    exit 1
}

# ######################################################################################
# Script Functions

# ######################################################################################
# Script Logic

echo "####################### FIREBASE CONFIGURATION #######################"
echo "We are currently configuring the firebase using your private key files"
echo "######################################################################"

if [[ "${YYPLATFORM_name}" == "Android" ]]; then

    if [[ ! -f "${YYEXTOPT_FirebaseSetup_jsonFile}" ]]; then
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
        echo "The path to google-services.json file was not configured correctly."
        echo "####################################################################################"
        exit 1
    fi

    mkdir -p "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/" && cp -rf "${YYEXTOPT_FirebaseSetup_jsonFile}" "${YYprojectDir}/extensions/FirebaseSetup/AndroidSource/ProjectFiles/"

elif [[ "${YYPLATFORM_name}" == "iOS" ]]; then

    if [[ ! -f "${YYEXTOPT_FirebaseSetup_plistFile}" ]]; then
        echo "########################## FIREBASE CONFIGURATION (ERROR) ##########################"
	    echo "The path to GoogleServices-Info.plist file was not configured correctly."
        echo "####################################################################################"
        exit 1
    fi

    mkdir -p "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/" && cp -rf "${YYEXTOPT_FirebaseSetup_plistFile}" "${YYprojectDir}/extensions/FirebaseSetup/iOSProjectFiles/"
fi

exit 0
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/scriptUtils.sh"
scriptInit

echo "[FirebaseSetup] Removing staged Firebase build assets."
itemDelete "$SCRIPT_DIR/AndroidSource/ProjectFiles/"
itemDelete "$SCRIPT_DIR/iOSProjectFiles/"
itemDelete "$SCRIPT_DIR/AndroidSource/libs-aar/firebase_messaging_cpp.aar"

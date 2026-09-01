#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/scriptUtils.sh"
scriptInit

echo "[GMFirebaseCore] Removing staged Firebase build assets."
itemDelete "$SCRIPT_DIR/AndroidSource/ProjectFiles/"
itemDelete "$SCRIPT_DIR/iOSProjectFiles/"

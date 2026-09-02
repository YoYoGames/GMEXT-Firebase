cmake_minimum_required(VERSION 3.18)

set(GMFIREBASE_IS_CORE TRUE)

# Optional manual override for standalone Extension Generator builds.
# Example:
#   cmake -S . -B out -DGMFIREBASE_PRODUCT_MODULES_OVERRIDE="auth;firestore"
set(GMFIREBASE_PRODUCT_MODULES_OVERRIDE ""
    CACHE STRING "Explicit Firebase product modules to compile/link into GMFirebaseCore")

# GameMaker's pre-build hook generates this file from the active .yyp resources.
# If no manifest exists (for example a standalone source build), keep the working
# full-SDK behavior as a safe fallback.
set(_GMF_PROJECT_MODULE_FILE
    "${CMAKE_CURRENT_LIST_DIR}/GMFirebaseEnabledModules.cmake")

if(NOT GMFIREBASE_PRODUCT_MODULES_OVERRIDE STREQUAL "")
    set(GMFIREBASE_PRODUCT_MODULES
        "${GMFIREBASE_PRODUCT_MODULES_OVERRIDE}")
    message(STATUS
        "[GMFirebase] Product selection source: manual override")
elseif(EXISTS "${_GMF_PROJECT_MODULE_FILE}")
    include("${_GMF_PROJECT_MODULE_FILE}")
    if(NOT DEFINED GMFIREBASE_PROJECT_MODULES)
        message(FATAL_ERROR
            "${_GMF_PROJECT_MODULE_FILE} did not define GMFIREBASE_PROJECT_MODULES")
    endif()
    set(GMFIREBASE_PRODUCT_MODULES
        "${GMFIREBASE_PROJECT_MODULES}")
    message(STATUS
        "[GMFirebase] Product selection source: GameMaker project manifest")
else()
    set(GMFIREBASE_PRODUCT_MODULES
        "analytics;app_check;auth;database;firestore;functions;installations;messaging;remote_config;storage;ump")
    message(STATUS
        "[GMFirebase] Product selection source: fallback (all supported modules)")
endif()

message(STATUS
    "[GMFirebase] Enabled GameMaker Firebase products: ${GMFIREBASE_PRODUCT_MODULES}")

include("${CMAKE_CURRENT_LIST_DIR}/../cmake/firebase/GMFirebaseModule.cmake")

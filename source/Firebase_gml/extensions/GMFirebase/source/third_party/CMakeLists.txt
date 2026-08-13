cmake_minimum_required(VERSION 3.18)

# =============================================================================
# third_party: wires the vendored Firebase C++ SDK into a single INTERFACE
# target (ext_third_party) for every supported platform.
#
# Unlike FMOD (one library, fmod_core), Firebase ships one static library per
# product module plus a required "app" core library, so this file loops over
# EXT_TP_FIREBASE_MODULES and imports one target per module/platform/config
# combination instead of hand-rolling each one.
# =============================================================================

add_library(ext_third_party INTERFACE)

# -----------------------------------------------------------------------------
# Firebase SDK root
# -----------------------------------------------------------------------------
set(FIREBASE_SDK_ROOT
    ""
    CACHE PATH
          "Path to the Firebase C++ SDK root (folder containing 'include' and 'libs')"
)
if(NOT FIREBASE_SDK_ROOT)
  get_filename_component(
    FIREBASE_SDK_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../../Firebase_sdk"
    ABSOLUTE)
endif()

# firebase_app is always linked (every product module depends on it); the
# product modules below are the ones a consumer can trim.
set(EXT_TP_FIREBASE_MODULES
    "analytics;app_check;auth;database;firestore;functions;installations;messaging;remote_config;storage;ump"
    CACHE STRING "Firebase product modules to link, semicolon-separated")

target_include_directories(ext_third_party
                            INTERFACE "${FIREBASE_SDK_ROOT}/include")

message(STATUS "[third_party] FIREBASE_SDK_ROOT = ${FIREBASE_SDK_ROOT}")
message(STATUS "[third_party] EXT_TP_FIREBASE_MODULES = ${EXT_TP_FIREBASE_MODULES}")

# All Firebase modules are consumed as static libraries on every platform this
# file covers, so there is never a runtime binary to copy - EXT_TP_RUNTIME_DLLS
# stays empty. It is still published for interface parity with the other
# third_party/CMakeLists.txt files in this codebase.
set(_EXT_TP_RUNTIME_DLLS "")

set(_MAP_REL_CONFIGS "Release")

# =============================================================================
# WINDOWS (MSVC/ClangCL) - static .lib per module, split by CRT (MD/MT) and
# arch (x64/x86); Debug/Release both ship as prebuilt binaries.
# =============================================================================
if(WIN32)
  set(EXT_TP_FIREBASE_WINDOWS_CRT
      "MD"
      CACHE STRING "Windows CRT variant to link against: MD or MT")
  set_property(CACHE EXT_TP_FIREBASE_WINDOWS_CRT PROPERTY STRINGS "MD" "MT")

  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(_FIREBASE_WIN_ARCH "x64")
  else()
    set(_FIREBASE_WIN_ARCH "x86")
  endif()

  set(_FIREBASE_WIN_LIB_DIR
      "${FIREBASE_SDK_ROOT}/libs/windows/VS2019/${EXT_TP_FIREBASE_WINDOWS_CRT}/${_FIREBASE_WIN_ARCH}"
  )

  message(STATUS "[third_party] Firebase Windows CRT=${EXT_TP_FIREBASE_WINDOWS_CRT} arch=${_FIREBASE_WIN_ARCH}")

  foreach(_module IN ITEMS "app" ${EXT_TP_FIREBASE_MODULES})
    add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
    set_target_properties(
      firebase_${_module}
      PROPERTIES
        IMPORTED_CONFIGURATIONS "Debug;Release"
        IMPORTED_LOCATION_DEBUG
        "${_FIREBASE_WIN_LIB_DIR}/Debug/firebase_${_module}.lib"
        IMPORTED_LOCATION_RELEASE
        "${_FIREBASE_WIN_LIB_DIR}/Release/firebase_${_module}.lib"
        MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
        MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}")
    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  # Firebase's Windows static libs pull in gRPC/BoringSSL (Firestore/Auth) and
  # need these system libs at link time - required, not optional, per
  # Firebase's own Windows desktop integration guidance.
  target_link_libraries(
    ext_third_party
    INTERFACE advapi32
              ws2_32
              crypt32
              rpcrt4
              bcrypt
              iphlpapi
              psapi
              userenv
              dbghelp
              icu)

# =============================================================================
# APPLE: split iOS/tvOS (xcframeworks) vs macOS (static .a, universal)
# =============================================================================
elseif(APPLE)

  if(EXTGEN_IS_APPLE_MOBILE)
    # ----------------------
    # iOS / tvOS - prebuilt xcframeworks (recommended by Firebase's own Apple
    # integration guidance; Xcode selects the right device/simulator slice).
    # ----------------------
    set(_FIREBASE_XCFRAMEWORKS_DIR "${FIREBASE_SDK_ROOT}/xcframeworks")

    target_link_options(ext_third_party INTERFACE
                         "-F${_FIREBASE_XCFRAMEWORKS_DIR}" "-framework" "firebase")

    foreach(_module IN LISTS EXT_TP_FIREBASE_MODULES)
      target_link_options(ext_third_party INTERFACE "-framework"
                           "firebase_${_module}")
    endforeach()

    # Required by Firebase's iOS/tvOS xcframeworks (gRPC/BoringSSL + platform
    # frameworks Firestore/Auth/Messaging depend on).
    target_link_options(
      ext_third_party
      INTERFACE
      "-framework" "SystemConfiguration"
      "-framework" "Security"
      "-framework" "CoreFoundation"
      "-framework" "Foundation"
      "-lresolv"
      "-lc++")

  else()
    # ----------------------
    # macOS (desktop) - static .a, universal (arm64 + x86_64 fat binary), no
    # arch-specific selection needed.
    # ----------------------
    set(_FIREBASE_MAC_LIB_DIR "${FIREBASE_SDK_ROOT}/libs/darwin/universal")

    foreach(_module IN ITEMS "app" ${EXT_TP_FIREBASE_MODULES})
      add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
      set_target_properties(
        firebase_${_module}
        PROPERTIES IMPORTED_LOCATION
                   "${_FIREBASE_MAC_LIB_DIR}/libfirebase_${_module}.a")
      target_link_libraries(ext_third_party INTERFACE firebase_${_module})
    endforeach()

    target_link_options(
      ext_third_party
      INTERFACE
      "-framework" "SystemConfiguration"
      "-framework" "Security"
      "-framework" "CoreFoundation"
      "-framework" "Foundation"
      "-lresolv"
      "-lc++")
  endif()

# =============================================================================
# ANDROID (per-ABI static .a; Messaging additionally ships an AAR)
# =============================================================================
elseif(ANDROID)
  set(_FIREBASE_ANDROID_LIB_DIR
      "${FIREBASE_SDK_ROOT}/libs/android/${CMAKE_ANDROID_ARCH_ABI}")

  foreach(_module IN ITEMS "app" ${EXT_TP_FIREBASE_MODULES})
    set(_lib_path "${_FIREBASE_ANDROID_LIB_DIR}/libfirebase_${_module}.a")
    if(NOT EXISTS "${_lib_path}")
      message(
        FATAL_ERROR
          "[third_party] Missing Android static lib for ABI ${CMAKE_ANDROID_ARCH_ABI}: ${_lib_path}"
      )
    endif()
    add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
    set_target_properties(firebase_${_module} PROPERTIES IMPORTED_LOCATION
                                                           "${_lib_path}")
    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  # Cloud Messaging's Android support (notification channel handling, the
  # FCM broadcast receiver/service) lives in a Gradle AAR rather than the
  # static .a above - bubble it up the same way the Discord/other templates
  # publish EXT_TP_ANDROID_AAR, so the parent build can add it as a Gradle
  # dependency.
  list(FIND EXT_TP_FIREBASE_MODULES "messaging" _messaging_idx)
  if(NOT _messaging_idx EQUAL -1)
    set(_messaging_aar "${FIREBASE_SDK_ROOT}/libs/android/firebase_messaging_cpp.aar")
    if(NOT EXISTS "${_messaging_aar}")
      message(
        FATAL_ERROR "[third_party] Missing Messaging AAR: ${_messaging_aar}")
    endif()
    set(EXT_TP_ANDROID_AAR
        "${_messaging_aar}"
        PARENT_SCOPE)
  endif()

# =============================================================================
# LINUX (static .a; split by C++ ABI - cxx11 vs legacy - and arch)
# =============================================================================
elseif(UNIX)
  set(EXT_TP_FIREBASE_LINUX_ABI
      "cxx11"
      CACHE STRING "Linux C++ ABI variant to link against: cxx11 or legacy")
  set_property(CACHE EXT_TP_FIREBASE_LINUX_ABI PROPERTY STRINGS "cxx11"
                                                          "legacy")

  if(CMAKE_SYSTEM_PROCESSOR MATCHES "i[3-6]86")
    set(_FIREBASE_LNX_ARCH "i386")
  else()
    set(_FIREBASE_LNX_ARCH "x86_64")
  endif()

  set(_FIREBASE_LNX_LIB_DIR
      "${FIREBASE_SDK_ROOT}/libs/linux/${_FIREBASE_LNX_ARCH}/${EXT_TP_FIREBASE_LINUX_ABI}"
  )

  message(STATUS "[third_party] Firebase Linux arch=${_FIREBASE_LNX_ARCH} abi=${EXT_TP_FIREBASE_LINUX_ABI}")

  foreach(_module IN ITEMS "app" ${EXT_TP_FIREBASE_MODULES})
    add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
    set_target_properties(
      firebase_${_module}
      PROPERTIES IMPORTED_LOCATION
                 "${_FIREBASE_LNX_LIB_DIR}/libfirebase_${_module}.a")
    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  target_link_libraries(ext_third_party INTERFACE pthread dl rt)
endif()

# =============================================================================
# (OPTIONAL) Console SDK hooks (uncomment and point to vendor toolchains) -
# Firebase does not ship console SDKs; kept for parity with the other
# third_party/CMakeLists.txt files in this codebase.
# =============================================================================
# if(CMAKE_SYSTEM_NAME STREQUAL "ORBIS") # PS4: add imported lib and link;
# publish runtime if needed elseif(CMAKE_SYSTEM_NAME STREQUAL "Prospero") # PS5:
# similar elseif(CMAKE_SYSTEM_NAME STREQUAL "NintendoSwitch" OR DEFINED
# ENV{NINTENDO_SDK_ROOT}) # Switch: similar endif()

# =============================================================================
# Bubble up runtime list to parent
# =============================================================================
set(EXT_TP_RUNTIME_DLLS
    "${_EXT_TP_RUNTIME_DLLS}"
    PARENT_SCOPE)

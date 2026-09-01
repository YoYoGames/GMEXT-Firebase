cmake_minimum_required(VERSION 3.18)

# =============================================================================
# Firebase C++ SDK integration for GMFirebaseStorage.
#
# Pattern intentionally mirrors the working GMEXT-EpicOnlineServices extension:
#   * GMFirebaseStorage/source/third_party owns SDK/platform integration.
#   * generator-owned src/CMakeLists.txt is NOT edited.
#   * portable src/native/*.cpp is injected here for Android and the iOS native
#     framework flavour, because Extension Generator does not add it there.
#   * iOS compiles the extension against headers only; Firebase C++ frameworks
#     and their Apple SDK dependencies are linked by the final GameMaker Xcode
#     project.
# =============================================================================

add_library(ext_third_party INTERFACE)

set(_EXT_TP_RUNTIME_DLLS "")
set(_MAP_REL_CONFIGS "Release")

function(_ext_tp_require_file _path _description _root_var_name)
  if(NOT EXISTS "${_path}")
    message(FATAL_ERROR
      "Missing ${_description}:\n"
      "  ${_path}\n"
      "Check ${_root_var_name}:\n"
      "  ${${_root_var_name}}")
  endif()
endfunction()

# -----------------------------------------------------------------------------
# Firebase SDK root
# -----------------------------------------------------------------------------
get_filename_component(
  _FIREBASE_SDK_ROOT_DEFAULT
  "${CMAKE_CURRENT_LIST_DIR}/../../../../../Firebase_sdk"
  ABSOLUTE)

# Seed the cache from the repo-relative default.  Older GMFirebase build
# directories may already contain FIREBASE_SDK_ROOT:PATH= from the previous
# integration; CMake would otherwise preserve that stale empty cache value and
# turn paths below into /include/... .  Keep any explicit non-empty override.
if(NOT FIREBASE_SDK_ROOT)
  set(FIREBASE_SDK_ROOT
      "${_FIREBASE_SDK_ROOT_DEFAULT}"
      CACHE PATH "Path to the Firebase C++ SDK root" FORCE)
else()
  set(FIREBASE_SDK_ROOT
      "${FIREBASE_SDK_ROOT}"
      CACHE PATH "Path to the Firebase C++ SDK root")
endif()

_ext_tp_require_file(
  "${FIREBASE_SDK_ROOT}/include/firebase/app.h"
  "Firebase C++ header"
  FIREBASE_SDK_ROOT)

target_include_directories(ext_third_party
  INTERFACE "${FIREBASE_SDK_ROOT}/include")

# firebase_app is mandatory and is deliberately linked LAST, as required by
# Firebase's C++ integration guidance.
set(EXT_TP_FIREBASE_MODULES
    "storage"
    CACHE STRING "Firebase product modules to link, semicolon-separated" FORCE)

message(STATUS "[third_party] FIREBASE_SDK_ROOT = ${FIREBASE_SDK_ROOT}")
message(STATUS "[third_party] EXT_TP_FIREBASE_MODULES = ${EXT_TP_FIREBASE_MODULES}")

# -----------------------------------------------------------------------------
# Platform classification, using the same style as the working EOS extension.
# -----------------------------------------------------------------------------
set(_FIREBASE_IS_IOS FALSE)
set(_FIREBASE_IS_TVOS FALSE)
set(_FIREBASE_IS_MACOS FALSE)

if(APPLE)
  if(CMAKE_OSX_SYSROOT MATCHES "iphone" OR CMAKE_SYSTEM_NAME STREQUAL "iOS")
    set(_FIREBASE_IS_IOS TRUE)
  elseif(CMAKE_OSX_SYSROOT MATCHES "appletv" OR CMAKE_SYSTEM_NAME STREQUAL "tvOS")
    set(_FIREBASE_IS_TVOS TRUE)
  else()
    set(_FIREBASE_IS_MACOS TRUE)
  endif()
endif()

# =============================================================================
# Shared native implementation on mobile (EOS-proven Extension Generator pattern)
# =============================================================================
# The generator-owned src/CMakeLists.txt compiles src/native for desktop, but
# does not cover Android or the iOS NATIVE framework flavour. Keep that generated
# file untouched and inject our portable implementation from third_party.
if(ANDROID OR (_FIREBASE_IS_IOS AND EXT_APPLE_NATIVE_FRAMEWORK))
  file(GLOB _FIREBASE_SRC_NATIVE CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/../src/native/*.cpp")

  if(_FIREBASE_SRC_NATIVE)
    target_sources(${EXT_MAIN_TARGET} PRIVATE ${_FIREBASE_SRC_NATIVE})
  endif()
endif()

# =============================================================================
# WINDOWS - keep the existing working static-library layout/config mapping.
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
      "${FIREBASE_SDK_ROOT}/libs/windows/VS2019/${EXT_TP_FIREBASE_WINDOWS_CRT}/${_FIREBASE_WIN_ARCH}")

  message(STATUS
    "[third_party] Firebase Windows CRT=${EXT_TP_FIREBASE_WINDOWS_CRT} arch=${_FIREBASE_WIN_ARCH}")

  # Product libraries first.
  foreach(_module IN LISTS EXT_TP_FIREBASE_MODULES)
    _ext_tp_require_file(
      "${_FIREBASE_WIN_LIB_DIR}/Debug/firebase_${_module}.lib"
      "Firebase Windows Debug library firebase_${_module}.lib"
      FIREBASE_SDK_ROOT)
    _ext_tp_require_file(
      "${_FIREBASE_WIN_LIB_DIR}/Release/firebase_${_module}.lib"
      "Firebase Windows Release library firebase_${_module}.lib"
      FIREBASE_SDK_ROOT)

    add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
    set_target_properties(firebase_${_module} PROPERTIES
      IMPORTED_CONFIGURATIONS "Debug;Release"
      IMPORTED_LOCATION_DEBUG
        "${_FIREBASE_WIN_LIB_DIR}/Debug/firebase_${_module}.lib"
      IMPORTED_LOCATION_RELEASE
        "${_FIREBASE_WIN_LIB_DIR}/Release/firebase_${_module}.lib"
      MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
      MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}")

    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  # firebase_app LAST.
  _ext_tp_require_file(
    "${_FIREBASE_WIN_LIB_DIR}/Debug/firebase_app.lib"
    "Firebase Windows Debug library firebase_app.lib"
    FIREBASE_SDK_ROOT)
  _ext_tp_require_file(
    "${_FIREBASE_WIN_LIB_DIR}/Release/firebase_app.lib"
    "Firebase Windows Release library firebase_app.lib"
    FIREBASE_SDK_ROOT)

  add_library(firebase_app STATIC IMPORTED GLOBAL)
  set_target_properties(firebase_app PROPERTIES
    IMPORTED_CONFIGURATIONS "Debug;Release"
    IMPORTED_LOCATION_DEBUG "${_FIREBASE_WIN_LIB_DIR}/Debug/firebase_app.lib"
    IMPORTED_LOCATION_RELEASE "${_FIREBASE_WIN_LIB_DIR}/Release/firebase_app.lib"
    MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
    MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}")
  target_link_libraries(ext_third_party INTERFACE firebase_app)

  # Union of the system libraries required by the Firebase products enabled in
  # this extension. ole32/shell32 are required by Firestore/Functions and were
  # missing from the previous file.
  target_link_libraries(ext_third_party INTERFACE
    advapi32
    ws2_32
    crypt32
    rpcrt4
    ole32
    shell32
    bcrypt
    iphlpapi
    psapi
    userenv
    dbghelp
    icu)

# =============================================================================
# ANDROID - Firebase C++ static .a libraries are linked into libGMFirebaseStorage.so.
# Java/Kotlin Firebase SDK dependencies remain a Gradle concern in the final GM
# Android project, exactly like EOS keeps its Java layer separate from CMake.
# =============================================================================
elseif(ANDROID)
  set(_FIREBASE_ANDROID_LIB_DIR
      "${FIREBASE_SDK_ROOT}/libs/android/${CMAKE_ANDROID_ARCH_ABI}")

  message(STATUS
    "[third_party] Firebase Android ABI=${CMAKE_ANDROID_ARCH_ABI}")

  # Product modules do not create firebase::App and therefore keep ExtGen's
  # generated JNI_OnLoad unchanged. GMFirebaseCore owns JavaVM/App bootstrap.

  foreach(_module IN LISTS EXT_TP_FIREBASE_MODULES)
    set(_lib_path "${_FIREBASE_ANDROID_LIB_DIR}/libfirebase_${_module}.a")
    _ext_tp_require_file(
      "${_lib_path}"
      "Firebase Android library libfirebase_${_module}.a"
      FIREBASE_SDK_ROOT)

    add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
    set_target_properties(firebase_${_module} PROPERTIES
      IMPORTED_LOCATION "${_lib_path}")
    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  # firebase_app LAST.
  set(_firebase_app_path "${_FIREBASE_ANDROID_LIB_DIR}/libfirebase_app.a")
  _ext_tp_require_file(
    "${_firebase_app_path}"
    "Firebase Android library libfirebase_app.a"
    FIREBASE_SDK_ROOT)

  add_library(firebase_app STATIC IMPORTED GLOBAL)
  set_target_properties(firebase_app PROPERTIES
    IMPORTED_LOCATION "${_firebase_app_path}")
  target_link_libraries(ext_third_party INTERFACE firebase_app)

  # Messaging includes an additional Java-side AAR in the C++ SDK package.
  list(FIND EXT_TP_FIREBASE_MODULES "messaging" _messaging_idx)
  if(NOT _messaging_idx EQUAL -1)
    set(_messaging_aar
        "${FIREBASE_SDK_ROOT}/libs/android/firebase_messaging_cpp.aar")
    _ext_tp_require_file(
      "${_messaging_aar}"
      "Firebase Messaging Android AAR"
      FIREBASE_SDK_ROOT)

    set(EXT_TP_ANDROID_AAR
        "${_messaging_aar}"
        PARENT_SCOPE)
  endif()

  target_link_libraries(ext_third_party INTERFACE dl)

  message(STATUS
    "[third_party] Firebase Android Gradle helper = ${FIREBASE_SDK_ROOT}/Android/firebase_dependencies.gradle")

# =============================================================================
# APPLE
# =============================================================================
elseif(APPLE)
  # ---------------------------------------------------------------------------
  # iOS / tvOS
  # ---------------------------------------------------------------------------
  if(_FIREBASE_IS_IOS OR _FIREBASE_IS_TVOS)
    # Follow the working EOS extension architecture: this CMake stage creates the
    # extension static archive/xcframework and therefore only needs Firebase C++
    # headers. The final GameMaker Xcode project must link firebase.xcframework,
    # the selected firebase_<product>.xcframeworks, and the matching Firebase
    # Apple SDK dependencies (Pods/SPM).
    #
    # Deliberately DO NOT attempt `-F <xcframework-root> -framework firebase`:
    # the actual .framework is nested inside the selected XCFramework slice and
    # final Xcode-project integration is the correct place to resolve it.
    if(_FIREBASE_IS_IOS)
      message(STATUS
        "[third_party] Firebase iOS: headers only during native extension archive; final Xcode project links Firebase frameworks/dependencies")
    else()
      message(STATUS
        "[third_party] Firebase tvOS: headers only during native extension archive; final Xcode project links Firebase frameworks/dependencies")
    endif()

  # ---------------------------------------------------------------------------
  # macOS desktop
  # ---------------------------------------------------------------------------
  else()
    set(_FIREBASE_MAC_LIB_DIR
        "${FIREBASE_SDK_ROOT}/libs/darwin/universal")

    foreach(_module IN LISTS EXT_TP_FIREBASE_MODULES)
      set(_lib_path "${_FIREBASE_MAC_LIB_DIR}/libfirebase_${_module}.a")
      _ext_tp_require_file(
        "${_lib_path}"
        "Firebase macOS library libfirebase_${_module}.a"
        FIREBASE_SDK_ROOT)

      add_library(firebase_${_module} STATIC IMPORTED GLOBAL)
      set_target_properties(firebase_${_module} PROPERTIES
        IMPORTED_LOCATION "${_lib_path}")
      target_link_libraries(ext_third_party INTERFACE firebase_${_module})
    endforeach()

    # firebase_app LAST.
    set(_firebase_app_path "${_FIREBASE_MAC_LIB_DIR}/libfirebase_app.a")
    _ext_tp_require_file(
      "${_firebase_app_path}"
      "Firebase macOS library libfirebase_app.a"
      FIREBASE_SDK_ROOT)

    add_library(firebase_app STATIC IMPORTED GLOBAL)
    set_target_properties(firebase_app PROPERTIES
      IMPORTED_LOCATION "${_firebase_app_path}")
    target_link_libraries(ext_third_party INTERFACE firebase_app)

    # Firebase 13.11 desktop dependency set documented for macOS.
    target_link_libraries(ext_third_party INTERFACE
      pthread
      gssapi_krb5)

    target_link_options(ext_third_party INTERFACE
      "-framework" "CoreFoundation"
      "-framework" "Foundation"
      "-framework" "GSS"
      "-framework" "Security"
      "-framework" "SystemConfiguration"
      "-lresolv")
  endif()

# =============================================================================
# LINUX desktop
# =============================================================================
elseif(UNIX)
  # The prebuilt Firebase Linux .a files shipped in the SDK are not suitable for
  # embedding into another shared object on x86_64: they contain R_X86_64_PC32
  # relocations that ld rejects while creating libGMFirebaseStorage.so.
  #
  # Linux therefore uses a Firebase C++ source checkout.  Firebase and its
  # CMake-built dependencies are compiled with PIC and linked as CMake targets.

  if(CMAKE_SYSTEM_PROCESSOR MATCHES "i[3-6]86")
    set(_FIREBASE_LNX_ARCH "i386")
  else()
    set(_FIREBASE_LNX_ARCH "x86_64")
  endif()

  # ---------------------------------------------------------------------------
  # Linux libstdc++ ABI
  # ---------------------------------------------------------------------------
  # Firebase's desktop Linux source build uses the legacy libstdc++ ABI
  # (_GLIBCXX_USE_CXX11_ABI=0).  Its external-dependency configure step also
  # propagates ABI=0.  GMFirebase must use the same ABI or std::string /
  # std::stringstream symbols will not match at link time.
  #
  # This setting is Linux-source-build specific; Windows/Android/macOS/iOS are
  # unaffected.
  set(_FIREBASE_LINUX_ABI_VALUE 0)

  target_compile_definitions(ext_third_party INTERFACE
    _GLIBCXX_USE_CXX11_ABI=${_FIREBASE_LINUX_ABI_VALUE})

  # ---------------------------------------------------------------------------
  # Firebase source checkout
  # ---------------------------------------------------------------------------
  # Linux builds Firebase C++ from source with PIC.
  #
  # Keep the source checkout on the native Linux filesystem rather than under
  # /media/sf_* so the Firebase/Firestore build can freely create symlinks,
  # virtual environments, and other filesystem objects.
  #
  # The source version must match the packaged Firebase C++ SDK version.
  set(_FIREBASE_CPP_VERSION "v13.11.0")

  if(DEFINED ENV{HOME} AND NOT "$ENV{HOME}" STREQUAL "")
    set(_FIREBASE_CPP_SOURCE_ROOT_DEFAULT
        "$ENV{HOME}/.cache/GMFirebase/firebase_cpp_source/${_FIREBASE_CPP_VERSION}")
  else()
    set(_FIREBASE_CPP_SOURCE_ROOT_DEFAULT
        "/tmp/GMFirebase/firebase_cpp_source/${_FIREBASE_CPP_VERSION}")
  endif()

  set(FIREBASE_CPP_SOURCE_ROOT
      "${_FIREBASE_CPP_SOURCE_ROOT_DEFAULT}"
      CACHE PATH "Path to Firebase C++ SDK source checkout used on Linux")

  # Automatically obtain the matching Firebase C++ source checkout when it is
  # not already available.  Once cloned, subsequent builds reuse the cached
  # checkout and do not require another download.
  if(NOT EXISTS "${FIREBASE_CPP_SOURCE_ROOT}/CMakeLists.txt")
    message(STATUS
      "[third_party] Firebase Linux source checkout not found; downloading ${_FIREBASE_CPP_VERSION}")

    find_package(Git REQUIRED)

    get_filename_component(
      _FIREBASE_CPP_SOURCE_PARENT
      "${FIREBASE_CPP_SOURCE_ROOT}"
      DIRECTORY)

    file(MAKE_DIRECTORY "${_FIREBASE_CPP_SOURCE_PARENT}")

    # Remove an incomplete checkout from a previously interrupted clone.
    if(EXISTS "${FIREBASE_CPP_SOURCE_ROOT}")
      file(REMOVE_RECURSE "${FIREBASE_CPP_SOURCE_ROOT}")
    endif()

    execute_process(
      COMMAND
        "${GIT_EXECUTABLE}"
        clone
        --branch "${_FIREBASE_CPP_VERSION}"
        --depth 1
        https://github.com/firebase/firebase-cpp-sdk.git
        "${FIREBASE_CPP_SOURCE_ROOT}"
      RESULT_VARIABLE _FIREBASE_GIT_RESULT
    )

    if(NOT _FIREBASE_GIT_RESULT EQUAL 0)
      message(FATAL_ERROR
        "Failed to download Firebase C++ SDK ${_FIREBASE_CPP_VERSION}.\n"
        "Git result: ${_FIREBASE_GIT_RESULT}\n"
        "Target directory:\n"
        "  ${FIREBASE_CPP_SOURCE_ROOT}")
    endif()
  endif()

  _ext_tp_require_file(
    "${FIREBASE_CPP_SOURCE_ROOT}/CMakeLists.txt"
    "Firebase C++ source checkout CMakeLists.txt"
    FIREBASE_CPP_SOURCE_ROOT)

  message(STATUS
    "[third_party] Firebase Linux source=${FIREBASE_CPP_SOURCE_ROOT}")

  # ---------------------------------------------------------------------------
  # Firebase binary/build tree
  # ---------------------------------------------------------------------------
  # IMPORTANT: do not put Firebase's binary tree under /media/sf_* when using a
  # VirtualBox shared folder.  Firestore creates Python virtualenvs and other
  # dependencies that require symbolic links (for example lib64 -> lib), which
  # vboxsf commonly rejects with EPERM.
  #
  # Keep the GameMaker/GMFirebase build wherever you like; only Firebase's
  # add_subdirectory() binary tree is redirected to a native Linux filesystem.
  if(DEFINED ENV{HOME} AND NOT "$ENV{HOME}" STREQUAL "")
    set(_FIREBASE_CPP_BINARY_ROOT_DEFAULT
        "$ENV{HOME}/.cache/GMFirebase/firebase_cpp/${_FIREBASE_LNX_ARCH}/abi0/${CMAKE_BUILD_TYPE}")
  else()
    set(_FIREBASE_CPP_BINARY_ROOT_DEFAULT
        "/tmp/GMFirebase/firebase_cpp/${_FIREBASE_LNX_ARCH}/abi0/${CMAKE_BUILD_TYPE}")
  endif()

  set(FIREBASE_CPP_BINARY_ROOT
      "${_FIREBASE_CPP_BINARY_ROOT_DEFAULT}"
      CACHE PATH "Native Linux build directory for Firebase C++ source")

  if(FIREBASE_CPP_BINARY_ROOT MATCHES "^/media/sf_")
    message(FATAL_ERROR
      "FIREBASE_CPP_BINARY_ROOT is inside a VirtualBox shared folder:\n"
      "  ${FIREBASE_CPP_BINARY_ROOT}\n"
      "Firestore's build creates symbolic links and Python virtualenvs there.\n"
      "Use a native Linux path, for example:\n"
      "  $ENV{HOME}/.cache/GMFirebase/firebase_cpp")
  endif()

  file(MAKE_DIRECTORY "${FIREBASE_CPP_BINARY_ROOT}")

  message(STATUS
    "[third_party] Firebase Linux arch=${_FIREBASE_LNX_ARCH} abi=legacy(0)")
  message(STATUS
    "[third_party] Firebase Linux source=${FIREBASE_CPP_SOURCE_ROOT}")
  message(STATUS
    "[third_party] Firebase Linux binary=${FIREBASE_CPP_BINARY_ROOT}")
  message(STATUS
    "[third_party] Firebase Linux: building Firebase source with PIC")

  # ---------------------------------------------------------------------------
  # Build Firebase source as PIC
  # ---------------------------------------------------------------------------
  # Save/restore the parent values.  add_subdirectory() inherits these settings,
  # and Firebase's own ExternalProject dependency builds receive PIC as well.
  set(_FIREBASE_SAVED_PIC "${CMAKE_POSITION_INDEPENDENT_CODE}")
  set(_FIREBASE_SAVED_C_FLAGS "${CMAKE_C_FLAGS}")
  set(_FIREBASE_SAVED_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
  set(CMAKE_CXX_FLAGS
      "${CMAKE_CXX_FLAGS} -D_GLIBCXX_USE_CXX11_ABI=${_FIREBASE_LINUX_ABI_VALUE}")

  # Firebase's Linux desktop CMake currently injects the GCC-only
  # -Wno-maybe-uninitialized flag.  Clang diagnoses that option as unknown.
  # Most Firebase targets merely warn, but Snappy enables -Werror and therefore
  # turns the diagnostic into a hard build failure.  Suppress only the
  # "unknown warning option" diagnostic for the Firebase subtree; do not disable
  # -Werror or any real compiler warning.
  if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_C_FLAGS
        "${CMAKE_C_FLAGS} -Wno-unknown-warning-option")
    set(CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} -Wno-unknown-warning-option")
    message(STATUS
      "[third_party] Firebase Linux: suppressing Clang unknown-warning-option diagnostics")
  endif()

  # Firebase desktop's app/rest/zlibwrapper.h includes "zlib/zlib.h".
  # On Ubuntu the development header is exposed as <zlib.h>. Keep the Firebase
  # source checkout untouched by generating a build-local compatibility header
  # with the layout Firebase expects, then expose it to the Firebase subtree.
  set(_FIREBASE_COMPAT_INCLUDE
      "${FIREBASE_CPP_BINARY_ROOT}/compat_include")

  file(MAKE_DIRECTORY
      "${_FIREBASE_COMPAT_INCLUDE}/zlib")

  file(WRITE
      "${_FIREBASE_COMPAT_INCLUDE}/zlib/zlib.h"
      "#pragma once\n#include <zlib.h>\n")

  include_directories(
      BEFORE SYSTEM
      "${_FIREBASE_COMPAT_INCLUDE}")

  message(STATUS
    "[third_party] Firebase Linux: compatibility include=${_FIREBASE_COMPAT_INCLUDE}")

  # Firebase's desktop app target links a dependency named "zlibstatic".
  # In the integrated source build that name is not a target in this parent
  # CMake graph, so CMake otherwise emits a literal "-lzlibstatic" at the final
  # libGMFirebaseStorage.so link. Ubuntu provides zlib as the normal system "z" library
  # (and Firestore/cURL already link it), so provide the expected target name as
  # a build-system compatibility shim. No Firebase source files are modified.
  if(NOT TARGET zlibstatic)
    add_library(zlibstatic INTERFACE)
    target_link_libraries(zlibstatic INTERFACE z)
    message(STATUS
      "[third_party] Firebase Linux: mapping zlibstatic target to system zlib (-lz)")
  endif()

  add_subdirectory(
    "${FIREBASE_CPP_SOURCE_ROOT}"
    "${FIREBASE_CPP_BINARY_ROOT}"
    EXCLUDE_FROM_ALL)

  set(CMAKE_C_FLAGS "${_FIREBASE_SAVED_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${_FIREBASE_SAVED_CXX_FLAGS}")
  set(CMAKE_POSITION_INDEPENDENT_CODE "${_FIREBASE_SAVED_PIC}")

  # ---------------------------------------------------------------------------
  # Firebase products
  # ---------------------------------------------------------------------------
  # Link the actual Firebase CMake targets so their transitive dependencies are
  # retained.  Product targets first, firebase_app last.
  foreach(_module IN LISTS EXT_TP_FIREBASE_MODULES)
    if(NOT TARGET firebase_${_module})
      message(FATAL_ERROR
        "Firebase Linux source checkout does not provide target "
        "'firebase_${_module}'.\n"
        "Source root:\n  ${FIREBASE_CPP_SOURCE_ROOT}\n"
        "Make sure the checkout matches the Firebase SDK version used by "
        "GMFirebase.")
    endif()

    target_link_libraries(ext_third_party INTERFACE firebase_${_module})
  endforeach()

  if(NOT TARGET firebase_app)
    message(FATAL_ERROR
      "Firebase Linux source checkout does not provide target 'firebase_app'.\n"
      "Source root:\n  ${FIREBASE_CPP_SOURCE_ROOT}")
  endif()

  target_link_libraries(ext_third_party INTERFACE firebase_app)

  # Auth / Remote Config desktop support uses libsecret on Linux.
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(LIBSECRET REQUIRED IMPORTED_TARGET libsecret-1)

  target_link_libraries(ext_third_party INTERFACE
    PkgConfig::LIBSECRET
    pthread
    dl
    rt)

  # Firebase is private implementation detail of libGMFirebaseStorage.so.  Hide symbols
  # originating from static archives while preserving GMFirebase's own exports.
  target_link_options(ext_third_party INTERFACE
    "LINKER:--exclude-libs,ALL")
endif()

# =============================================================================
# Bubble up runtime list to parent.
# Firebase itself is statically linked in the native extension on desktop and
# Android, so there are no Firebase runtime DLL/.so/.dylib files to stage here.
# =============================================================================
set(EXT_TP_RUNTIME_DLLS
    "${_EXT_TP_RUNTIME_DLLS}"
    PARENT_SCOPE)
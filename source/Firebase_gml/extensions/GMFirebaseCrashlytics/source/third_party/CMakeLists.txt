cmake_minimum_required(VERSION 3.18)

# =============================================================================
# third_party template (production-ready) - Single INTERFACE target:
# ext_third_party - Per-platform imported libs with sensible defaults - Easy
# toggles for Apple Framework/XCFramework vs .dylib - Android AAR (Prefab) or
# raw per-ABI .so; auto-extract with stamp - Publishes: * EXT_TP_RUNTIME_DLLS
# (list of runtime binaries the parent may copy) * EXT_TP_ANDROID_AAR   (aar
# path if consumed; parent can add Gradle dep) - Comment/uncomment “OPTIONAL
# SECTIONS” to fit your SDK
# =============================================================================

# -----------------------------------------------------------------------------
# Core "bag of usage requirements" your main target links to
# -----------------------------------------------------------------------------
add_library(ext_third_party INTERFACE)

# -----------------------------------------------------------------------------
# SDK root + generic knobs
# -----------------------------------------------------------------------------
set(SDK_ROOT
    ""
    CACHE PATH "Path to the SDK root (override as needed)")
# You can also support env vars by defaulting from environment if unset:
if(NOT SDK_ROOT)
  # Example default: third_party/../../../../../discord_social_sdk
  get_filename_component(
    SDK_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../../discord_social_sdk"
    ABSOLUTE)
endif()

# Basename without prefixes (lib) or suffixes (.so/.dylib/.dll); adapt as
# needed.
set(SDK_BASENAME
    "discord_partner_sdk"
    CACHE STRING "Base name of the third-party library")

# Include subdir under SDK_ROOT (set to empty if headers are flat at root)
set(SDK_INCLUDE_SUBDIR
    "include"
    CACHE STRING "Include subfolder relative to SDK_ROOT")

# Common include directory wiring (platform-gated where it matters)
target_include_directories(
  ext_third_party
  INTERFACE $<$<BOOL:${SDK_INCLUDE_SUBDIR}>:${SDK_ROOT}/${SDK_INCLUDE_SUBDIR}>
            $<$<NOT:$<BOOL:${SDK_INCLUDE_SUBDIR}>>:${SDK_ROOT}>)

# Common compile defs (adjust or remove)
target_compile_definitions(ext_third_party INTERFACE HAVE_THIRDPARTY_FEATURE=1)

# List of runtime files to bubble up to parent
set(_EXT_TP_RUNTIME_DLLS "")

# Helper: map single-configs to Release
set(_MAP_REL_CONFIGS "Release")
# Helper macro to append runtime(s)
function(_ext_tp_append_runtime)
  foreach(_f IN LISTS ARGN)
    if(_f)
      list(APPEND _EXT_TP_RUNTIME_DLLS "${_f}")
    endif()
  endforeach()
  set(_EXT_TP_RUNTIME_DLLS
      "${_EXT_TP_RUNTIME_DLLS}"
      PARENT_SCOPE)
endfunction()

message(STATUS "[third_party] SDK_ROOT = ${SDK_ROOT}")
message(STATUS "[third_party] SDK_BASENAME = ${SDK_BASENAME}")

# =============================================================================
# WINDOWS (MSVC/ClangCL)
# =============================================================================
if(WIN32)
  option(EXT_TP_WINDOWS_USE_SHARED "Link prebuilt .so on Windows" OFF)

  if(EXT_TP_WINDOWS_USE_SHARED)
    # Layout knobs; adjust to your SDK’s folder layout.
    set(SDK_WIN_LIB_DEBUG
        "${SDK_ROOT}/lib/debug/${SDK_BASENAME}.lib"
        CACHE FILEPATH "Win import lib (Debug)")
    set(SDK_WIN_LIB_RELEASE
        "${SDK_ROOT}/lib/release/${SDK_BASENAME}.lib"
        CACHE FILEPATH "Win import lib (Release)")
    set(SDK_WIN_DLL_DEBUG
        "${SDK_ROOT}/bin/debug/${SDK_BASENAME}.dll"
        CACHE FILEPATH "Win runtime DLL (Debug)")
    set(SDK_WIN_DLL_RELEASE
        "${SDK_ROOT}/bin/release/${SDK_BASENAME}.dll"
        CACHE FILEPATH "Win runtime DLL (Release)")

    add_library(${SDK_BASENAME}_win SHARED IMPORTED GLOBAL)
    set_target_properties(
      ${SDK_BASENAME}_win
      PROPERTIES
        IMPORTED_CONFIGURATIONS "Debug;Release"
        IMPORTED_IMPLIB_DEBUG "${SDK_WIN_LIB_DEBUG}"
        IMPORTED_IMPLIB_RELEASE "${SDK_WIN_LIB_RELEASE}"
        IMPORTED_LOCATION_DEBUG "${SDK_WIN_DLL_DEBUG}"
        IMPORTED_LOCATION_RELEASE "${SDK_WIN_DLL_RELEASE}"
        MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
        MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}"
        INTERFACE_INCLUDE_DIRECTORIES
        "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")

    # OPTIONAL SECT.: system libs (uncomment if SDK needs them)
    # target_link_libraries(${SDK_BASENAME}_win INTERFACE ws2_32 user32
    # advapi32)

    # ext_third_party consumes it
    target_link_libraries(ext_third_party INTERFACE ${SDK_BASENAME}_win)

    # Publish runtime dlls (parent may copy post-build)
    _ext_tp_append_runtime(
      $<$<CONFIG:Debug>:${SDK_WIN_DLL_DEBUG}>
      $<$<OR:$<CONFIG:Release>,$<CONFIG:RelWithDebInfo>,$<CONFIG:MinSizeRel>>:${SDK_WIN_DLL_RELEASE}>
    )
  endif()
# =============================================================================
# APPLE: split macOS vs iOS/tvOS
# =============================================================================
elseif(APPLE)

  # ----------------------
  # iOS / tvOS (mobile)
  # ----------------------
  if((CMAKE_OSX_SYSROOT MATCHES "iphone") OR (CMAKE_OSX_SYSROOT MATCHES "appletv"))
    # Choose either xcframework/framework or static .a for mobile
    option(EXT_TP_IOS_USE_XCFRAMEWORK
           "iOS/tvOS: link (XC)Framework via -F/-framework" OFF)
    option(EXT_TP_IOS_USE_STATIC "iOS/tvOS: link static .a" OFF)

    # Common defaults; feel free to tweak
    if(CMAKE_SYSTEM_NAME STREQUAL "iOS")
      set(_PLAT_NAME "ios")
      set(_IOS_FRAME_DIR_DEFAULT
          "${SDK_ROOT}/lib/release/discord_partner_sdk.xcframework"
      )# folder that contains Foo.xcframework or Foo.framework
      set(_IOS_FRAME_NAME "discord_partner_sdk")
      set(_IOS_HEADERS_DEFAULT "${SDK_ROOT}/include")
      set(_IOS_STATIC_DEFAULT "${SDK_ROOT}/lib/release/lib${SDK_BASENAME}.a")
    else()
      set(_PLAT_NAME "tvos")
      set(_IOS_FRAME_DIR_DEFAULT
          "${SDK_ROOT}/lib/release/discord_partner_sdk.xcframework")
      set(_IOS_FRAME_NAME "discord_partner_sdk")
      set(_IOS_HEADERS_DEFAULT "${SDK_ROOT}/include")
      set(_IOS_STATIC_DEFAULT "${SDK_ROOT}/lib/release/lib${SDK_BASENAME}.a")
    endif()

    if(EXT_TP_IOS_USE_XCFRAMEWORK)
      # If you have an .xcframework (recommended), just add its parent dir to -F
      # and use -framework Foo Xcode will pick the proper slice (device/sim,
      # arch) automatically.
      set(SDK_IOS_FRAMEWORK_DIR
          "${_IOS_FRAME_DIR_DEFAULT}"
          CACHE PATH "iOS/tvOS -F search path to (XC)Framework")
      set(SDK_IOS_FRAMEWORK_NAME
          "${_IOS_FRAME_NAME}"
          CACHE STRING "iOS/tvOS framework name (without extension)")
      target_link_options(
        ext_third_party INTERFACE "-F${SDK_IOS_FRAMEWORK_DIR}" "-framework"
        "${SDK_IOS_FRAMEWORK_NAME}")
      # If the vendor gives extra Apple frameworks you must link, add them here:
      # target_link_options(ext_third_party INTERFACE "-framework"
      # "AVFoundation" "-framework" "AudioToolbox")
    endif()

    if(EXT_TP_IOS_USE_STATIC)
      # Static import: your vendor must provide an iOS/tvOS static library (NOT
      # macOS!)
      set(SDK_IOS_STATIC_A
          "${_IOS_STATIC_DEFAULT}"
          CACHE FILEPATH "iOS/tvOS static .a")
      if(NOT EXISTS "${SDK_IOS_STATIC_A}")
        message(
          FATAL_ERROR
            "[third_party] Missing ${_PLAT_NAME} static library: ${SDK_IOS_STATIC_A}"
        )
      endif()
      add_library(${SDK_BASENAME}_${_PLAT_NAME}_static STATIC IMPORTED GLOBAL)
      set_target_properties(
        ${SDK_BASENAME}_${_PLAT_NAME}_static
        PROPERTIES
          IMPORTED_LOCATION "${SDK_IOS_STATIC_A}"
          INTERFACE_INCLUDE_DIRECTORIES
          "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
      target_link_libraries(ext_third_party
                            INTERFACE ${SDK_BASENAME}_${_PLAT_NAME}_static)
      # Add required Apple frameworks when linking a static vendor lib, e.g.:
      # target_link_options(ext_third_party INTERFACE "-framework" "Foundation"
      # "-framework" "Security")
    endif()

  # ----------------------
  # macOS (desktop)
  # ----------------------
  else()
    # Choose either a macOS .dylib or a (XC)Framework
    option(EXT_TP_MAC_USE_DYLIB "macOS: link prebuilt .dylib" OFF)
    option(EXT_TP_MAC_USE_FRAMEWORK
           "macOS: link Framework/XCFramework via -F/-framework" OFF)

    if(EXT_TP_MAC_USE_DYLIB)
      set(SDK_MAC_DYLIB_DEBUG
          "${SDK_ROOT}/lib/debug/lib${SDK_BASENAME}.dylib"
          CACHE FILEPATH "macOS .dylib (Debug)")
      set(SDK_MAC_DYLIB_RELEASE
          "${SDK_ROOT}/lib/release/lib${SDK_BASENAME}.dylib"
          CACHE FILEPATH "macOS .dylib (Release)")

      add_library(${SDK_BASENAME}_mac_dylib SHARED IMPORTED GLOBAL)
      set_target_properties(
        ${SDK_BASENAME}_mac_dylib
        PROPERTIES
          IMPORTED_CONFIGURATIONS "Debug;Release"
          IMPORTED_LOCATION_DEBUG "${SDK_MAC_DYLIB_DEBUG}"
          IMPORTED_LOCATION_RELEASE "${SDK_MAC_DYLIB_RELEASE}"
          MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
          MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}"
          INTERFACE_INCLUDE_DIRECTORIES
          "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
      target_link_libraries(ext_third_party INTERFACE ${SDK_BASENAME}_mac_dylib)

      _ext_tp_append_runtime(
        $<$<CONFIG:Debug>:${SDK_MAC_DYLIB_DEBUG}>
        $<$<OR:$<CONFIG:Release>,$<CONFIG:RelWithDebInfo>,$<CONFIG:MinSizeRel>>:${SDK_MAC_DYLIB_RELEASE}>
      )
    endif()

    if(EXT_TP_MAC_USE_FRAMEWORK)
      set(SDK_MAC_FRAMEWORK_DIR
          "${SDK_ROOT}/lib/macos"
          CACHE PATH "macOS -F search path to (XC)Framework")
      set(SDK_MAC_FRAMEWORK_NAME
          "DiscordPartnerSDK"
          CACHE STRING "macOS framework name (without .framework)")
      target_link_options(
        ext_third_party INTERFACE "-F${SDK_MAC_FRAMEWORK_DIR}" "-framework"
        "${SDK_MAC_FRAMEWORK_NAME}")
      # Optional extra frameworks: target_link_options(ext_third_party INTERFACE
      # "-framework" "Cocoa" "-framework" "IOKit")
    endif()
  endif() # macOS

# =============================================================================
# ANDROID (AAR w/ Prefab or raw per-ABI .so)
# =============================================================================
elseif(ANDROID)
  # Choose one strategy:
  option(EXT_TP_ANDROID_USE_AAR
         "Consume AAR (Prefab) and pick embedded jni/<abi> .so" OFF)
  option(EXT_TP_ANDROID_USE_RAW_SO
         "Consume raw per-ABI .so under SDK_ROOT/lib/android/<abi>" OFF)

  # ----- A) AAR path(s). We’ll pick Debug if exists; else Release.
  set(SDK_ANDROID_AAR_DEBUG
      "${SDK_ROOT}/lib/debug/${SDK_BASENAME}.aar"
      CACHE FILEPATH "Android AAR (Debug)")
  set(SDK_ANDROID_AAR_RELEASE
      "${SDK_ROOT}/lib/release/${SDK_BASENAME}.aar"
      CACHE FILEPATH "Android AAR (Release)")

  # ----- B) Raw per-ABI .so path
  set(SDK_ANDROID_SO_PER_ABI
      "${SDK_ROOT}/lib/android/${CMAKE_ANDROID_ARCH_ABI}/lib${SDK_BASENAME}.so"
      CACHE FILEPATH "Android per-ABI .so")

  if(EXT_TP_ANDROID_USE_AAR)
    # Pick best available AAR
    if(EXISTS "${SDK_ANDROID_AAR_DEBUG}")
      set(_AAR_IN "${SDK_ANDROID_AAR_DEBUG}")
    elseif(EXISTS "${SDK_ANDROID_AAR_RELEASE}")
      set(_AAR_IN "${SDK_ANDROID_AAR_RELEASE}")
    else()
      message(
        FATAL_ERROR
          "[third_party] No AAR found. Checked: ${SDK_ANDROID_AAR_DEBUG} and ${SDK_ANDROID_AAR_RELEASE}"
      )
    endif()

    # Extract once per timestamp
    set(_AAR_UNPACK_DIR "${CMAKE_BINARY_DIR}/_third_party/${SDK_BASENAME}_aar")
    file(MAKE_DIRECTORY "${_AAR_UNPACK_DIR}")
    file(TIMESTAMP "${_AAR_IN}" _aar_ts)
    set(_AAR_STAMP "${_AAR_UNPACK_DIR}/.stamp")
    set(_need_extract FALSE)
    if(NOT EXISTS "${_AAR_STAMP}")
      set(_need_extract TRUE)
    else()
      file(READ "${_AAR_STAMP}" _prev_ts)
      if(NOT _prev_ts STREQUAL "${_aar_ts}")
        set(_need_extract TRUE)
      endif()
    endif()
    if(_need_extract)
      message(
        STATUS "[third_party] Extracting ${_AAR_IN} -> ${_AAR_UNPACK_DIR}")
      file(REMOVE_RECURSE "${_AAR_UNPACK_DIR}")
      file(MAKE_DIRECTORY "${_AAR_UNPACK_DIR}")
      file(ARCHIVE_EXTRACT INPUT "${_AAR_IN}" DESTINATION "${_AAR_UNPACK_DIR}")
      file(WRITE "${_AAR_STAMP}" "${_aar_ts}")
    endif()

    # Locate the jni/<abi> library inside the AAR
    set(_AAR_JNI_SO
        "${_AAR_UNPACK_DIR}/jni/${CMAKE_ANDROID_ARCH_ABI}/lib${SDK_BASENAME}.so"
    )
    if(NOT EXISTS "${_AAR_JNI_SO}")
      message(
        FATAL_ERROR
          "[third_party] Missing JNI lib for ABI ${CMAKE_ANDROID_ARCH_ABI}: ${_AAR_JNI_SO}"
      )
    endif()

    add_library(${SDK_BASENAME}_android SHARED IMPORTED GLOBAL)
    set_target_properties(
      ${SDK_BASENAME}_android
      PROPERTIES
        IMPORTED_LOCATION "${_AAR_JNI_SO}"
        INTERFACE_INCLUDE_DIRECTORIES
        "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
    target_link_libraries(ext_third_party INTERFACE ${SDK_BASENAME}_android)

    # Publish for parent Gradle to consume (implementation files(".../sdk.aar"))
    set(EXT_TP_ANDROID_AAR
        "${_AAR_IN}"
        PARENT_SCOPE)

    # Also make the JNI .so visible for parent copy (if desired)
    # _ext_tp_append_runtime("${_AAR_JNI_SO}")

  elseif(EXT_TP_ANDROID_USE_RAW_SO)
    # Directly import lib…so from per-ABI location
    if(NOT EXISTS "${SDK_ANDROID_SO_PER_ABI}")
      message(
        FATAL_ERROR
          "[third_party] Missing per-ABI .so: ${SDK_ANDROID_SO_PER_ABI}")
    endif()

    add_library(${SDK_BASENAME}_android SHARED IMPORTED GLOBAL)
    set_target_properties(
      ${SDK_BASENAME}_android
      PROPERTIES
        IMPORTED_LOCATION "${SDK_ANDROID_SO_PER_ABI}"
        INTERFACE_INCLUDE_DIRECTORIES
        "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
    target_link_libraries(ext_third_party INTERFACE ${SDK_BASENAME}_android)

    _ext_tp_append_runtime("${SDK_ANDROID_SO_PER_ABI}")
  else()
    message(
      WARNING
        "[third_party] ANDROID set, but neither EXT_TP_ANDROID_USE_AAR nor EXT_TP_ANDROID_USE_RAW_SO is ON."
    )
  endif()
# =============================================================================
# LINUX (shared .so or static .a)
# =============================================================================
elseif(UNIX)
  option(EXT_TP_LINUX_USE_SHARED "Link prebuilt .so on Linux" OFF)
  option(EXT_TP_LINUX_USE_STATIC "Link prebuilt .a (and system libs)" OFF)

  if(EXT_TP_LINUX_USE_SHARED)
    set(SDK_LNX_SO_DEBUG
        "${SDK_ROOT}/lib/debug/lib${SDK_BASENAME}.so"
        CACHE FILEPATH "Linux .so (Debug)")
    set(SDK_LNX_SO_RELEASE
        "${SDK_ROOT}/lib/release/lib${SDK_BASENAME}.so"
        CACHE FILEPATH "Linux .so (Release)")

    add_library(${SDK_BASENAME}_linux_so SHARED IMPORTED GLOBAL)
    set_target_properties(
      ${SDK_BASENAME}_linux_so
      PROPERTIES
        IMPORTED_CONFIGURATIONS "Debug;Release"
        IMPORTED_LOCATION_DEBUG "${SDK_LNX_SO_DEBUG}"
        IMPORTED_LOCATION_RELEASE "${SDK_LNX_SO_RELEASE}"
        MAP_IMPORTED_CONFIG_RELWITHDEBINFO "${_MAP_REL_CONFIGS}"
        MAP_IMPORTED_CONFIG_MINSIZEREL "${_MAP_REL_CONFIGS}"
        INTERFACE_INCLUDE_DIRECTORIES
        "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
    target_link_libraries(ext_third_party INTERFACE ${SDK_BASENAME}_linux_so)

    _ext_tp_append_runtime(
      $<$<CONFIG:Debug>:${SDK_LNX_SO_DEBUG}>
      $<$<OR:$<CONFIG:Release>,$<CONFIG:RelWithDebInfo>,$<CONFIG:MinSizeRel>>:${SDK_LNX_SO_RELEASE}>
    )
  endif()

  if(EXT_TP_LINUX_USE_STATIC)
    set(SDK_LNX_STATIC_A
        "${SDK_ROOT}/lib/linux/x86_64/lib${SDK_BASENAME}.a"
        CACHE FILEPATH "Linux static .a")
    add_library(${SDK_BASENAME}_linux_static STATIC IMPORTED GLOBAL)
    set_target_properties(
      ${SDK_BASENAME}_linux_static
      PROPERTIES
        IMPORTED_LOCATION "${SDK_LNX_STATIC_A}"
        INTERFACE_INCLUDE_DIRECTORIES
        "$<TARGET_PROPERTY:ext_third_party,INTERFACE_INCLUDE_DIRECTORIES>")
    # Link typical system libs (uncomment as needed)
    # target_link_libraries(${SDK_BASENAME}_linux_static INTERFACE pthread dl)
    target_link_libraries(ext_third_party
                          INTERFACE ${SDK_BASENAME}_linux_static)
  endif()
endif()

# =============================================================================
# (OPTIONAL) Console SDK hooks (uncomment and point to vendor toolchains)
# =============================================================================
# if(CMAKE_SYSTEM_NAME STREQUAL "ORBIS") # PS4: add imported lib and link;
# publish runtime if needed elseif(CMAKE_SYSTEM_NAME STREQUAL "Prospero") # PS5:
# similar elseif(CMAKE_SYSTEM_NAME STREQUAL "NintendoSwitch" OR DEFINED
# ENV{NINTENDO_SDK_ROOT}) # Switch: similar endif()

# =============================================================================
# Bubble up runtime list to parent
# =============================================================================
set(EXT_TP_RUNTIME_DLLS "${_EXT_TP_RUNTIME_DLLS}" PARENT_SCOPE)

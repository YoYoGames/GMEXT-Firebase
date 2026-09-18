cmake_minimum_required(VERSION 3.18)

# No vendored SDK for this extension (Java and Objective-C only): the Firebase pods come from
# the game's Podfile. The iOS xcframework build still compiles the ObjC wrapper against the
# pod headers, which CocoaPods checks out beside the GameMaker Xcode project - the same place
# AdMob and Facebook read theirs from. Keep the file: extgen re-creates its vendor template
# whenever this path is missing.
add_library(ext_third_party INTERFACE)

if(APPLE)
  string(TOLOWER "${CMAKE_OSX_SYSROOT}" _OSX_SYSROOT_LOWER)
endif()

if(APPLE AND _OSX_SYSROOT_LOWER MATCHES "iphone")
  # EXT_GM_XCODEPROJ_OVERRIDE is the src-controlled path (src/CMakeLists.txt), EXT_GM_XCODEPROJ
  # the preset / command-line one; either names the GameMaker-exported .xcodeproj.
  set(_GM_XCODEPROJ "${EXT_GM_XCODEPROJ_OVERRIDE}")
  if(NOT _GM_XCODEPROJ)
    set(_GM_XCODEPROJ "${EXT_GM_XCODEPROJ}")
  endif()

  if(NOT _GM_XCODEPROJ)
    message(FATAL_ERROR
      "[third_party] No GameMaker Xcode project set.\n"
      "Set EXT_GM_XCODEPROJ_OVERRIDE in src/CMakeLists.txt or pass -DEXT_GM_XCODEPROJ=<path>: "
      "its Pods/ folder supplies the Firebase headers this wrapper compiles against.")
  endif()

  get_filename_component(_GM_PARENT_DIR "${_GM_XCODEPROJ}" DIRECTORY)
  set(_PODS_DIR "${_GM_PARENT_DIR}/Pods")

  if(NOT EXISTS "${_PODS_DIR}")
    message(FATAL_ERROR
      "[third_party] CocoaPods folder not found: ${_PODS_DIR}\n"
      "Run `pod install` in the GameMaker Xcode project first "
      "(GameMaker .xcodeproj = ${_GM_XCODEPROJ}).")
  endif()

  # The Firebase pods are source pods, so there is nothing to link here - the game links
  # them and a static library resolves at app link. The wrapper only needs the public
  # headers. They are found by the pod's umbrella header rather than a hardcoded path, and
  # the directory two levels up from <...>/Public/<Module>/<Module>.h is what makes
  # #import <Module/Module.h> resolve.
  function(_ext_tp_add_pod_headers _pod_dir _module)
    file(GLOB_RECURSE _candidates "${_PODS_DIR}/${_pod_dir}/${_module}.h")
    set(_umbrella "")
    foreach(_c IN LISTS _candidates)
      if(_c MATCHES "/Public/${_module}/${_module}\\.h$")
        set(_umbrella "${_c}")
        break()
      endif()
    endforeach()

    if(NOT _umbrella)
      message(FATAL_ERROR
        "[third_party] ${_module}.h not found under ${_PODS_DIR}/${_pod_dir}\n"
        "Run `pod install` so the ${_pod_dir} pod is checked out.")
    endif()

    get_filename_component(_module_dir "${_umbrella}" DIRECTORY)
    get_filename_component(_include_dir "${_module_dir}" DIRECTORY)
    target_include_directories(ext_third_party INTERFACE "${_include_dir}")
    message(STATUS "[third_party] ${_module} headers: ${_include_dir}")
  endfunction()

  _ext_tp_add_pod_headers(FirebaseCore FirebaseCore)
  _ext_tp_add_pod_headers(FirebasePerformance FirebasePerformance)
endif()

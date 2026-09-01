cmake_minimum_required(VERSION 3.18)

# GMFirebaseDatabase is a thin native client of GMFirebaseCore.
# All Firebase C++ SDK code and product libraries are linked only by Core.
add_library(ext_third_party INTERFACE)

set(_FIREBASE_IS_IOS FALSE)
if(APPLE)
  if(CMAKE_OSX_SYSROOT MATCHES "iphone" OR CMAKE_SYSTEM_NAME STREQUAL "iOS")
    set(_FIREBASE_IS_IOS TRUE)
  endif()
endif()

# Extension Generator compiles src/native on desktop but not Android / the
# iOS native-framework flavour, so inject the portable forwarders there.
if(ANDROID OR (_FIREBASE_IS_IOS AND EXT_APPLE_NATIVE_FRAMEWORK))
  file(GLOB _GMF_CLIENT_NATIVE CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/../src/native/*.cpp")
  if(_GMF_CLIENT_NATIVE)
    target_sources(${EXT_MAIN_TARGET} PRIVATE ${_GMF_CLIENT_NATIVE})
  endif()
endif()

if(ANDROID)
  target_link_libraries(ext_third_party INTERFACE dl)
elseif(UNIX AND NOT APPLE)
  target_link_libraries(ext_third_party INTERFACE dl)
endif()

set(EXT_TP_RUNTIME_DLLS "" PARENT_SCOPE)

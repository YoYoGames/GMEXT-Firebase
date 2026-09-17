cmake_minimum_required(VERSION 3.18)

# No third-party SDK for this extension (Java and Objective-C only) - an empty INTERFACE target so
# the generated root CMakeLists has something to link. Keep the file: extgen re-creates its vendor
# template whenever this path is missing.
add_library(ext_third_party INTERFACE)

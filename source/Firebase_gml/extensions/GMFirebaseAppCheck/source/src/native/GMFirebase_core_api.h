#pragma once

#include <cstddef>
#include <cstdint>

#define GMFIREBASE_CORE_ABI_VERSION 1u

#if defined(_WIN32)
  #if defined(GMFIREBASE_CORE_BUILD)
    #define GMFIREBASE_CORE_EXPORT __declspec(dllexport)
  #else
    #define GMFIREBASE_CORE_EXPORT __declspec(dllimport)
  #endif
#elif defined(__GNUC__) || defined(__clang__)
  #define GMFIREBASE_CORE_EXPORT __attribute__((visibility("default")))
#else
  #define GMFIREBASE_CORE_EXPORT
#endif

// Stable C ABI shared by every split GMFirebase native module.
// Keep C++ SDK objects opaque here. Product modules cast app pointers back to
// firebase::App* only after receiving them from Core.
struct GMFirebaseCoreAPI
{
    std::uint32_t abi_version;
    std::uint32_t struct_size;

    void* (*get_default_app)();
    std::uint64_t (*wrap_app)(void* app);
    void* (*resolve_app)(std::uint64_t ref);

    void (*set_last_error)(int code, const char* message);
    int (*get_last_error_code)();
    const char* (*get_last_error_message)();

    std::uint64_t (*register_pointer)(void* pointer, std::uint8_t type_code);
    void* (*resolve_pointer)(std::uint64_t ref, std::uint8_t expected_type);
    void* (*unregister_pointer)(std::uint64_t ref, std::uint8_t expected_type);
};

extern "C" GMFIREBASE_CORE_EXPORT
const GMFirebaseCoreAPI* gmfirebase_core_get_api();

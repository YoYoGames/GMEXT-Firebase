#pragma once

// Generic product dispatch ABI.
//
// GMFirebaseCore is the only native module that statically links Firebase C++
// product libraries. Split product extensions resolve their original native
// firebase_<product>_* implementation through this function and then invoke it
// with the exact ExtGen-generated C++ signature.
//
// The generic function pointer is never called directly; callers cast it back
// to the exact function pointer type before invocation.
using GMFirebaseCoreProc = void (*)();

// Keep the declaration identical in Core and in thin product clients, but only
// mark the symbol for export while GMFirebaseCore itself is being built.
// Product extensions resolve it dynamically and therefore must not use
// __declspec(dllimport).
#if defined(_WIN32)
    #if defined(GMFIREBASE_CORE_BUILD)
        #define GMFIREBASE_CORE_PRODUCT_EXPORT __declspec(dllexport)
    #else
        #define GMFIREBASE_CORE_PRODUCT_EXPORT
    #endif
#elif (defined(__GNUC__) || defined(__clang__)) && defined(GMFIREBASE_CORE_BUILD)
    #define GMFIREBASE_CORE_PRODUCT_EXPORT __attribute__((visibility("default")))
#else
    #define GMFIREBASE_CORE_PRODUCT_EXPORT
#endif

extern "C" GMFIREBASE_CORE_PRODUCT_EXPORT
GMFirebaseCoreProc gmfirebase_core_resolve_product_proc(
    const char* product,
    const char* symbol);

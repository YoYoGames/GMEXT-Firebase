#include "GMFirebase_core_client.h"

#include <mutex>

#if defined(_WIN32)
    #define WIN32_LEAN_AND_MEAN
    #define NOMINMAX
    #include <windows.h>
#elif defined(__APPLE__)
    #include <TargetConditionals.h>
    #if !TARGET_OS_IPHONE && !TARGET_OS_TV
        #include <dlfcn.h>
    #endif
#else
    #include <dlfcn.h>
#endif

namespace
{
    using GetApiFn = const GMFirebaseCoreAPI* (*)();

    std::mutex g_core_api_mutex;
    const GMFirebaseCoreAPI* g_core_api = nullptr;

    const GMFirebaseCoreAPI* validate(const GMFirebaseCoreAPI* api)
    {
        if (api == nullptr)
            return nullptr;
        if (api->abi_version != GMFIREBASE_CORE_ABI_VERSION)
            return nullptr;
        if (api->struct_size < sizeof(GMFirebaseCoreAPI))
            return nullptr;
        if (api->get_default_app == nullptr || api->wrap_app == nullptr ||
            api->resolve_app == nullptr || api->set_last_error == nullptr ||
            api->get_last_error_code == nullptr || api->get_last_error_message == nullptr ||
            api->register_pointer == nullptr || api->resolve_pointer == nullptr ||
            api->unregister_pointer == nullptr)
            return nullptr;
        return api;
    }

    const GMFirebaseCoreAPI* tryLoadCoreAPI()
    {
#if defined(__APPLE__) && (TARGET_OS_IPHONE || TARGET_OS_TV)
        // Split iOS/tvOS extensions are static archives in the final GameMaker
        // Xcode target, so the linker resolves this symbol from GMFirebaseCore.
        return validate(gmfirebase_core_get_api());

#elif defined(_WIN32)
        HMODULE module = GetModuleHandleA("GMFirebaseCore.dll");
        if (module == nullptr)
            module = LoadLibraryA("GMFirebaseCore.dll");
        if (module == nullptr)
            return nullptr;

        auto getter = reinterpret_cast<GetApiFn>(
            GetProcAddress(module, "gmfirebase_core_get_api"));
        return getter != nullptr ? validate(getter()) : nullptr;

#else
        // First try the process-wide symbol table in case GameMaker already
        // loaded Core. If not, explicitly load the sibling native library.
        auto getter = reinterpret_cast<GetApiFn>(
            dlsym(RTLD_DEFAULT, "gmfirebase_core_get_api"));
        if (getter != nullptr)
            return validate(getter());

        const char* candidates[] = {
#if defined(__APPLE__)
            "libGMFirebaseCore.dylib",
            "GMFirebaseCore.dylib",
#else
            "libGMFirebaseCore.so",
            "GMFirebaseCore.so",
#endif
        };

        for (const char* candidate : candidates)
        {
            void* module = dlopen(candidate, RTLD_NOW | RTLD_GLOBAL);
            if (module == nullptr)
                continue;
            getter = reinterpret_cast<GetApiFn>(
                dlsym(module, "gmfirebase_core_get_api"));
            if (getter != nullptr)
                return validate(getter());
        }
        return nullptr;
#endif
    }
}

const GMFirebaseCoreAPI* gmfirebaseGetCoreAPI()
{
    if (g_core_api != nullptr)
        return g_core_api;

    std::lock_guard<std::mutex> lock(g_core_api_mutex);
    if (g_core_api == nullptr)
        g_core_api = tryLoadCoreAPI();
    return g_core_api;
}

bool gmfirebaseCoreAvailable()
{
    return gmfirebaseGetCoreAPI() != nullptr;
}

#include "GMFirebase_core_product_client.h"
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
    using ResolveProductProcFn =
        GMFirebaseCoreProc (*)(const char*, const char*);

    std::mutex g_product_resolver_mutex;
    ResolveProductProcFn g_product_resolver = nullptr;

    ResolveProductProcFn tryLoadProductResolver()
    {
        // Ensure GMFirebaseCore is available first. On shared-library platforms
        // this may also load libGMFirebaseCore.so / GMFirebaseCore.dll.
        if (!gmfirebaseCoreAvailable())
            return nullptr;

#if defined(__APPLE__) && (TARGET_OS_IPHONE || TARGET_OS_TV)

        // iOS/tvOS extensions are static archives linked into the same final
        // GameMaker application target.
        return &gmfirebase_core_resolve_product_proc;

#elif defined(_WIN32)

        HMODULE module = GetModuleHandleA("GMFirebaseCore.dll");
        if (module == nullptr)
            module = LoadLibraryA("GMFirebaseCore.dll");

        if (module == nullptr)
            return nullptr;

        return reinterpret_cast<ResolveProductProcFn>(
            GetProcAddress(
                module,
                "gmfirebase_core_resolve_product_proc"));

#else

        // This may work when Core was loaded RTLD_GLOBAL.
        auto resolver = reinterpret_cast<ResolveProductProcFn>(
            dlsym(
                RTLD_DEFAULT,
                "gmfirebase_core_resolve_product_proc"));

        if (resolver != nullptr)
            return resolver;

        // GameMaker/Android may load extension .so files with local visibility.
        // Resolve directly from the Core library handle instead of relying on
        // RTLD_DEFAULT. This mirrors the working Auth/Firestore Core clients.
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
            void* module =
                dlopen(candidate, RTLD_NOW | RTLD_GLOBAL);

            if (module == nullptr)
                continue;

            resolver = reinterpret_cast<ResolveProductProcFn>(
                dlsym(
                    module,
                    "gmfirebase_core_resolve_product_proc"));

            if (resolver != nullptr)
                return resolver;
        }

        return nullptr;

#endif
    }
}

GMFirebaseCoreProc gmfirebaseGetCoreProductProc(
    const char* product,
    const char* symbol)
{
    if (g_product_resolver == nullptr)
    {
        std::lock_guard<std::mutex> lock(g_product_resolver_mutex);

        if (g_product_resolver == nullptr)
            g_product_resolver = tryLoadProductResolver();
    }

    return g_product_resolver != nullptr
        ? g_product_resolver(product, symbol)
        : nullptr;
}

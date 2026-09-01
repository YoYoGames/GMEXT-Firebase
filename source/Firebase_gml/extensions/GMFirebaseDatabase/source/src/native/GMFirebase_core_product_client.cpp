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
    using ResolveProductProcFn = GMFirebaseCoreProc (*)(const char*, const char*);
    std::mutex g_product_resolver_mutex;
    ResolveProductProcFn g_product_resolver = nullptr;

    ResolveProductProcFn tryLoadProductResolver()
    {
        // This also loads GMFirebaseCore with RTLD_GLOBAL / LoadLibrary on the
        // platforms where the split extensions are shared libraries.
        if (!gmfirebaseCoreAvailable())
            return nullptr;

#if defined(__APPLE__) && (TARGET_OS_IPHONE || TARGET_OS_TV)
        // iOS/tvOS product extensions are static archives in the same final
        // GameMaker application target, so the linker resolves this directly.
        return &gmfirebase_core_resolve_product_proc;

#elif defined(_WIN32)
        HMODULE module = GetModuleHandleA("GMFirebaseCore.dll");
        if (module == nullptr)
            return nullptr;
        return reinterpret_cast<ResolveProductProcFn>(
            GetProcAddress(module, "gmfirebase_core_resolve_product_proc"));

#else
        return reinterpret_cast<ResolveProductProcFn>(
            dlsym(RTLD_DEFAULT, "gmfirebase_core_resolve_product_proc"));
#endif
    }
}

GMFirebaseCoreProc gmfirebaseGetCoreProductProc(const char* product, const char* symbol)
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

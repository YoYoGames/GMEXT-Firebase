#define GMFIREBASE_CORE_BUILD 1
#include "GMFirebase_core_api.h"
#include "GMFirebase_common.h"

#include <string>

namespace
{
    void* apiGetDefaultApp()
    {
        return static_cast<void*>(getFirebaseApp());
    }

    std::uint64_t apiWrapApp(void* app)
    {
        return wrapFirebaseApp(static_cast<firebase::App*>(app));
    }

    void* apiResolveApp(std::uint64_t ref)
    {
        return static_cast<void*>(resolveFirebaseApp(ref));
    }

    void apiSetLastError(int code, const char* message)
    {
        setFirebaseLastError(code, message != nullptr ? std::string(message) : std::string());
    }

    int apiGetLastErrorCode()
    {
        return static_cast<int>(firebase_last_error_code());
    }

    const char* apiGetLastErrorMessage()
    {
        // The returned pointer stays valid on this calling thread until the
        // next API call that asks for the error message on the same thread.
        thread_local std::string message;
        message = firebase_last_error_message();
        return message.c_str();
    }

    std::uint64_t apiRegisterPointer(void* pointer, std::uint8_t type_code)
    {
        return registerFirebasePointer(pointer, type_code);
    }

    void* apiResolvePointer(std::uint64_t ref, std::uint8_t expected_type)
    {
        return resolveFirebasePointer(ref, expected_type);
    }

    void* apiUnregisterPointer(std::uint64_t ref, std::uint8_t expected_type)
    {
        return unregisterFirebasePointer(ref, expected_type);
    }

    const GMFirebaseCoreAPI kCoreAPI = {
        GMFIREBASE_CORE_ABI_VERSION,
        static_cast<std::uint32_t>(sizeof(GMFirebaseCoreAPI)),
        &apiGetDefaultApp,
        &apiWrapApp,
        &apiResolveApp,
        &apiSetLastError,
        &apiGetLastErrorCode,
        &apiGetLastErrorMessage,
        &apiRegisterPointer,
        &apiResolvePointer,
        &apiUnregisterPointer,
    };
}

extern "C" GMFIREBASE_CORE_EXPORT
const GMFirebaseCoreAPI* gmfirebase_core_get_api()
{
    return &kCoreAPI;
}

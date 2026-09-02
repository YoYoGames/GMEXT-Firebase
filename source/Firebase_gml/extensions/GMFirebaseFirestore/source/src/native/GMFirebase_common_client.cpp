#include "GMFirebase_common.h"
#include "GMFirebase_core_client.h"

#include <mutex>
#include <string>

namespace
{
    std::mutex g_fallback_error_mutex;
    int g_fallback_error_code = 0;
    std::string g_fallback_error_message;

    void setFallbackError(int code, const std::string& message)
    {
        std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
        g_fallback_error_code = code;
        g_fallback_error_message = message;
    }

    const GMFirebaseCoreAPI* coreOrRecordError()
    {
        const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
        if (api == nullptr)
            setFallbackError(-1, "GMFirebaseCore is required but its native Core ABI could not be loaded");
        return api;
    }
}

void setFirebaseLastError(int code, const std::string& message)
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
        api->set_last_error(code, message.c_str());
    else
        setFallbackError(code, message);
}

double firebase_last_error_code()
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
        return static_cast<double>(api->get_last_error_code());

    std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
    return static_cast<double>(g_fallback_error_code);
}

std::string firebase_last_error_message()
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
    {
        const char* message = api->get_last_error_message();
        return message != nullptr ? std::string(message) : std::string();
    }

    std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
    return g_fallback_error_message;
}

uint64_t packFirebaseRef(uint32_t index, uint8_t type)
{
    const uint64_t ext_id = GM_FIREBASE_EXT;
    return (ext_id << 40) | (static_cast<uint64_t>(type) << 32) | index;
}

uint64_t registerFirebasePointer(void* pointer, uint8_t type_code)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->register_pointer(pointer, type_code) : 0;
}

void* resolveFirebasePointer(uint64_t ref, uint8_t expected_type)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->resolve_pointer(ref, expected_type) : nullptr;
}

void* unregisterFirebasePointer(uint64_t ref, uint8_t expected_type)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->unregister_pointer(ref, expected_type) : nullptr;
}

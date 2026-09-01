#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseFunctionsInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_functions_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_functions_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_instance);
    if (std::strcmp(symbol, "firebase_functions_get_instance_with_region") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_instance_with_region);
    if (std::strcmp(symbol, "firebase_functions_use_functions_emulator") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_use_functions_emulator);
    if (std::strcmp(symbol, "firebase_functions_get_https_callable") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_https_callable);
    if (std::strcmp(symbol, "firebase_functions_get_https_callable_with_options") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_https_callable_with_options);
    if (std::strcmp(symbol, "firebase_functions_get_https_callable_from_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_https_callable_from_url);
    if (std::strcmp(symbol, "firebase_functions_get_https_callable_from_url_with_options") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_https_callable_from_url_with_options);
    if (std::strcmp(symbol, "firebase_functions_callable_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_callable_is_valid);
    if (std::strcmp(symbol, "firebase_functions_callable_call") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_callable_call);
    if (std::strcmp(symbol, "firebase_functions_callable_call_with_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_callable_call_with_data);
    if (std::strcmp(symbol, "firebase_functions_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_app);
    if (std::strcmp(symbol, "firebase_functions_callable_get_functions") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_callable_get_functions);
    if (std::strcmp(symbol, "firebase_functions_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_instance_for_app);
    if (std::strcmp(symbol, "firebase_functions_get_instance_for_app_region") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_functions_get_instance_for_app_region);
    return nullptr;
}

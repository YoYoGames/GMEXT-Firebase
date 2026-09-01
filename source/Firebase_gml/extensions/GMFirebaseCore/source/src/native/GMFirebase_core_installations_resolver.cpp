#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseInstallationsInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_installations_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_installations_get_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_get_id);
    if (std::strcmp(symbol, "firebase_installations_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_get_token);
    if (std::strcmp(symbol, "firebase_installations_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_delete);
    if (std::strcmp(symbol, "firebase_installations_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_get_app);
    if (std::strcmp(symbol, "firebase_installations_get_instance_handle") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_get_instance_handle);
    if (std::strcmp(symbol, "firebase_installations_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_get_instance_for_app);
    if (std::strcmp(symbol, "firebase_installations_instance_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_instance_get_app);
    if (std::strcmp(symbol, "firebase_installations_instance_get_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_instance_get_id);
    if (std::strcmp(symbol, "firebase_installations_instance_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_instance_get_token);
    if (std::strcmp(symbol, "firebase_installations_instance_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_installations_instance_delete);
    return nullptr;
}

#define GMFIREBASE_CORE_BUILD 1
#include "GMFirebase_core_api.h"
#include "GMFirebase_core_product_api.h"
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_analytics_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_app_check_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_database_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_functions_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_installations_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_messaging_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_remote_config_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_storage_proc(const char* symbol);
GMFirebaseCoreProc gmfirebase_core_resolve_ump_proc(const char* symbol);

extern "C" GMFIREBASE_CORE_PRODUCT_EXPORT
GMFirebaseCoreProc gmfirebase_core_resolve_product_proc(const char* product, const char* symbol)
{
    if (product == nullptr || symbol == nullptr) return nullptr;
    if (std::strcmp(product, "analytics") == 0) return gmfirebase_core_resolve_analytics_proc(symbol);
    if (std::strcmp(product, "app_check") == 0) return gmfirebase_core_resolve_app_check_proc(symbol);
    if (std::strcmp(product, "database") == 0) return gmfirebase_core_resolve_database_proc(symbol);
    if (std::strcmp(product, "functions") == 0) return gmfirebase_core_resolve_functions_proc(symbol);
    if (std::strcmp(product, "installations") == 0) return gmfirebase_core_resolve_installations_proc(symbol);
    if (std::strcmp(product, "messaging") == 0) return gmfirebase_core_resolve_messaging_proc(symbol);
    if (std::strcmp(product, "remote_config") == 0) return gmfirebase_core_resolve_remote_config_proc(symbol);
    if (std::strcmp(product, "storage") == 0) return gmfirebase_core_resolve_storage_proc(symbol);
    if (std::strcmp(product, "ump") == 0) return gmfirebase_core_resolve_ump_proc(symbol);
    return nullptr;
}

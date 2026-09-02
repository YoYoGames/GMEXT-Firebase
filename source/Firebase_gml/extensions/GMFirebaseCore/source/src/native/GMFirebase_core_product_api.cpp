#define GMFIREBASE_CORE_BUILD 1
#include "GMFirebase_core_api.h"
#include "GMFirebase_core_product_api.h"
#include <cstring>

#ifndef GMFIREBASE_WITH_ANALYTICS
#define GMFIREBASE_WITH_ANALYTICS 0
#endif
#ifndef GMFIREBASE_WITH_APP_CHECK
#define GMFIREBASE_WITH_APP_CHECK 0
#endif
#ifndef GMFIREBASE_WITH_DATABASE
#define GMFIREBASE_WITH_DATABASE 0
#endif
#ifndef GMFIREBASE_WITH_FUNCTIONS
#define GMFIREBASE_WITH_FUNCTIONS 0
#endif
#ifndef GMFIREBASE_WITH_INSTALLATIONS
#define GMFIREBASE_WITH_INSTALLATIONS 0
#endif
#ifndef GMFIREBASE_WITH_MESSAGING
#define GMFIREBASE_WITH_MESSAGING 0
#endif
#ifndef GMFIREBASE_WITH_REMOTE_CONFIG
#define GMFIREBASE_WITH_REMOTE_CONFIG 0
#endif
#ifndef GMFIREBASE_WITH_STORAGE
#define GMFIREBASE_WITH_STORAGE 0
#endif
#ifndef GMFIREBASE_WITH_UMP
#define GMFIREBASE_WITH_UMP 0
#endif

#if GMFIREBASE_WITH_ANALYTICS
GMFirebaseCoreProc gmfirebase_core_resolve_analytics_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_APP_CHECK
GMFirebaseCoreProc gmfirebase_core_resolve_app_check_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_DATABASE
GMFirebaseCoreProc gmfirebase_core_resolve_database_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_FUNCTIONS
GMFirebaseCoreProc gmfirebase_core_resolve_functions_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_INSTALLATIONS
GMFirebaseCoreProc gmfirebase_core_resolve_installations_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_MESSAGING
GMFirebaseCoreProc gmfirebase_core_resolve_messaging_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_REMOTE_CONFIG
GMFirebaseCoreProc gmfirebase_core_resolve_remote_config_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_STORAGE
GMFirebaseCoreProc gmfirebase_core_resolve_storage_proc(const char* symbol);
#endif
#if GMFIREBASE_WITH_UMP
GMFirebaseCoreProc gmfirebase_core_resolve_ump_proc(const char* symbol);
#endif

extern "C" GMFIREBASE_CORE_PRODUCT_EXPORT
GMFirebaseCoreProc gmfirebase_core_resolve_product_proc(const char* product, const char* symbol)
{
    if (product == nullptr || symbol == nullptr) return nullptr;

#if GMFIREBASE_WITH_ANALYTICS
    if (std::strcmp(product, "analytics") == 0)
        return gmfirebase_core_resolve_analytics_proc(symbol);
#endif
#if GMFIREBASE_WITH_APP_CHECK
    if (std::strcmp(product, "app_check") == 0)
        return gmfirebase_core_resolve_app_check_proc(symbol);
#endif
#if GMFIREBASE_WITH_DATABASE
    if (std::strcmp(product, "database") == 0)
        return gmfirebase_core_resolve_database_proc(symbol);
#endif
#if GMFIREBASE_WITH_FUNCTIONS
    if (std::strcmp(product, "functions") == 0)
        return gmfirebase_core_resolve_functions_proc(symbol);
#endif
#if GMFIREBASE_WITH_INSTALLATIONS
    if (std::strcmp(product, "installations") == 0)
        return gmfirebase_core_resolve_installations_proc(symbol);
#endif
#if GMFIREBASE_WITH_MESSAGING
    if (std::strcmp(product, "messaging") == 0)
        return gmfirebase_core_resolve_messaging_proc(symbol);
#endif
#if GMFIREBASE_WITH_REMOTE_CONFIG
    if (std::strcmp(product, "remote_config") == 0)
        return gmfirebase_core_resolve_remote_config_proc(symbol);
#endif
#if GMFIREBASE_WITH_STORAGE
    if (std::strcmp(product, "storage") == 0)
        return gmfirebase_core_resolve_storage_proc(symbol);
#endif
#if GMFIREBASE_WITH_UMP
    if (std::strcmp(product, "ump") == 0)
        return gmfirebase_core_resolve_ump_proc(symbol);
#endif

    return nullptr;
}

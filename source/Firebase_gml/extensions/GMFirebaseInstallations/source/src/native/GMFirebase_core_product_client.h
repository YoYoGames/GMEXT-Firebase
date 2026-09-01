#pragma once
#include "GMFirebase_core_product_api.h"

GMFirebaseCoreProc gmfirebaseGetCoreProductProc(
    const char* product,
    const char* symbol);

template <typename Proc>
inline Proc gmfirebaseGetCoreProductProcAs(const char* product, const char* symbol)
{
    return reinterpret_cast<Proc>(gmfirebaseGetCoreProductProc(product, symbol));
}

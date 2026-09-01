#include <native/GMFirebaseFunctionsInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

std::uint64_t firebase_functions_get_instance()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_instance");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_functions_get_instance_with_region(std::string_view region)
{
    using Proc = std::uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_instance_with_region");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(region);
}

void firebase_functions_use_functions_emulator(std::uint64_t functions_ref, std::string_view origin)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_use_functions_emulator");
    if (proc == nullptr)
        return;
    proc(functions_ref, origin);
}

std::uint64_t firebase_functions_get_https_callable(std::uint64_t functions_ref, std::string_view name)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_https_callable");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(functions_ref, name);
}

std::uint64_t firebase_functions_get_https_callable_with_options(std::uint64_t functions_ref, std::string_view name, double limited_use_app_check_token)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_https_callable_with_options");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(functions_ref, name, limited_use_app_check_token);
}

std::uint64_t firebase_functions_get_https_callable_from_url(std::uint64_t functions_ref, std::string_view url)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_https_callable_from_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(functions_ref, url);
}

std::uint64_t firebase_functions_get_https_callable_from_url_with_options(std::uint64_t functions_ref, std::string_view url, double limited_use_app_check_token)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_https_callable_from_url_with_options");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(functions_ref, url, limited_use_app_check_token);
}

double firebase_functions_callable_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_callable_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_functions_callable_call(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_callable_call");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_functions_callable_call_with_data(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_callable_call_with_data");
    if (proc == nullptr)
        return double{};
    return proc(ref, data, callback);
}

std::uint64_t firebase_functions_get_app(std::uint64_t functions)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(functions);
}

std::uint64_t firebase_functions_callable_get_functions(std::uint64_t callable)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_callable_get_functions");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(callable);
}

std::uint64_t firebase_functions_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

std::uint64_t firebase_functions_get_instance_for_app_region(std::uint64_t app, std::string_view region)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("functions", "firebase_functions_get_instance_for_app_region");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app, region);
}

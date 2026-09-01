#include <native/GMFirebaseAppCheckInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

void firebase_app_check_set_provider_factory(double provider)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_set_provider_factory");
    if (proc == nullptr)
        return;
    proc(provider);
}

void firebase_app_check_debug_provider_set_debug_token(std::string_view token)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_debug_provider_set_debug_token");
    if (proc == nullptr)
        return;
    proc(token);
}

void firebase_app_check_set_token_auto_refresh_enabled(double enabled)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_set_token_auto_refresh_enabled");
    if (proc == nullptr)
        return;
    proc(enabled);
}

double firebase_app_check_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_get_token");
    if (proc == nullptr)
        return double{};
    return proc(force_refresh, callback);
}

double firebase_app_check_get_limited_use_token(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_get_limited_use_token");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

std::uint64_t firebase_app_check_add_listener(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = std::uint64_t (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_add_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(callback);
}

double firebase_app_check_remove_listener(std::uint64_t listener_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_remove_listener");
    if (proc == nullptr)
        return double{};
    return proc(listener_ref);
}

std::uint64_t firebase_app_check_get_app()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_app_check_get_instance_handle()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_get_instance_handle");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_app_check_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

std::uint64_t firebase_app_check_instance_get_app(std::uint64_t app_check)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_instance_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app_check);
}

void firebase_app_check_instance_set_token_auto_refresh_enabled(std::uint64_t app_check, bool enabled)
{
    using Proc = void (*)(std::uint64_t, bool);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_instance_set_token_auto_refresh_enabled");
    if (proc == nullptr)
        return;
    proc(app_check, enabled);
}

double firebase_app_check_instance_get_token(std::uint64_t app_check, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, bool, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_instance_get_token");
    if (proc == nullptr)
        return double{};
    return proc(app_check, force_refresh, callback);
}

double firebase_app_check_instance_get_limited_use_token(std::uint64_t app_check, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_instance_get_limited_use_token");
    if (proc == nullptr)
        return double{};
    return proc(app_check, callback);
}

std::uint64_t firebase_app_check_instance_add_listener(std::uint64_t app_check, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("app_check", "firebase_app_check_instance_add_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app_check, callback);
}

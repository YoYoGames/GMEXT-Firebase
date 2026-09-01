#include <native/GMFirebaseRemoteConfigInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

std::uint64_t firebase_remote_config_get_instance()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_instance");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

double firebase_remote_config_ensure_initialized(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_ensure_initialized");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_set_config_settings(std::uint64_t rc_ref, double fetch_timeout_ms, double minimum_fetch_interval_ms, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, double, double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_set_config_settings");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, fetch_timeout_ms, minimum_fetch_interval_ms, callback);
}

double firebase_remote_config_get_config_settings_fetch_timeout(std::uint64_t rc_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_config_settings_fetch_timeout");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref);
}

double firebase_remote_config_get_config_settings_minimum_fetch_interval(std::uint64_t rc_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_config_settings_minimum_fetch_interval");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref);
}

double firebase_remote_config_fetch(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_fetch");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_fetch_with_expiration(std::uint64_t rc_ref, double cache_expiration_in_seconds, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_fetch_with_expiration");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, cache_expiration_in_seconds, callback);
}

double firebase_remote_config_fetch_and_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_fetch_and_activate");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_activate");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_get_boolean(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = double (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_boolean");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, key);
}

double firebase_remote_config_get_long(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = double (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_long");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, key);
}

double firebase_remote_config_get_double(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = double (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_double");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, key);
}

std::string firebase_remote_config_get_string(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = std::string (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_string");
    if (proc == nullptr)
        return std::string{};
    return proc(rc_ref, key);
}

double firebase_remote_config_get_data_size(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = double (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_data_size");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, key);
}

double firebase_remote_config_get_data(std::uint64_t rc_ref, std::string_view key, gm::wire::GMBuffer out_buffer)
{
    using Proc = double (*)(std::uint64_t, std::string_view, gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_data");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, key, out_buffer);
}

double firebase_remote_config_get_keys_by_prefix(std::uint64_t rc_ref, std::string_view prefix, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_keys_by_prefix");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, prefix, callback);
}

double firebase_remote_config_get_keys(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_keys");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_get_all(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_all");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_set_defaults(std::uint64_t rc_ref, const gm::wire::GMValue& defaults, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_set_defaults");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, defaults, callback);
}

gm_structs::FirebaseRemoteConfigInfo firebase_remote_config_get_info(std::uint64_t rc_ref)
{
    using Proc = gm_structs::FirebaseRemoteConfigInfo (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_info");
    if (proc == nullptr)
        return gm_structs::FirebaseRemoteConfigInfo{};
    return proc(rc_ref);
}

std::uint64_t firebase_remote_config_add_config_update_listener(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_add_config_update_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(rc_ref, callback);
}

double firebase_remote_config_remove_config_update_listener(std::uint64_t reg_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_remove_config_update_listener");
    if (proc == nullptr)
        return double{};
    return proc(reg_ref);
}

double firebase_remote_config_ensure_initialized_info(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_ensure_initialized_info");
    if (proc == nullptr)
        return double{};
    return proc(rc_ref, callback);
}

gm::wire::DataStream firebase_remote_config_get_boolean_with_info(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_boolean_with_info");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(rc_ref, key);
}

gm::wire::DataStream firebase_remote_config_get_long_with_info(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_long_with_info");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(rc_ref, key);
}

gm::wire::DataStream firebase_remote_config_get_double_with_info(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_double_with_info");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(rc_ref, key);
}

gm::wire::DataStream firebase_remote_config_get_string_with_info(std::uint64_t rc_ref, std::string_view key)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_string_with_info");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(rc_ref, key);
}

gm::wire::DataStream firebase_remote_config_get_data_with_info(std::uint64_t rc_ref, std::string_view key, gm::wire::GMBuffer out_buffer)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t, std::string_view, gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_data_with_info");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(rc_ref, key, out_buffer);
}

std::uint64_t firebase_remote_config_get_app(std::uint64_t remote_config)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(remote_config);
}

std::uint64_t firebase_remote_config_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("remote_config", "firebase_remote_config_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

#include <native/GMFirebaseAnalyticsInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

double firebase_analytics_initialize()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initialize");
    if (proc == nullptr)
        return double{};
    return proc();
}

void firebase_analytics_terminate()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_terminate");
    if (proc == nullptr)
        return;
    proc();
}

void firebase_analytics_set_analytics_collection_enabled(double enabled)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_analytics_collection_enabled");
    if (proc == nullptr)
        return;
    proc(enabled);
}

void firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization)
{
    using Proc = void (*)(double, double, double, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_consent");
    if (proc == nullptr)
        return;
    proc(ad_storage, analytics_storage, ad_user_data, ad_personalization);
}

void firebase_analytics_log_event(std::string_view name)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_log_event");
    if (proc == nullptr)
        return;
    proc(name);
}

void firebase_analytics_log_event_string(std::string_view name, std::string_view parameter_name, std::string_view parameter_value)
{
    using Proc = void (*)(std::string_view, std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_log_event_string");
    if (proc == nullptr)
        return;
    proc(name, parameter_name, parameter_value);
}

void firebase_analytics_log_event_number(std::string_view name, std::string_view parameter_name, double parameter_value)
{
    using Proc = void (*)(std::string_view, std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_log_event_number");
    if (proc == nullptr)
        return;
    proc(name, parameter_name, parameter_value);
}

void firebase_analytics_log_event_params(std::string_view name, const gm::wire::GMValue& params)
{
    using Proc = void (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_log_event_params");
    if (proc == nullptr)
        return;
    proc(name, params);
}

void firebase_analytics_set_default_event_parameters(const gm::wire::GMValue& params)
{
    using Proc = void (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_default_event_parameters");
    if (proc == nullptr)
        return;
    proc(params);
}

double firebase_analytics_log_apple_transaction(std::string_view transaction_id, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_log_apple_transaction");
    if (proc == nullptr)
        return double{};
    return proc(transaction_id, callback);
}

void firebase_analytics_set_user_property(std::string_view name, std::string_view value)
{
    using Proc = void (*)(std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_user_property");
    if (proc == nullptr)
        return;
    proc(name, value);
}

void firebase_analytics_set_user_id(std::string_view user_id)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_user_id");
    if (proc == nullptr)
        return;
    proc(user_id);
}

void firebase_analytics_set_session_timeout_duration(double milliseconds)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_session_timeout_duration");
    if (proc == nullptr)
        return;
    proc(milliseconds);
}

void firebase_analytics_reset_analytics_data()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_reset_analytics_data");
    if (proc == nullptr)
        return;
    proc();
}

double firebase_analytics_get_analytics_instance_id(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_get_analytics_instance_id");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

double firebase_analytics_get_session_id(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_get_session_id");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

void firebase_analytics_notify_app_lifecycle_termination()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_notify_app_lifecycle_termination");
    if (proc == nullptr)
        return;
    proc();
}

double firebase_analytics_is_desktop_initialized()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_is_desktop_initialized");
    if (proc == nullptr)
        return double{};
    return proc();
}

void firebase_analytics_set_desktop_debug_mode(double enabled)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_desktop_debug_mode");
    if (proc == nullptr)
        return;
    proc(enabled);
}

void firebase_analytics_set_log_callback(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_set_log_callback");
    if (proc == nullptr)
        return;
    proc(callback);
}

void firebase_analytics_initiate_on_device_conversion_measurement_email(std::string_view email_address)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initiate_on_device_conversion_measurement_email");
    if (proc == nullptr)
        return;
    proc(email_address);
}

void firebase_analytics_initiate_on_device_conversion_measurement_phone(std::string_view phone_number)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initiate_on_device_conversion_measurement_phone");
    if (proc == nullptr)
        return;
    proc(phone_number);
}

void firebase_analytics_notify_app_lifecycle_change(double state)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_notify_app_lifecycle_change");
    if (proc == nullptr)
        return;
    proc(state);
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(gm::wire::GMBuffer hashed_email)
{
    using Proc = void (*)(gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initiate_on_device_conversion_measurement_hashed_email");
    if (proc == nullptr)
        return;
    proc(hashed_email);
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(gm::wire::GMBuffer hashed_phone)
{
    using Proc = void (*)(gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone");
    if (proc == nullptr)
        return;
    proc(hashed_phone);
}

double firebase_analytics_initialize_for_app(std::uint64_t app)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("analytics", "firebase_analytics_initialize_for_app");
    if (proc == nullptr)
        return double{};
    return proc(app);
}

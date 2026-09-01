#include <native/GMFirebaseMessagingInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

double firebase_messaging_initialize()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_initialize");
    if (proc == nullptr)
        return double{};
    return proc();
}

void firebase_messaging_terminate()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_terminate");
    if (proc == nullptr)
        return;
    proc();
}

void firebase_messaging_set_token_registration_on_init_enabled(double enabled)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_set_token_registration_on_init_enabled");
    if (proc == nullptr)
        return;
    proc(enabled);
}

double firebase_messaging_is_token_registration_on_init_enabled()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_is_token_registration_on_init_enabled");
    if (proc == nullptr)
        return double{};
    return proc();
}

double firebase_messaging_delivery_metrics_export_to_big_query_enabled()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_delivery_metrics_export_to_big_query_enabled");
    if (proc == nullptr)
        return double{};
    return proc();
}

void firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_set_delivery_metrics_export_to_big_query");
    if (proc == nullptr)
        return;
    proc(enabled);
}

double firebase_messaging_request_permission(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_request_permission");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

double firebase_messaging_get_token(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_get_token");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

double firebase_messaging_delete_token(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_delete_token");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

double firebase_messaging_subscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_subscribe");
    if (proc == nullptr)
        return double{};
    return proc(topic, callback);
}

double firebase_messaging_unsubscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_unsubscribe");
    if (proc == nullptr)
        return double{};
    return proc(topic, callback);
}

double firebase_messaging_poll_message()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_poll_message");
    if (proc == nullptr)
        return double{};
    return proc();
}

double firebase_messaging_poll_token()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_poll_token");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_current_token()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_current_token");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_from()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_from");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_to()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_to");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_collapse_key()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_collapse_key");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_message_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_message_id");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_message_type()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_message_type");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_priority()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_priority");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_original_priority()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_original_priority");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

double firebase_messaging_message_time_to_live()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_time_to_live");
    if (proc == nullptr)
        return double{};
    return proc();
}

double firebase_messaging_message_sent_time()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_sent_time");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_message_error()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_error");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_error_description()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_error_description");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_link()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_link");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

double firebase_messaging_message_notification_opened()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_opened");
    if (proc == nullptr)
        return double{};
    return proc();
}

double firebase_messaging_message_data_count()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_data_count");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_message_data_key_at(double index)
{
    using Proc = std::string (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_data_key_at");
    if (proc == nullptr)
        return std::string{};
    return proc(index);
}

std::string firebase_messaging_message_get_data(std::string_view key)
{
    using Proc = std::string (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_get_data");
    if (proc == nullptr)
        return std::string{};
    return proc(key);
}

double firebase_messaging_message_raw_data_size()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_raw_data_size");
    if (proc == nullptr)
        return double{};
    return proc();
}

double firebase_messaging_message_raw_data_copy(gm::wire::GMBuffer out_buffer)
{
    using Proc = double (*)(gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_raw_data_copy");
    if (proc == nullptr)
        return double{};
    return proc(out_buffer);
}

double firebase_messaging_message_has_notification()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_has_notification");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_message_notification_title()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_title");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_body()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_body");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_icon()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_icon");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_sound()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_sound");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_badge()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_badge");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_tag()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_tag");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_color()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_color");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_click_action()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_click_action");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

std::string firebase_messaging_message_notification_body_loc_key()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_body_loc_key");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

double firebase_messaging_message_notification_body_loc_args_count()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_body_loc_args_count");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_message_notification_body_loc_args_at(double index)
{
    using Proc = std::string (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_body_loc_args_at");
    if (proc == nullptr)
        return std::string{};
    return proc(index);
}

std::string firebase_messaging_message_notification_title_loc_key()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_title_loc_key");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

double firebase_messaging_message_notification_title_loc_args_count()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_title_loc_args_count");
    if (proc == nullptr)
        return double{};
    return proc();
}

std::string firebase_messaging_message_notification_title_loc_args_at(double index)
{
    using Proc = std::string (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_title_loc_args_at");
    if (proc == nullptr)
        return std::string{};
    return proc(index);
}

std::string firebase_messaging_message_notification_android_channel_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_message_notification_android_channel_id");
    if (proc == nullptr)
        return std::string{};
    return proc();
}

double firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt)
{
    using Proc = double (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_initialize_with_options");
    if (proc == nullptr)
        return double{};
    return proc(suppress_notification_permission_prompt);
}

double firebase_messaging_initialize_for_app(std::uint64_t app)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_initialize_for_app");
    if (proc == nullptr)
        return double{};
    return proc(app);
}

double firebase_messaging_initialize_for_app_with_options(std::uint64_t app, double suppress_notification_permission_prompt)
{
    using Proc = double (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("messaging", "firebase_messaging_initialize_for_app_with_options");
    if (proc == nullptr)
        return double{};
    return proc(app, suppress_notification_permission_prompt);
}

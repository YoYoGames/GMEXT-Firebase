// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
}


namespace gm_structs
{

}

namespace gm::wire::codec
{
}

namespace gm::wire::details
{
}

double firebase_messaging_initialize();
void firebase_messaging_terminate();
void firebase_messaging_set_token_registration_on_init_enabled(double enabled);
double firebase_messaging_is_token_registration_on_init_enabled();
double firebase_messaging_delivery_metrics_export_to_big_query_enabled();
void firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled);
double firebase_messaging_request_permission(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_get_token(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_delete_token(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_subscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_unsubscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_poll_message();
double firebase_messaging_poll_token();
std::string firebase_messaging_current_token();
std::string firebase_messaging_message_from();
std::string firebase_messaging_message_to();
std::string firebase_messaging_message_collapse_key();
std::string firebase_messaging_message_message_id();
std::string firebase_messaging_message_message_type();
std::string firebase_messaging_message_priority();
std::string firebase_messaging_message_original_priority();
double firebase_messaging_message_time_to_live();
double firebase_messaging_message_sent_time();
std::string firebase_messaging_message_error();
std::string firebase_messaging_message_error_description();
std::string firebase_messaging_message_link();
double firebase_messaging_message_notification_opened();
double firebase_messaging_message_data_count();
std::string firebase_messaging_message_data_key_at(double index);
std::string firebase_messaging_message_get_data(std::string_view key);
double firebase_messaging_message_raw_data_size();
double firebase_messaging_message_raw_data_copy(gm::wire::GMBuffer out_buffer);
double firebase_messaging_message_has_notification();
std::string firebase_messaging_message_notification_title();
std::string firebase_messaging_message_notification_body();
std::string firebase_messaging_message_notification_icon();
std::string firebase_messaging_message_notification_sound();
std::string firebase_messaging_message_notification_badge();
std::string firebase_messaging_message_notification_tag();
std::string firebase_messaging_message_notification_color();
std::string firebase_messaging_message_notification_click_action();
std::string firebase_messaging_message_notification_body_loc_key();
double firebase_messaging_message_notification_body_loc_args_count();
std::string firebase_messaging_message_notification_body_loc_args_at(double index);
std::string firebase_messaging_message_notification_title_loc_key();
double firebase_messaging_message_notification_title_loc_args_count();
std::string firebase_messaging_message_notification_title_loc_args_at(double index);
std::string firebase_messaging_message_notification_android_channel_id();
double firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt);
double firebase_messaging_initialize_for_app(std::uint64_t app);
double firebase_messaging_initialize_for_app_with_options(std::uint64_t app, double suppress_notification_permission_prompt);

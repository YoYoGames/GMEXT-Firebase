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

double firebase_analytics_initialize();
void firebase_analytics_terminate();
void firebase_analytics_set_analytics_collection_enabled(double enabled);
void firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization);
void firebase_analytics_log_event(std::string_view name);
void firebase_analytics_log_event_string(std::string_view name, std::string_view parameter_name, std::string_view parameter_value);
void firebase_analytics_log_event_number(std::string_view name, std::string_view parameter_name, double parameter_value);
void firebase_analytics_log_event_params(std::string_view name, const gm::wire::GMValue& params);
void firebase_analytics_set_default_event_parameters(const gm::wire::GMValue& params);
double firebase_analytics_log_apple_transaction(std::string_view transaction_id, const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_set_user_property(std::string_view name, std::string_view value);
void firebase_analytics_set_user_id(std::string_view user_id);
void firebase_analytics_set_session_timeout_duration(double milliseconds);
void firebase_analytics_reset_analytics_data();
double firebase_analytics_get_analytics_instance_id(const std::optional<gm::wire::GMFunction>& callback);
double firebase_analytics_get_session_id(const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_notify_app_lifecycle_termination();
double firebase_analytics_is_desktop_initialized();
void firebase_analytics_set_desktop_debug_mode(double enabled);
void firebase_analytics_set_log_callback(const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_initiate_on_device_conversion_measurement_email(std::string_view email_address);
void firebase_analytics_initiate_on_device_conversion_measurement_phone(std::string_view phone_number);
void firebase_analytics_notify_app_lifecycle_change(double state);
void firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(gm::wire::GMBuffer hashed_email);
void firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(gm::wire::GMBuffer hashed_phone);
double firebase_analytics_initialize_for_app(std::uint64_t app);

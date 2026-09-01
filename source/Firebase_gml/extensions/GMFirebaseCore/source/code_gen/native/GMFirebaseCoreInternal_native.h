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

double firebase_app_initialize();
double firebase_app_is_initialized();
std::string firebase_app_get_name();
double firebase_last_error_code();
std::string firebase_last_error_message();
std::uint64_t firebase_app_get_default_handle();
std::uint64_t firebase_app_get_instance(std::string_view name);
gm::wire::DataStream firebase_app_get_apps();
std::uint64_t firebase_app_initialize_with_options(const gm::wire::GMValue& options, std::string_view name);
std::uint64_t firebase_app_initialize_from_json(std::string_view json_config, std::string_view name);
std::string firebase_app_handle_get_name(std::uint64_t app);
gm::wire::DataStream firebase_app_handle_get_options(std::uint64_t app);
gm::wire::DataStream firebase_app_get_default_options();
void firebase_app_release_handle(std::uint64_t app);
void firebase_set_log_level(double level);
double firebase_get_log_level();
std::string firebase_get_sdk_version();

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

std::uint64_t firebase_functions_get_instance();
std::uint64_t firebase_functions_get_instance_with_region(std::string_view region);
void firebase_functions_use_functions_emulator(std::uint64_t functions_ref, std::string_view origin);
std::uint64_t firebase_functions_get_https_callable(std::uint64_t functions_ref, std::string_view name);
std::uint64_t firebase_functions_get_https_callable_with_options(std::uint64_t functions_ref, std::string_view name, double limited_use_app_check_token);
std::uint64_t firebase_functions_get_https_callable_from_url(std::uint64_t functions_ref, std::string_view url);
std::uint64_t firebase_functions_get_https_callable_from_url_with_options(std::uint64_t functions_ref, std::string_view url, double limited_use_app_check_token);
double firebase_functions_callable_is_valid(std::uint64_t ref);
double firebase_functions_callable_call(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_functions_callable_call_with_data(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_functions_get_app(std::uint64_t functions);
std::uint64_t firebase_functions_callable_get_functions(std::uint64_t callable);
std::uint64_t firebase_functions_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_functions_get_instance_for_app_region(std::uint64_t app, std::string_view region);

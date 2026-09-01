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
    enum class FirebaseAppCheckProvider : std::int64_t
    {
        Debug = 0,
        DeviceCheck = 1,
        PlayIntegrity = 2,
        AppAttest = 3
    };

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

void firebase_app_check_set_provider_factory(double provider);
void firebase_app_check_debug_provider_set_debug_token(std::string_view token);
void firebase_app_check_set_token_auto_refresh_enabled(double enabled);
double firebase_app_check_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_app_check_get_limited_use_token(const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_app_check_add_listener(const std::optional<gm::wire::GMFunction>& callback);
double firebase_app_check_remove_listener(std::uint64_t listener_ref);
std::uint64_t firebase_app_check_get_app();
std::uint64_t firebase_app_check_get_instance_handle();
std::uint64_t firebase_app_check_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_app_check_instance_get_app(std::uint64_t app_check);
void firebase_app_check_instance_set_token_auto_refresh_enabled(std::uint64_t app_check, bool enabled);
double firebase_app_check_instance_get_token(std::uint64_t app_check, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_app_check_instance_get_limited_use_token(std::uint64_t app_check, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_app_check_instance_add_listener(std::uint64_t app_check, const std::optional<gm::wire::GMFunction>& callback);

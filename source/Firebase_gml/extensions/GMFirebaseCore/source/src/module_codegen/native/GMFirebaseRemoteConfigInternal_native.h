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
    enum class FirebaseRemoteConfigLastFetchStatus : std::int64_t
    {
        Success = 0,
        Failure = 1,
        Pending = 2
    };

    enum class FirebaseRemoteConfigFetchFailureReason : std::int64_t
    {
        Invalid = 0,
        Throttled = 1,
        Error = 2
    };

}


namespace gm_structs
{
    struct FirebaseRemoteConfigInfo;

    struct FirebaseRemoteConfigInfo
    {
        double fetch_time;
        double last_fetch_status;
        double last_fetch_failure_reason;
        double throttled_end_time;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::FirebaseRemoteConfigInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseRemoteConfigInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.fetch_time);
        gm::wire::codec::writeValue(_buf, obj.last_fetch_status);
        gm::wire::codec::writeValue(_buf, obj.last_fetch_failure_reason);
        gm::wire::codec::writeValue(_buf, obj.throttled_end_time);
    }

    template<>
    inline gm_structs::FirebaseRemoteConfigInfo readValue<gm_structs::FirebaseRemoteConfigInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseRemoteConfigInfo obj;
        obj.fetch_time = gm::wire::codec::readValue<double>(_buf);
        obj.last_fetch_status = gm::wire::codec::readValue<double>(_buf);
        obj.last_fetch_failure_reason = gm::wire::codec::readValue<double>(_buf);
        obj.throttled_end_time = gm::wire::codec::readValue<double>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::FirebaseRemoteConfigInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

}

std::uint64_t firebase_remote_config_get_instance();
double firebase_remote_config_ensure_initialized(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_set_config_settings(std::uint64_t rc_ref, double fetch_timeout_ms, double minimum_fetch_interval_ms, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_config_settings_fetch_timeout(std::uint64_t rc_ref);
double firebase_remote_config_get_config_settings_minimum_fetch_interval(std::uint64_t rc_ref);
double firebase_remote_config_fetch(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_fetch_with_expiration(std::uint64_t rc_ref, double cache_expiration_in_seconds, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_fetch_and_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_boolean(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_long(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_double(std::uint64_t rc_ref, std::string_view key);
std::string firebase_remote_config_get_string(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_data_size(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_data(std::uint64_t rc_ref, std::string_view key, gm::wire::GMBuffer out_buffer);
double firebase_remote_config_get_keys_by_prefix(std::uint64_t rc_ref, std::string_view prefix, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_keys(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_all(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_set_defaults(std::uint64_t rc_ref, const gm::wire::GMValue& defaults, const std::optional<gm::wire::GMFunction>& callback);
gm_structs::FirebaseRemoteConfigInfo firebase_remote_config_get_info(std::uint64_t rc_ref);
std::uint64_t firebase_remote_config_add_config_update_listener(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_remove_config_update_listener(std::uint64_t reg_ref);
double firebase_remote_config_ensure_initialized_info(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
gm::wire::DataStream firebase_remote_config_get_boolean_with_info(std::uint64_t rc_ref, std::string_view key);
gm::wire::DataStream firebase_remote_config_get_long_with_info(std::uint64_t rc_ref, std::string_view key);
gm::wire::DataStream firebase_remote_config_get_double_with_info(std::uint64_t rc_ref, std::string_view key);
gm::wire::DataStream firebase_remote_config_get_string_with_info(std::uint64_t rc_ref, std::string_view key);
gm::wire::DataStream firebase_remote_config_get_data_with_info(std::uint64_t rc_ref, std::string_view key, gm::wire::GMBuffer out_buffer);
std::uint64_t firebase_remote_config_get_app(std::uint64_t remote_config);
std::uint64_t firebase_remote_config_get_instance_for_app(std::uint64_t app);

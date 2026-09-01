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
    enum class FirebaseUmpConsentStatus : std::int64_t
    {
        Unknown = 0,
        Required = 1,
        NotRequired = 2,
        Obtained = 3
    };

    enum class FirebaseUmpConsentFormStatus : std::int64_t
    {
        Unknown = 0,
        Unavailable = 1,
        Available = 2
    };

    enum class FirebaseUmpPrivacyOptionsRequirementStatus : std::int64_t
    {
        Unknown = 0,
        NotRequired = 1,
        Required = 2
    };

    enum class FirebaseUmpConsentDebugGeography : std::int64_t
    {
        Disabled = 0,
        EEA = 1,
        NonEEA = 2
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

std::optional<std::uint64_t> firebase_ump_get_instance();
double firebase_ump_get_consent_status(std::uint64_t consent_ref);
double firebase_ump_get_consent_form_status(std::uint64_t consent_ref);
double firebase_ump_get_privacy_options_requirement_status(std::uint64_t consent_ref);
double firebase_ump_can_request_ads(std::uint64_t consent_ref);
void firebase_ump_reset(std::uint64_t consent_ref);
double firebase_ump_request_consent_info_update(std::uint64_t consent_ref, double debug_geography, double tag_for_under_age_of_consent, const gm::wire::GMValue& debug_device_ids, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_load_consent_form(std::uint64_t consent_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_show_consent_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_load_and_show_consent_form_if_required(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_show_privacy_options_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
std::optional<std::uint64_t> firebase_ump_get_instance_for_app(std::uint64_t app);

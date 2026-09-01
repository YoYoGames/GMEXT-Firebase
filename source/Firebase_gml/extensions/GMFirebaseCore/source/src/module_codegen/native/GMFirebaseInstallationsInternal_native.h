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

double firebase_installations_get_id(const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_delete(const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_installations_get_app();
std::uint64_t firebase_installations_get_instance_handle();
std::uint64_t firebase_installations_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_installations_instance_get_app(std::uint64_t installations);
double firebase_installations_instance_get_id(std::uint64_t installations, const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_instance_get_token(std::uint64_t installations, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_instance_delete(std::uint64_t installations, const std::optional<gm::wire::GMFunction>& callback);

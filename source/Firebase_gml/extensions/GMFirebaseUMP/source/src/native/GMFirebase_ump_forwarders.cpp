#include <native/GMFirebaseUMPInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

std::optional<std::uint64_t> firebase_ump_get_instance()
{
    using Proc = std::optional<std::uint64_t> (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_get_instance");
    if (proc == nullptr)
        return std::optional<std::uint64_t>{};
    return proc();
}

double firebase_ump_get_consent_status(std::uint64_t consent_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_get_consent_status");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref);
}

double firebase_ump_get_consent_form_status(std::uint64_t consent_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_get_consent_form_status");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref);
}

double firebase_ump_get_privacy_options_requirement_status(std::uint64_t consent_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_get_privacy_options_requirement_status");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref);
}

double firebase_ump_can_request_ads(std::uint64_t consent_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_can_request_ads");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref);
}

void firebase_ump_reset(std::uint64_t consent_ref)
{
    using Proc = void (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_reset");
    if (proc == nullptr)
        return;
    proc(consent_ref);
}

double firebase_ump_request_consent_info_update(std::uint64_t consent_ref, double debug_geography, double tag_for_under_age_of_consent, const gm::wire::GMValue& debug_device_ids, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, double, double, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_request_consent_info_update");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref, debug_geography, tag_for_under_age_of_consent, debug_device_ids, callback);
}

double firebase_ump_load_consent_form(std::uint64_t consent_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_load_consent_form");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref, callback);
}

double firebase_ump_show_consent_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_show_consent_form");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref, form_parent, callback);
}

double firebase_ump_load_and_show_consent_form_if_required(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_load_and_show_consent_form_if_required");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref, form_parent, callback);
}

double firebase_ump_show_privacy_options_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_show_privacy_options_form");
    if (proc == nullptr)
        return double{};
    return proc(consent_ref, form_parent, callback);
}

std::optional<std::uint64_t> firebase_ump_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::optional<std::uint64_t> (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("ump", "firebase_ump_get_instance_for_app");
    if (proc == nullptr)
        return std::optional<std::uint64_t>{};
    return proc(app);
}

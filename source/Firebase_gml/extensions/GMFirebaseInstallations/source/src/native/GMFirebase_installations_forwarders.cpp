#include <native/GMFirebaseInstallationsInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

double firebase_installations_get_id(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_get_id");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

double firebase_installations_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_get_token");
    if (proc == nullptr)
        return double{};
    return proc(force_refresh, callback);
}

double firebase_installations_delete(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_delete");
    if (proc == nullptr)
        return double{};
    return proc(callback);
}

std::uint64_t firebase_installations_get_app()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_installations_get_instance_handle()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_get_instance_handle");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_installations_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

std::uint64_t firebase_installations_instance_get_app(std::uint64_t installations)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_instance_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(installations);
}

double firebase_installations_instance_get_id(std::uint64_t installations, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_instance_get_id");
    if (proc == nullptr)
        return double{};
    return proc(installations, callback);
}

double firebase_installations_instance_get_token(std::uint64_t installations, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, bool, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_instance_get_token");
    if (proc == nullptr)
        return double{};
    return proc(installations, force_refresh, callback);
}

double firebase_installations_instance_delete(std::uint64_t installations, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("installations", "firebase_installations_instance_delete");
    if (proc == nullptr)
        return double{};
    return proc(installations, callback);
}

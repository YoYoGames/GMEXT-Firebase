#include <native/GMFirebaseDatabaseInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

std::uint64_t firebase_database_get_instance()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_instance");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_database_get_instance_for_url(std::string_view url)
{
    using Proc = std::uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_instance_for_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(url);
}

std::string firebase_database_get_url(std::uint64_t db_ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_url");
    if (proc == nullptr)
        return std::string{};
    return proc(db_ref);
}

std::uint64_t firebase_database_get_reference(std::uint64_t db_ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(db_ref);
}

std::uint64_t firebase_database_get_reference_at_path(std::uint64_t db_ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_reference_at_path");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(db_ref, path);
}

std::uint64_t firebase_database_get_reference_from_url(std::uint64_t db_ref, std::string_view url)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_reference_from_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(db_ref, url);
}

double firebase_database_go_offline(std::uint64_t db_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_go_offline");
    if (proc == nullptr)
        return double{};
    return proc(db_ref);
}

double firebase_database_go_online(std::uint64_t db_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_go_online");
    if (proc == nullptr)
        return double{};
    return proc(db_ref);
}

double firebase_database_purge_outstanding_writes(std::uint64_t db_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_purge_outstanding_writes");
    if (proc == nullptr)
        return double{};
    return proc(db_ref);
}

double firebase_database_set_persistence_enabled(std::uint64_t db_ref, double enabled)
{
    using Proc = double (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_set_persistence_enabled");
    if (proc == nullptr)
        return double{};
    return proc(db_ref, enabled);
}

double firebase_database_set_log_level(std::uint64_t db_ref, gm_enums::FirebaseLogLevel log_level)
{
    using Proc = double (*)(std::uint64_t, gm_enums::FirebaseLogLevel);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_set_log_level");
    if (proc == nullptr)
        return double{};
    return proc(db_ref, log_level);
}

gm_enums::FirebaseLogLevel firebase_database_get_log_level(std::uint64_t db_ref)
{
    using Proc = gm_enums::FirebaseLogLevel (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_log_level");
    if (proc == nullptr)
        return gm_enums::FirebaseLogLevel{};
    return proc(db_ref);
}

std::uint64_t firebase_database_ref_order_by_child(std::uint64_t ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_order_by_child");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, path);
}

std::uint64_t firebase_database_ref_order_by_key(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_order_by_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_order_by_value(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_order_by_value");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_order_by_priority(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_order_by_priority");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_start_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_ref_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_start_at_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_ref_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_end_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_ref_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_end_at_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_ref_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_equal_to");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_ref_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_equal_to_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_ref_limit_to_first(std::uint64_t ref, double limit)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_limit_to_first");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, limit);
}

std::uint64_t firebase_database_ref_limit_to_last(std::uint64_t ref, double limit)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_limit_to_last");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, limit);
}

double firebase_database_ref_set_keep_synchronized(std::uint64_t ref, double keep_sync)
{
    using Proc = double (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_set_keep_synchronized");
    if (proc == nullptr)
        return double{};
    return proc(ref, keep_sync);
}

double firebase_database_ref_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get_value");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

std::uint64_t firebase_database_ref_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_add_value_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, on_value_changed, on_cancelled);
}

double firebase_database_ref_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_remove_value_listener");
    if (proc == nullptr)
        return double{};
    return proc(ref, listener_ref);
}

double firebase_database_ref_remove_all_value_listeners(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_remove_all_value_listeners");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_add_child_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
}

double firebase_database_ref_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_remove_child_listener");
    if (proc == nullptr)
        return double{};
    return proc(ref, listener_ref);
}

double firebase_database_ref_remove_all_child_listeners(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_remove_all_child_listeners");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_database_query_order_by_child(std::uint64_t ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_order_by_child");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, path);
}

std::uint64_t firebase_database_query_order_by_key(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_order_by_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_query_order_by_value(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_order_by_value");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_query_order_by_priority(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_order_by_priority");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_query_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_start_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_query_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_start_at_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_query_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_end_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_query_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_end_at_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_query_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_equal_to");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value);
}

std::uint64_t firebase_database_query_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const gm::wire::GMValue&, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_equal_to_key");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, order_value, child_key);
}

std::uint64_t firebase_database_query_limit_to_first(std::uint64_t ref, double limit)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_limit_to_first");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, limit);
}

std::uint64_t firebase_database_query_limit_to_last(std::uint64_t ref, double limit)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_limit_to_last");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, limit);
}

std::uint64_t firebase_database_query_get_reference(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_database_query_set_keep_synchronized(std::uint64_t ref, double keep_sync)
{
    using Proc = double (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_set_keep_synchronized");
    if (proc == nullptr)
        return double{};
    return proc(ref, keep_sync);
}

double firebase_database_query_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_query_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_get_value");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

std::uint64_t firebase_database_query_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_add_value_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, on_value_changed, on_cancelled);
}

double firebase_database_query_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_remove_value_listener");
    if (proc == nullptr)
        return double{};
    return proc(ref, listener_ref);
}

double firebase_database_query_remove_all_value_listeners(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_remove_all_value_listeners");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_database_query_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled)
{
    using Proc = std::uint64_t (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_add_child_listener");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
}

double firebase_database_query_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_remove_child_listener");
    if (proc == nullptr)
        return double{};
    return proc(ref, listener_ref);
}

double firebase_database_query_remove_all_child_listeners(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_remove_all_child_listeners");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_query_release(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_query_release");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

gm_structs::FirebaseDatabaseReferenceInfo firebase_database_ref_get(std::uint64_t ref)
{
    using Proc = gm_structs::FirebaseDatabaseReferenceInfo (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get");
    if (proc == nullptr)
        return gm_structs::FirebaseDatabaseReferenceInfo{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_child(std::uint64_t ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_child");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, path);
}

std::uint64_t firebase_database_ref_push(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_push");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_database_ref_go_online(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_go_online");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_ref_go_offline(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_go_offline");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_ref_set_value(std::uint64_t ref, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_set_value");
    if (proc == nullptr)
        return double{};
    return proc(ref, value, callback);
}

double firebase_database_ref_set_priority(std::uint64_t ref, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_set_priority");
    if (proc == nullptr)
        return double{};
    return proc(ref, priority, callback);
}

double firebase_database_ref_set_value_and_priority(std::uint64_t ref, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_set_value_and_priority");
    if (proc == nullptr)
        return double{};
    return proc(ref, value, priority, callback);
}

double firebase_database_ref_update_children(std::uint64_t ref, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_update_children");
    if (proc == nullptr)
        return double{};
    return proc(ref, values, callback);
}

double firebase_database_ref_remove_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_remove_value");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_database_ref_run_transaction(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_run_transaction");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_database_ref_release(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_release");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_snapshot_exists(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_exists");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_snapshot_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_database_snapshot_child(std::uint64_t ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_child");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, path);
}

double firebase_database_snapshot_has_child(std::uint64_t ref, std::string_view path)
{
    using Proc = double (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_has_child");
    if (proc == nullptr)
        return double{};
    return proc(ref, path);
}

double firebase_database_snapshot_has_children(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_has_children");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_snapshot_children_count(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_children_count");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

gm::wire::DataStream firebase_database_snapshot_get_children(std::uint64_t ref)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_get_children");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(ref);
}

std::string firebase_database_snapshot_key(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_key");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::uint64_t firebase_database_snapshot_get_reference(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

gm_structs::FirebaseDataSnapshotInfo firebase_database_snapshot_get_info(std::uint64_t snapshot)
{
    using Proc = gm_structs::FirebaseDataSnapshotInfo (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_get_info");
    if (proc == nullptr)
        return gm_structs::FirebaseDataSnapshotInfo{};
    return proc(snapshot);
}

gm::wire::DataStream firebase_database_snapshot_get_value(std::uint64_t snapshot)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_get_value");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(snapshot);
}

gm::wire::DataStream firebase_database_snapshot_get_priority(std::uint64_t snapshot)
{
    using Proc = gm::wire::DataStream (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_get_priority");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc(snapshot);
}

double firebase_database_snapshot_release(std::uint64_t snapshot)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_snapshot_release");
    if (proc == nullptr)
        return double{};
    return proc(snapshot);
}

std::string firebase_database_ref_key(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_key");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

double firebase_database_ref_is_root(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_is_root");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_database_ref_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_get_parent(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get_parent");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_get_root(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get_root");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::uint64_t firebase_database_ref_get_database(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get_database");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::string firebase_database_ref_get_url(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_get_url");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

gm::wire::DataStream firebase_database_server_timestamp()
{
    using Proc = gm::wire::DataStream (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_server_timestamp");
    if (proc == nullptr)
        return gm::wire::DataStream{};
    return proc();
}

std::uint64_t firebase_database_ref_on_disconnect(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_ref_on_disconnect");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_database_on_disconnect_cancel(std::uint64_t handler, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_cancel");
    if (proc == nullptr)
        return double{};
    return proc(handler, callback);
}

double firebase_database_on_disconnect_remove_value(std::uint64_t handler, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_remove_value");
    if (proc == nullptr)
        return double{};
    return proc(handler, callback);
}

double firebase_database_on_disconnect_set_value(std::uint64_t handler, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_set_value");
    if (proc == nullptr)
        return double{};
    return proc(handler, value, callback);
}

double firebase_database_on_disconnect_set_value_and_priority(std::uint64_t handler, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_set_value_and_priority");
    if (proc == nullptr)
        return double{};
    return proc(handler, value, priority, callback);
}

double firebase_database_on_disconnect_update_children(std::uint64_t handler, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_update_children");
    if (proc == nullptr)
        return double{};
    return proc(handler, values, callback);
}

void firebase_database_on_disconnect_release(std::uint64_t handler)
{
    using Proc = void (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_on_disconnect_release");
    if (proc == nullptr)
        return;
    proc(handler);
}

std::uint64_t firebase_database_get_app(std::uint64_t database)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(database);
}

std::uint64_t firebase_database_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

std::uint64_t firebase_database_get_instance_for_app_url(std::uint64_t app, std::string_view url)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("database", "firebase_database_get_instance_for_app_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app, url);
}

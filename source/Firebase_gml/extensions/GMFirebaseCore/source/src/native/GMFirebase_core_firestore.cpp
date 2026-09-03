// Cloud Firestore - Firestore instance/settings, CollectionReference,
// DocumentReference, Query (also serves CollectionReference, since it
// publicly inherits from Query), WriteBatch, FieldValue sentinel/explicit-
// typed constructors and accessors, FieldPath, Filter, AggregateQuery/
// AggregateQuerySnapshot, bundles/named queries, and the FieldValue<->
// gm::wire converter.
//
// This is GMFirebaseFirestore's former GMFirebase_firestore.cpp, moved here
// because only GMFirebaseCore now statically links the Firebase C++ SDK.
// Bodies are unchanged except: names moved into the gmfb_firestore::
// namespace to match the symbols gmfirebase_core_resolve_firestore_proc()
// resolves for GMFirebaseFirestore (see GMFirebase_core_firestore_resolver.cpp);
// pushFieldValueToArray/
// addFieldValueToStruct take their stream argument first (matching this
// file's other converters) instead of last; and resolveFieldPath/
// resolveFilter/resolveAggregateQuery/resolveAggregateSnapshot are public,
// bool-returning, out-param helpers (GMFirebaseFirestoreImpl.h's contract)
// instead of private pointer-returning ones, since Query/Filter helpers
// living in GMFirebase_core_firestore_snapshot.cpp need them too.
//
// DocumentSnapshot, QuerySnapshot and ListenerRegistration removal live in
// GMFirebase_core_firestore_snapshot.cpp (sharing this file's registries/
// converters, declared in GMFirebase_core_firestore_impl.h); Transaction is
// an intentional limitation (see run_transaction() below).
#include "GMFirebase_core_firestore_impl.h"
#include "GMFirebase_common.h"
#include "firebase/firestore.h"
#include <algorithm>
#include <cmath>
#include <cstring>

using namespace gm::wire;

namespace gmfb_firestore
{
    // ============================================================
    // Value-copy registries (declared extern in GMFirebase_core_firestore_impl.h)
    // ============================================================

    std::map<uint32_t, firebase::firestore::DocumentReference> g_fs_doc_ref_map;
    uint32_t g_fs_doc_ref_index = 0;

    std::map<uint32_t, firebase::firestore::CollectionReference> g_fs_col_ref_map;
    uint32_t g_fs_col_ref_index = 0;

    std::map<uint32_t, firebase::firestore::Query> g_fs_query_map;
    uint32_t g_fs_query_index = 0;

    std::map<uint32_t, firebase::firestore::WriteBatch> g_fs_write_batch_map;
    uint32_t g_fs_write_batch_index = 0;

    std::map<uint32_t, firebase::firestore::FieldValue> g_fs_field_value_map;
    uint32_t g_fs_field_value_index = 0;

    std::map<uint32_t, firebase::firestore::FieldPath> g_fs_field_path_map;
    uint32_t g_fs_field_path_index = 0;

    std::map<uint32_t, firebase::firestore::Filter> g_fs_filter_map;
    uint32_t g_fs_filter_index = 0;

    std::map<uint32_t, firebase::firestore::AggregateQuery> g_fs_aggregate_query_map;
    uint32_t g_fs_aggregate_query_index = 0;

    std::map<uint32_t, firebase::firestore::AggregateQuerySnapshot> g_fs_aggregate_snapshot_map;
    uint32_t g_fs_aggregate_snapshot_index = 0;

    // g_fs_doc_snapshot_map/g_fs_doc_snapshot_index and
    // g_fs_query_snapshot_map/g_fs_query_snapshot_index are defined in
    // GMFirebase_core_firestore_snapshot.cpp.

    uint64_t registerFirestoreDocRef(const firebase::firestore::DocumentReference& ref)
    {
        uint32_t id = registerFirebaseValue(ref, g_fs_doc_ref_index, g_fs_doc_ref_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_DOC_REF);
    }

    uint64_t registerFirestoreColRef(const firebase::firestore::CollectionReference& ref)
    {
        uint32_t id = registerFirebaseValue(ref, g_fs_col_ref_index, g_fs_col_ref_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_COL_REF);
    }

    uint64_t registerFirestoreQuery(const firebase::firestore::Query& query)
    {
        uint32_t id = registerFirebaseValue(query, g_fs_query_index, g_fs_query_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_QUERY);
    }

    uint64_t registerFirestoreWriteBatch(const firebase::firestore::WriteBatch& batch)
    {
        uint32_t id = registerFirebaseValue(batch, g_fs_write_batch_index, g_fs_write_batch_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_WRITE_BATCH);
    }

    uint64_t registerFirestoreFieldValue(const firebase::firestore::FieldValue& value)
    {
        uint32_t id = registerFirebaseValue(value, g_fs_field_value_index, g_fs_field_value_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FIELD_VALUE);
    }

    uint64_t registerFirestoreFieldPath(const firebase::firestore::FieldPath& value)
    {
        uint32_t id = registerFirebaseValue(value, g_fs_field_path_index, g_fs_field_path_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FIELD_PATH);
    }

    uint64_t registerFirestoreFilter(const firebase::firestore::Filter& value)
    {
        uint32_t id = registerFirebaseValue(value, g_fs_filter_index, g_fs_filter_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FILTER);
    }

    uint64_t registerFirestoreAggregateQuery(const firebase::firestore::AggregateQuery& value)
    {
        uint32_t id = registerFirebaseValue(value, g_fs_aggregate_query_index, g_fs_aggregate_query_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_AGG_QUERY);
    }

    uint64_t registerFirestoreAggregateSnapshot(const firebase::firestore::AggregateQuerySnapshot& value)
    {
        uint32_t id = registerFirebaseValue(value, g_fs_aggregate_snapshot_index, g_fs_aggregate_snapshot_map);
        return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT);
    }

    // CollectionReference publicly inherits from Query - slicing it down to a
    // plain Query copy just copies its shared internal pimpl pointer, so a
    // single set of query_*() functions can serve both ref types without
    // duplicating every Where/OrderBy/Limit/Get function.
    bool resolveFirestoreQuery(uint64_t ref, firebase::firestore::Query& out)
    {
        if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT)
        {
            if (gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_QUERY)
            {
                auto it = g_fs_query_map.find(gm_fb_ref_id(ref));
                if (it != g_fs_query_map.end())
                {
                    out = it->second;
                    return true;
                }
            }
            else if (gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_COL_REF)
            {
                auto it = g_fs_col_ref_map.find(gm_fb_ref_id(ref));
                if (it != g_fs_col_ref_map.end())
                {
                    out = it->second; // CollectionReference -> Query slice
                    return true;
                }
            }
        }

        setFirebaseLastError(-1, "invalid handle");
        return false;
    }

    firebase::firestore::Firestore* resolveFirestore(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = nullptr;
        validate_fb_ref_ptr(instance_ref, GM_FB_TYPE_FIRESTORE, firebase::firestore::Firestore, fs);
        return fs;
    }

    bool resolveFieldPath(uint64_t ref, firebase::firestore::FieldPath& out)
    {
        firebase::firestore::FieldPath* fp = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FIELD_PATH, firebase::firestore::FieldPath, g_fs_field_path_map, fp);
        if (fp == nullptr) return false;
        out = *fp;
        return true;
    }

    bool resolveFilter(uint64_t ref, firebase::firestore::Filter& out)
    {
        firebase::firestore::Filter* filter = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FILTER, firebase::firestore::Filter, g_fs_filter_map, filter);
        if (filter == nullptr) return false;
        out = *filter;
        return true;
    }

    bool resolveAggregateQuery(uint64_t ref, firebase::firestore::AggregateQuery& out)
    {
        firebase::firestore::AggregateQuery* q = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_AGG_QUERY, firebase::firestore::AggregateQuery, g_fs_aggregate_query_map, q);
        if (q == nullptr) return false;
        out = *q;
        return true;
    }

    bool resolveAggregateSnapshot(uint64_t ref, firebase::firestore::AggregateQuerySnapshot& out)
    {
        firebase::firestore::AggregateQuerySnapshot* s = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT, firebase::firestore::AggregateQuerySnapshot, g_fs_aggregate_snapshot_map, s);
        if (s == nullptr) return false;
        out = *s;
        return true;
    }

    // ============================================================
    // FieldValue <-> gm::wire converters
    // ============================================================

    void pushFieldValueToArray(gm::wire::ArrayStream& array, const firebase::firestore::FieldValue& value)
    {
        switch (value.type())
        {
        case firebase::firestore::FieldValue::Type::kBoolean:
            array.push(value.boolean_value());
            break;

        case firebase::firestore::FieldValue::Type::kInteger:
            // GML has no int64 - crosses as a double, same convention used
            // everywhere else in this extension. Use field_value_integer()
            // on the way back in if the exact stored type matters.
            array.push(static_cast<double>(value.integer_value()));
            break;

        case firebase::firestore::FieldValue::Type::kDouble:
            array.push(value.double_value());
            break;

        case firebase::firestore::FieldValue::Type::kString:
            array.push(std::string_view{ value.string_value() });
            break;

        case firebase::firestore::FieldValue::Type::kBlob:
            array.push(std::string_view{ reinterpret_cast<const char*>(value.blob_value()), value.blob_size() });
            break;

        case firebase::firestore::FieldValue::Type::kReference:
            // Encoded as a plain GM_FB_TYPE_FIRESTORE_DOC_REF ref (a real number),
            // consistent with every other reference-typed value in this extension.
            array.push(static_cast<double>(registerFirestoreDocRef(value.reference_value())));
            break;

        case firebase::firestore::FieldValue::Type::kGeoPoint:
        {
            firebase::firestore::GeoPoint gp = value.geo_point_value();
            gm::wire::StructStream nested;
            nested.add("type", std::string_view{ "geopoint" });
            nested.add("latitude", gp.latitude());
            nested.add("longitude", gp.longitude());
            array.push(nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kTimestamp:
        {
            firebase::Timestamp ts = value.timestamp_value();
            gm::wire::StructStream nested;
            nested.add("type", std::string_view{ "timestamp" });
            nested.add("seconds", static_cast<double>(ts.seconds()));
            nested.add("nanoseconds", static_cast<double>(ts.nanoseconds()));
            array.push(nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kArray:
        {
            gm::wire::ArrayStream nested;
            for (const auto& elem : value.array_value())
                pushFieldValueToArray(nested, elem);
            array.push(nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kMap:
        {
            gm::wire::StructStream nested;
            for (const auto& kv : value.map_value())
                addFieldValueToStruct(nested, kv.first, kv.second);
            array.push(nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kNull:
        case firebase::firestore::FieldValue::Type::kDelete:
        case firebase::firestore::FieldValue::Type::kServerTimestamp:
        case firebase::firestore::FieldValue::Type::kArrayUnion:
        case firebase::firestore::FieldValue::Type::kArrayRemove:
        case firebase::firestore::FieldValue::Type::kIncrementInteger:
        case firebase::firestore::FieldValue::Type::kIncrementDouble:
        default:
            // The sentinel kinds are write-only - the server always resolves
            // them to a concrete value before a document is ever read back, so
            // this default only defends against an invalid/default-constructed
            // FieldValue. No push(undefined) overload exists on ArrayStream, but
            // its inherited operator<< resolves std::optional<T> to a
            // GMKind::Undefined write, exactly like the Variant converters.
            array << std::optional<std::uint8_t>{};
            break;
        }
    }

    void addFieldValueToStruct(gm::wire::StructStream& obj, const std::string& key, const firebase::firestore::FieldValue& value)
    {
        switch (value.type())
        {
        case firebase::firestore::FieldValue::Type::kBoolean:
            obj.add(key.c_str(), value.boolean_value());
            break;

        case firebase::firestore::FieldValue::Type::kInteger:
            obj.add(key.c_str(), static_cast<double>(value.integer_value()));
            break;

        case firebase::firestore::FieldValue::Type::kDouble:
            obj.add(key.c_str(), value.double_value());
            break;

        case firebase::firestore::FieldValue::Type::kString:
            obj.add(key.c_str(), std::string_view{ value.string_value() });
            break;

        case firebase::firestore::FieldValue::Type::kBlob:
            obj.add(key.c_str(), std::string_view{ reinterpret_cast<const char*>(value.blob_value()), value.blob_size() });
            break;

        case firebase::firestore::FieldValue::Type::kReference:
            obj.add(key.c_str(), static_cast<double>(registerFirestoreDocRef(value.reference_value())));
            break;

        case firebase::firestore::FieldValue::Type::kGeoPoint:
        {
            firebase::firestore::GeoPoint gp = value.geo_point_value();
            gm::wire::StructStream nested;
            nested.add("type", std::string_view{ "geopoint" });
            nested.add("latitude", gp.latitude());
            nested.add("longitude", gp.longitude());
            obj.add(key.c_str(), nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kTimestamp:
        {
            firebase::Timestamp ts = value.timestamp_value();
            gm::wire::StructStream nested;
            nested.add("type", std::string_view{ "timestamp" });
            nested.add("seconds", static_cast<double>(ts.seconds()));
            nested.add("nanoseconds", static_cast<double>(ts.nanoseconds()));
            obj.add(key.c_str(), nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kArray:
        {
            gm::wire::ArrayStream nested;
            for (const auto& elem : value.array_value())
                pushFieldValueToArray(nested, elem);
            obj.add(key.c_str(), nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kMap:
        {
            gm::wire::StructStream nested;
            for (const auto& kv : value.map_value())
                addFieldValueToStruct(nested, kv.first, kv.second);
            obj.add(key.c_str(), nested);
            break;
        }

        case firebase::firestore::FieldValue::Type::kNull:
        case firebase::firestore::FieldValue::Type::kDelete:
        case firebase::firestore::FieldValue::Type::kServerTimestamp:
        case firebase::firestore::FieldValue::Type::kArrayUnion:
        case firebase::firestore::FieldValue::Type::kArrayRemove:
        case firebase::firestore::FieldValue::Type::kIncrementInteger:
        case firebase::firestore::FieldValue::Type::kIncrementDouble:
        default:
            obj.addKeyValue(key, std::optional<std::uint8_t>{});
            break;
        }
    }

    namespace
    {
        // Embeddable Firestore helper handles (FieldValue/FieldPath/Filter) are
        // intentionally surfaced to GML as exact doubles. The packed handle layout
        // uses only 50 bits, so every handle is losslessly representable in a GML
        // real and GMValue can decode it even when nested inside structs/arrays.
        // Normal identity handles can remain uint64 on the typed API surface.
        //
        // Reinterprets a plain inbound double as one of this extension's packed
        // refs (see GMFirebase_common.h's ext/type bit layout) if - and only if -
        // its value exactly matches the reserved bit pattern. Real user data
        // numbers never land in that range (the packed layout needs the
        // equivalent of roughly 2^40 or higher), so this is safe, the same
        // assumption every other packed-ref-as-double value in this extension
        // already relies on.
        bool tryDecodeFirestoreRefDouble(double d, uint64_t& out_ref)
        {
            if (d < 0.0 || std::floor(d) != d || d >= 18446744073709551615.0)
                return false;

            out_ref = static_cast<uint64_t>(d);
            return gm_fb_ref_ext(out_ref) == GM_FIREBASE_EXT;
        }

        // FieldValue value-object handles (not sentinel/typed constructors -
        // those are registered too, but resolved back the same way here).
        firebase::firestore::FieldValue* resolveFieldValueHandle(uint64_t ref)
        {
            firebase::firestore::FieldValue* out = nullptr;
            validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FIELD_VALUE, firebase::firestore::FieldValue, g_fs_field_value_map, out);
            return out;
        }
    }

    firebase::firestore::FieldValue gmValueToFieldValue(const gm::wire::GMValue& value)
    {
        using gm::wire::GMArrayView;
        using gm::wire::GMObjectView;
        using firebase::firestore::FieldValue;

        if (value.is<double>())
        {
            double d = value.as<double>();
            uint64_t as_ref = 0;
            if (tryDecodeFirestoreRefDouble(d, as_ref))
            {
                uint8_t type = gm_fb_ref_type(as_ref);
                if (type == GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
                {
                    auto it = g_fs_field_value_map.find(gm_fb_ref_id(as_ref));
                    if (it != g_fs_field_value_map.end())
                        return it->second;
                }
                else if (type == GM_FB_TYPE_FIRESTORE_DOC_REF)
                {
                    auto it = g_fs_doc_ref_map.find(gm_fb_ref_id(as_ref));
                    if (it != g_fs_doc_ref_map.end())
                        return FieldValue::Reference(it->second);
                }
            }
            return FieldValue::Double(d);
        }

        if (value.is<bool>())
            return FieldValue::Boolean(value.as<bool>());

        if (value.is<std::string_view>())
            return FieldValue::String(std::string(value.as<std::string_view>()));

        if (value.is<GMArrayView>())
        {
            std::vector<FieldValue> items;
            auto view = value.as<GMArrayView>();
            items.reserve(view.size());
            for (const auto& element : view)
                items.push_back(gmValueToFieldValue(element));
            return FieldValue::Array(std::move(items));
        }

        if (value.is<GMObjectView>())
        {
            firebase::firestore::MapFieldValue map;
            auto view = value.as<GMObjectView>();
            for (const auto& pair : view)
                map[std::string(pair.first)] = gmValueToFieldValue(pair.second);
            return FieldValue::Map(std::move(map));
        }

        return FieldValue::Null();
    }

    firebase::firestore::MapFieldValue gmValueToMapFieldValue(const gm::wire::GMValue& value)
    {
        firebase::firestore::MapFieldValue result;
        if (!value.is<gm::wire::GMObjectView>())
            return result;

        auto view = value.as<gm::wire::GMObjectView>();
        for (const auto& pair : view)
            result[std::string(pair.first)] = gmValueToFieldValue(pair.second);
        return result;
    }

    std::vector<firebase::firestore::FieldValue> gmValueToFieldValueVector(const gm::wire::GMValue& value)
    {
        std::vector<firebase::firestore::FieldValue> result;
        if (!value.is<gm::wire::GMArrayView>())
            return result;

        auto view = value.as<gm::wire::GMArrayView>();
        result.reserve(view.size());
        for (const auto& element : view)
            result.push_back(gmValueToFieldValue(element));
        return result;
    }

    std::vector<std::string> gmValueToStringVector(const gm::wire::GMValue& value)
    {
        std::vector<std::string> result;
        if (!value.is<gm::wire::GMArrayView>())
            return result;

        auto view = value.as<gm::wire::GMArrayView>();
        result.reserve(view.size());
        for (const auto& element : view)
        {
            if (element.is<std::string_view>())
                result.emplace_back(element.as<std::string_view>());
        }
        return result;
    }

    std::vector<firebase::firestore::FieldPath> gmValueToFieldPathVector(const gm::wire::GMValue& value)
    {
        std::vector<firebase::firestore::FieldPath> out;
        if (!value.is<gm::wire::GMArrayView>()) return out;
        auto a = value.as<gm::wire::GMArrayView>();
        out.reserve(a.size());
        for (const auto& item : a)
        {
            if (!item.is<double>()) continue;
            uint64_t ref = static_cast<uint64_t>(item.as<double>());
            firebase::firestore::FieldPath fp;
            if (resolveFieldPath(ref, fp)) out.push_back(fp);
        }
        return out;
    }

    std::vector<firebase::firestore::Filter> gmValueToFilterVector(const gm::wire::GMValue& value)
    {
        std::vector<firebase::firestore::Filter> out;
        if (!value.is<gm::wire::GMArrayView>()) return out;
        auto a = value.as<gm::wire::GMArrayView>();
        out.reserve(a.size());
        for (const auto& item : a)
        {
            if (!item.is<double>()) continue;
            uint64_t ref = static_cast<uint64_t>(item.as<double>());
            firebase::firestore::Filter filter = firebase::firestore::Filter::EqualTo(std::string(), firebase::firestore::FieldValue::Null());
            if (resolveFilter(ref, filter)) out.push_back(filter);
        }
        return out;
    }

    firebase::firestore::MapFieldPathValue gmValueToMapFieldPathValue(const gm::wire::GMValue& value)
    {
        firebase::firestore::MapFieldPathValue out;
        if (!value.is<gm::wire::GMArrayView>()) return out;
        auto entries = value.as<gm::wire::GMArrayView>();
        for (const auto& entry : entries)
        {
            if (!entry.is<gm::wire::GMObjectView>()) continue;
            auto obj = entry.as<gm::wire::GMObjectView>();
            uint64_t path_ref = 0;
            std::optional<firebase::firestore::FieldValue> parsed_value;
            for (const auto& pair : obj)
            {
                if (pair.first == "field_path" && pair.second.is<double>())
                    path_ref = static_cast<uint64_t>(pair.second.as<double>());
                else if (pair.first == "value")
                    parsed_value = gmValueToFieldValue(pair.second);
            }
            firebase::firestore::FieldPath path;
            if (resolveFieldPath(path_ref, path) && parsed_value.has_value())
                out.emplace(path, std::move(*parsed_value));
        }
        return out;
    }

    gm::wire::StructStream loadBundleProgressStruct(const firebase::firestore::LoadBundleTaskProgress& progress)
    {
        gm::wire::StructStream out;
        out.add("documents_loaded", static_cast<double>(progress.documents_loaded()));
        out.add("total_documents", static_cast<double>(progress.total_documents()));
        out.add("bytes_loaded", static_cast<double>(progress.bytes_loaded()));
        out.add("total_bytes", static_cast<double>(progress.total_bytes()));
        out.add("state", static_cast<double>(progress.state()));
        return out;
    }

    // ============================================================
    // FieldValue sentinels + explicit-typed value constructors
    // ============================================================
    // Every one of these mints a GM_FB_TYPE_FIRESTORE_FIELD_VALUE ref that only
    // makes sense fed back into a data map passed to Set/Update/Add/WriteBatch
    // (or, for field_value_reference, also usable directly wherever a
    // FieldValue is expected, e.g. WhereEqualTo). gmValueToFieldValue() resolves
    // the ref back to the concrete FieldValue it was registered with.

    double field_value_delete()
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Delete()));
    }

    double field_value_server_timestamp()
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::ServerTimestamp()));
    }

    double field_value_array_union(const gm::wire::GMValue& values)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::ArrayUnion(gmValueToFieldValueVector(values))));
    }

    double field_value_array_remove(const gm::wire::GMValue& values)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::ArrayRemove(gmValueToFieldValueVector(values))));
    }

    double field_value_increment_integer(double value)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Increment<int64_t>(static_cast<int64_t>(value))));
    }

    double field_value_increment_double(double value)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Increment<double>(value)));
    }

    double field_value_integer(double value)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Integer(static_cast<int64_t>(value))));
    }

    double field_value_double(double value)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Double(value)));
    }

    double field_value_timestamp(double seconds, double nanoseconds)
    {
        firebase::Timestamp ts(static_cast<int64_t>(seconds), static_cast<int32_t>(nanoseconds));
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Timestamp(ts)));
    }

    double field_value_geo_point(double latitude, double longitude)
    {
        firebase::firestore::GeoPoint gp(latitude, longitude);
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::GeoPoint(gp)));
    }

    double field_value_reference(uint64_t document_ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr)
            return 0;

        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Reference(*doc)));
    }

    double field_value_blob(std::string_view data)
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Blob(reinterpret_cast<const uint8_t*>(data.data()), data.size())));
    }

    double field_value_null()
    {
        return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Null()));
    }

    void field_value_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
        {
            setFirebaseLastError(-1, "invalid handle");
            return;
        }
        unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_field_value_map);
    }

    // ============================================================
    // Firestore instance / settings / lifecycle
    // ============================================================

    uint64_t get_instance()
    {
        firebase::App* app = getFirebaseApp();
        if (app == nullptr)
        {
            setFirebaseLastError(-1, "gmfb_firestore::get_instance: no firebase::App - call firebase_app_initialize() first");
            return 0;
        }

        firebase::InitResult init_result = firebase::kInitResultSuccess;
        firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, &init_result);
        if (fs == nullptr || init_result != firebase::kInitResultSuccess)
        {
            setFirebaseLastError(-1, "gmfb_firestore::get_instance: Firestore::GetInstance() failed");
            return 0;
        }

        uint64_t ref = registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
        return ref;
    }

    uint64_t get_instance_for_database(std::string_view database_name)
    {
        firebase::App* app = getFirebaseApp();
        if (app == nullptr)
        {
            setFirebaseLastError(-1, "gmfb_firestore::get_instance_for_database: no firebase::App - call firebase_app_initialize() first");
            return 0;
        }

        std::string name(database_name);
        firebase::InitResult init_result = firebase::kInitResultSuccess;
        firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, name.c_str(), &init_result);
        if (fs == nullptr || init_result != firebase::kInitResultSuccess)
        {
            setFirebaseLastError(-1, "gmfb_firestore::get_instance_for_database: Firestore::GetInstance() failed");
            return 0;
        }

        return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
    }

    std::string settings_get_host(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return std::string();
        return fs->settings().host();
    }

    void settings_set_host(uint64_t instance_ref, std::string_view host)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return;
        firebase::firestore::Settings s = fs->settings();
        s.set_host(std::string(host));
        fs->set_settings(s);
    }

    bool settings_get_ssl_enabled(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return false;
        return fs->settings().is_ssl_enabled();
    }

    void settings_set_ssl_enabled(uint64_t instance_ref, bool enabled)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return;
        firebase::firestore::Settings s = fs->settings();
        s.set_ssl_enabled(enabled);
        fs->set_settings(s);
    }

    bool settings_get_persistence_enabled(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return false;
        return fs->settings().is_persistence_enabled();
    }

    void settings_set_persistence_enabled(uint64_t instance_ref, bool enabled)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return;
        firebase::firestore::Settings s = fs->settings();
        s.set_persistence_enabled(enabled);
        fs->set_settings(s);
    }

    double settings_get_cache_size_bytes(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;
        return static_cast<double>(fs->settings().cache_size_bytes());
    }

    void settings_set_cache_size_bytes(uint64_t instance_ref, double bytes)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return;
        firebase::firestore::Settings s = fs->settings();
        s.set_cache_size_bytes(static_cast<int64_t>(bytes));
        fs->set_settings(s);
    }

    uint64_t collection(uint64_t instance_ref, std::string_view path)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr)
            return 0;
        uint64_t ref = registerFirestoreColRef(fs->Collection(std::string(path)));
        return ref;
    }

    uint64_t document(uint64_t instance_ref, std::string_view path)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr)
            return 0;
        uint64_t ref = registerFirestoreDocRef(fs->Document(std::string(path)));
        return ref;
    }

    uint64_t collection_group(uint64_t instance_ref, std::string_view collection_id)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0;
        return registerFirestoreQuery(fs->CollectionGroup(std::string(collection_id)));
    }

    uint64_t batch(uint64_t instance_ref)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0;
        return registerFirestoreWriteBatch(fs->batch());
    }

    void set_log_level(double level)
    {
        firebase::firestore::Firestore::set_log_level(static_cast<firebase::LogLevel>(static_cast<int>(level)));
    }

    double enable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;

        fs->EnableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double disable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;

        fs->DisableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    // After this future completes, `instance_ref` (and every ref derived from
    // it) must not be used again - the underlying Firestore* is destroyed.
    double terminate(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;

        fs->Terminate().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double clear_persistence(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;

        fs->ClearPersistence().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double wait_for_pending_writes(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (fs == nullptr) return 0.0;

        fs->WaitForPendingWrites().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    // ============================================================
    // Transaction - intentional limitation
    // ============================================================
    // firebase::firestore::Transaction cannot be copied and is only valid inside
    // the std::function<Error(Transaction&, std::string&)> RunTransaction hands
    // it to, where every Get/Set/Update/Delete call must complete synchronously
    // before that function returns (RunTransaction retries the whole function on
    // contention). Bridging that into a GML callback safely - keeping the
    // Transaction& alive and re-entrant-safe for the duration of a GML callback
    // invocation, handling retries, and surfacing Get()'s out-parameter error
    // reporting - is a substantial piece of work of its own and was explicitly
    // not representable safely by the current asynchronous callback bridge.
    // Callers get a clear, typed "not implemented" error instead of a
    // partially-working handle.
    double run_transaction(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        (void)instance_ref;

        const int code = firebase::firestore::kErrorUnimplemented;
        const char* message = "gmfb_firestore::run_transaction: a synchronous/retryable GML transaction handler is not safely representable by the current callback bridge.";
        setFirebaseLastError(code, message);
        if (callback.has_value())
            callback->call((double)code, std::string_view{ message });
        return 0.0;
    }

    // ============================================================
    // CollectionReference
    // ============================================================

    std::string collection_ref_id(uint64_t ref)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return std::string();
        return col->id();
    }

    std::string collection_ref_path(uint64_t ref)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return std::string();
        return col->path();
    }

    uint64_t collection_ref_parent(uint64_t ref)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return 0;
        return registerFirestoreDocRef(col->Parent());
    }

    uint64_t collection_ref_document(uint64_t ref)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return 0;
        return registerFirestoreDocRef(col->Document());
    }

    uint64_t collection_ref_document_path(uint64_t ref, std::string_view path)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return 0;
        return registerFirestoreDocRef(col->Document(std::string(path)));
    }

    double collection_ref_add(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return 0.0;

        firebase::firestore::MapFieldValue map = gmValueToMapFieldValue(data);
        col->Add(map).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentReference>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback.has_value())
                return;

            std::optional<uint64_t> doc_ref;
            if (f.error() == 0 && f.result() != nullptr)
                doc_ref = registerFirestoreDocRef(*f.result());

            callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, doc_ref);
        });
        return 1.0;
    }

    bool collection_ref_is_valid(uint64_t ref)
    {
        firebase::firestore::CollectionReference* col = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
        if (col == nullptr) return false;
        return col->is_valid();
    }

    void collection_ref_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_COL_REF)
        {
            setFirebaseLastError(-1, "invalid handle");
            return;
        }
        unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_col_ref_map);
    }

    // ============================================================
    // DocumentReference
    // ============================================================

    std::string document_ref_id(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return std::string();
        return doc->id();
    }

    std::string document_ref_path(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return std::string();
        return doc->path();
    }

    uint64_t document_ref_parent(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0;
        return registerFirestoreColRef(doc->Parent());
    }

    uint64_t document_ref_collection(uint64_t ref, std::string_view path)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0;
        return registerFirestoreColRef(doc->Collection(std::string(path)));
    }

    double document_ref_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        auto src = static_cast<firebase::firestore::Source>(static_cast<int>(source));
        doc->Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentSnapshot>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback.has_value())
                return;

            std::optional<uint64_t> snapshot_ref;
            if (f.error() == 0 && f.result() != nullptr)
                snapshot_ref = registerFirestoreDocSnapshot(*f.result());

            callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, snapshot_ref);
        });
        return 1.0;
    }

    double document_ref_set(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        doc->Set(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double document_ref_set_merge(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        doc->Set(gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge()).OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double document_ref_set_merge_fields(uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        auto options = firebase::firestore::SetOptions::MergeFields(gmValueToStringVector(fields));
        doc->Set(gmValueToMapFieldValue(data), options).OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double document_ref_update(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        doc->Update(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double document_ref_delete(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        doc->Delete().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    // Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
    // listener_registration_remove(). Firebase invokes the listener on its own
    // background/UI thread; GMFunction::call() is internally mutex-guarded, so
    // `cb` is dispatched directly with no extra queue.
    uint64_t document_ref_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
    {
        if (!callback.has_value())
        {
            setFirebaseLastError(-1, "gmfb_firestore::document_ref_add_snapshot_listener: a callback is required");
            return 0;
        }

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0;

        auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
        gm::wire::GMFunction cb = callback.value();

        firebase::firestore::ListenerRegistration* reg = new firebase::firestore::ListenerRegistration(
            doc->AddSnapshotListener(mc, [cb](const firebase::firestore::DocumentSnapshot& snapshot, firebase::firestore::Error error, const std::string& error_message)
            {
                if (error != firebase::firestore::kErrorOk)
                    setFirebaseLastError((int)error, error_message);

                uint64_t snapshot_ref = 0;
                if (error == firebase::firestore::kErrorOk)
                    snapshot_ref = registerFirestoreDocSnapshot(snapshot);

                cb.call((double)error, std::string_view{ error_message }, snapshot_ref);
            }));

        return registerFirebasePointer(reg, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
    }

    bool document_ref_is_valid(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return false;
        return doc->is_valid();
    }

    void document_ref_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_DOC_REF)
        {
            setFirebaseLastError(-1, "invalid handle");
            return;
        }
        unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_doc_ref_map);
    }

    // ============================================================
    // Query (also serves CollectionReference refs - see resolveFirestoreQuery)
    // ============================================================

    uint64_t query_where_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereEqualTo(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_not_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereNotEqualTo(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_less_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereLessThan(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_less_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereLessThanOrEqualTo(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_greater_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereGreaterThan(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_greater_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereGreaterThanOrEqualTo(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_array_contains(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereArrayContains(std::string(field), gmValueToFieldValue(value)));
    }

    uint64_t query_where_array_contains_any(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereArrayContainsAny(std::string(field), gmValueToFieldValueVector(values)));
    }

    uint64_t query_where_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereIn(std::string(field), gmValueToFieldValueVector(values)));
    }

    uint64_t query_where_not_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.WhereNotIn(std::string(field), gmValueToFieldValueVector(values)));
    }

    uint64_t query_order_by(uint64_t ref, std::string_view field, double direction)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        auto dir = static_cast<firebase::firestore::Query::Direction>(static_cast<int>(direction));
        return registerFirestoreQuery(q.OrderBy(std::string(field), dir));
    }

    uint64_t query_limit(uint64_t ref, double limit)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.Limit(static_cast<int32_t>(limit)));
    }

    uint64_t query_limit_to_last(uint64_t ref, double limit)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.LimitToLast(static_cast<int32_t>(limit)));
    }

    uint64_t query_start_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        if (snap == nullptr) return 0;
        return registerFirestoreQuery(q.StartAt(*snap));
    }

    uint64_t query_start_at_values(uint64_t ref, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.StartAt(gmValueToFieldValueVector(values)));
    }

    uint64_t query_start_after_snapshot(uint64_t ref, uint64_t snapshot_ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        if (snap == nullptr) return 0;
        return registerFirestoreQuery(q.StartAfter(*snap));
    }

    uint64_t query_start_after_values(uint64_t ref, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.StartAfter(gmValueToFieldValueVector(values)));
    }

    uint64_t query_end_before_snapshot(uint64_t ref, uint64_t snapshot_ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        if (snap == nullptr) return 0;
        return registerFirestoreQuery(q.EndBefore(*snap));
    }

    uint64_t query_end_before_values(uint64_t ref, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.EndBefore(gmValueToFieldValueVector(values)));
    }

    uint64_t query_end_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        if (snap == nullptr) return 0;
        return registerFirestoreQuery(q.EndAt(*snap));
    }

    uint64_t query_end_at_values(uint64_t ref, const gm::wire::GMValue& values)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.EndAt(gmValueToFieldValueVector(values)));
    }

    double query_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0.0;

        auto src = static_cast<firebase::firestore::Source>(static_cast<int>(source));
        q.Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::QuerySnapshot>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback.has_value())
                return;

            std::optional<uint64_t> snapshot_ref;
            if (f.error() == 0 && f.result() != nullptr)
                snapshot_ref = registerFirestoreQuerySnapshot(*f.result());

            callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, snapshot_ref);
        });
        return 1.0;
    }

    // Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
    // listener_registration_remove().
    uint64_t query_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
    {
        if (!callback.has_value())
        {
            setFirebaseLastError(-1, "gmfb_firestore::query_add_snapshot_listener: a callback is required");
            return 0;
        }

        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;

        auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
        gm::wire::GMFunction cb = callback.value();

        firebase::firestore::ListenerRegistration* reg = new firebase::firestore::ListenerRegistration(
            q.AddSnapshotListener(mc, [cb](const firebase::firestore::QuerySnapshot& snapshot, firebase::firestore::Error error, const std::string& error_message)
            {
                if (error != firebase::firestore::kErrorOk)
                    setFirebaseLastError((int)error, error_message);

                uint64_t snapshot_ref = 0;
                if (error == firebase::firestore::kErrorOk)
                    snapshot_ref = registerFirestoreQuerySnapshot(snapshot);

                cb.call((double)error, std::string_view{ error_message }, snapshot_ref);
            }));

        return registerFirebasePointer(reg, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
    }

    bool query_is_valid(uint64_t ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return false;
        return q.is_valid();
    }

    void query_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_QUERY)
        {
            setFirebaseLastError(-1, "invalid handle");
            return;
        }
        unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_query_map);
    }

    // ============================================================
    // WriteBatch
    // ============================================================

    double write_batch_set(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        wb->Set(*doc, gmValueToMapFieldValue(data));
        return 1.0;
    }

    double write_batch_set_merge(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        wb->Set(*doc, gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge());
        return 1.0;
    }

    double write_batch_set_merge_fields(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        auto options = firebase::firestore::SetOptions::MergeFields(gmValueToStringVector(fields));
        wb->Set(*doc, gmValueToMapFieldValue(data), options);
        return 1.0;
    }

    double write_batch_update(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        wb->Update(*doc, gmValueToMapFieldValue(data));
        return 1.0;
    }

    double write_batch_delete(uint64_t batch_ref, uint64_t document_ref)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (doc == nullptr) return 0.0;

        wb->Delete(*doc);
        return 1.0;
    }

    double write_batch_commit(uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        if (wb == nullptr) return 0.0;

        wb->Commit().OnCompletion([callback](const firebase::Future<void>& f)
        {
            if (f.error() != 0)
                setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback.has_value())
                callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    void write_batch_release(uint64_t batch_ref)
    {
        if (gm_fb_ref_ext(batch_ref) != GM_FIREBASE_EXT || gm_fb_ref_type(batch_ref) != GM_FB_TYPE_FIRESTORE_WRITE_BATCH)
        {
            setFirebaseLastError(-1, "invalid handle");
            return;
        }
        unregisterFirebaseValue(gm_fb_ref_id(batch_ref), g_fs_write_batch_map);
    }

    // ============================================================
    // Firebase C++ 13.11: FieldPath, Filter, aggregate queries, bundles
    // ============================================================

    double field_path_create(const gm::wire::GMValue& components)
    {
        return static_cast<double>(registerFirestoreFieldPath(firebase::firestore::FieldPath(gmValueToStringVector(components))));
    }

    double field_path_document_id()
    {
        return static_cast<double>(registerFirestoreFieldPath(firebase::firestore::FieldPath::DocumentId()));
    }

    bool field_path_is_valid(uint64_t ref)
    {
        firebase::firestore::FieldPath value;
        return resolveFieldPath(ref, value) && value.is_valid();
    }

    std::string field_path_to_string(uint64_t ref)
    {
        firebase::firestore::FieldPath value;
        return resolveFieldPath(ref, value) ? value.ToString() : std::string();
    }

    void field_path_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_FIELD_PATH)
            unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_field_path_map);
        else setFirebaseLastError(-1, "invalid Firestore FieldPath handle");
    }

#define GM_FS_FILTER_STRING_ONE(fn_name, sdk_name) \
    double fn_name(std::string_view field, const gm::wire::GMValue& value) { \
        return static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::sdk_name(std::string(field), gmValueToFieldValue(value)))); }
#define GM_FS_FILTER_STRING_MANY(fn_name, sdk_name) \
    double fn_name(std::string_view field, const gm::wire::GMValue& values) { \
        return static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::sdk_name(std::string(field), gmValueToFieldValueVector(values)))); }
#define GM_FS_FILTER_PATH_ONE(fn_name, sdk_name) \
    double fn_name(uint64_t field_path_ref, const gm::wire::GMValue& value) { \
        firebase::firestore::FieldPath fp; return resolveFieldPath(field_path_ref, fp) ? static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::sdk_name(fp, gmValueToFieldValue(value)))) : 0.0; }
#define GM_FS_FILTER_PATH_MANY(fn_name, sdk_name) \
    double fn_name(uint64_t field_path_ref, const gm::wire::GMValue& values) { \
        firebase::firestore::FieldPath fp; return resolveFieldPath(field_path_ref, fp) ? static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::sdk_name(fp, gmValueToFieldValueVector(values)))) : 0.0; }

    GM_FS_FILTER_STRING_ONE(filter_equal_to, EqualTo)
    GM_FS_FILTER_STRING_ONE(filter_not_equal_to, NotEqualTo)
    GM_FS_FILTER_STRING_ONE(filter_less_than, LessThan)
    GM_FS_FILTER_STRING_ONE(filter_less_than_or_equal_to, LessThanOrEqualTo)
    GM_FS_FILTER_STRING_ONE(filter_greater_than, GreaterThan)
    GM_FS_FILTER_STRING_ONE(filter_greater_than_or_equal_to, GreaterThanOrEqualTo)
    GM_FS_FILTER_STRING_ONE(filter_array_contains, ArrayContains)
    GM_FS_FILTER_STRING_MANY(filter_array_contains_any, ArrayContainsAny)
    GM_FS_FILTER_STRING_MANY(filter_in, In)
    GM_FS_FILTER_STRING_MANY(filter_not_in, NotIn)
    GM_FS_FILTER_PATH_ONE(filter_equal_to_field_path, EqualTo)
    GM_FS_FILTER_PATH_ONE(filter_not_equal_to_field_path, NotEqualTo)
    GM_FS_FILTER_PATH_ONE(filter_less_than_field_path, LessThan)
    GM_FS_FILTER_PATH_ONE(filter_less_than_or_equal_to_field_path, LessThanOrEqualTo)
    GM_FS_FILTER_PATH_ONE(filter_greater_than_field_path, GreaterThan)
    GM_FS_FILTER_PATH_ONE(filter_greater_than_or_equal_to_field_path, GreaterThanOrEqualTo)
    GM_FS_FILTER_PATH_ONE(filter_array_contains_field_path, ArrayContains)
    GM_FS_FILTER_PATH_MANY(filter_array_contains_any_field_path, ArrayContainsAny)
    GM_FS_FILTER_PATH_MANY(filter_in_field_path, In)
    GM_FS_FILTER_PATH_MANY(filter_not_in_field_path, NotIn)

#undef GM_FS_FILTER_STRING_ONE
#undef GM_FS_FILTER_STRING_MANY
#undef GM_FS_FILTER_PATH_ONE
#undef GM_FS_FILTER_PATH_MANY

    double filter_and(const gm::wire::GMValue& filters)
    {
        return static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::And(gmValueToFilterVector(filters))));
    }

    double filter_or(const gm::wire::GMValue& filters)
    {
        return static_cast<double>(registerFirestoreFilter(firebase::firestore::Filter::Or(gmValueToFilterVector(filters))));
    }

    void filter_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_FILTER)
            unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_filter_map);
        else setFirebaseLastError(-1, "invalid Firestore Filter handle");
    }

    uint64_t query_where_filter(uint64_t ref, uint64_t filter_ref)
    {
        firebase::firestore::Query q;
        firebase::firestore::Filter filter = firebase::firestore::Filter::EqualTo(std::string(), firebase::firestore::FieldValue::Null());
        return (resolveFilter(filter_ref, filter) && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.Where(filter)) : 0;
    }

#define GM_FS_QUERY_PATH_ONE(fn_name, sdk_name) \
    uint64_t fn_name(uint64_t ref, uint64_t field_path_ref, const gm::wire::GMValue& value) { \
        firebase::firestore::Query q; firebase::firestore::FieldPath fp; \
        return (resolveFieldPath(field_path_ref, fp) && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.sdk_name(fp, gmValueToFieldValue(value))) : 0; }
#define GM_FS_QUERY_PATH_MANY(fn_name, sdk_name) \
    uint64_t fn_name(uint64_t ref, uint64_t field_path_ref, const gm::wire::GMValue& values) { \
        firebase::firestore::Query q; firebase::firestore::FieldPath fp; \
        return (resolveFieldPath(field_path_ref, fp) && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.sdk_name(fp, gmValueToFieldValueVector(values))) : 0; }

    GM_FS_QUERY_PATH_ONE(query_where_equal_to_field_path, WhereEqualTo)
    GM_FS_QUERY_PATH_ONE(query_where_not_equal_to_field_path, WhereNotEqualTo)
    GM_FS_QUERY_PATH_ONE(query_where_less_than_field_path, WhereLessThan)
    GM_FS_QUERY_PATH_ONE(query_where_less_than_or_equal_to_field_path, WhereLessThanOrEqualTo)
    GM_FS_QUERY_PATH_ONE(query_where_greater_than_field_path, WhereGreaterThan)
    GM_FS_QUERY_PATH_ONE(query_where_greater_than_or_equal_to_field_path, WhereGreaterThanOrEqualTo)
    GM_FS_QUERY_PATH_ONE(query_where_array_contains_field_path, WhereArrayContains)
    GM_FS_QUERY_PATH_MANY(query_where_array_contains_any_field_path, WhereArrayContainsAny)
    GM_FS_QUERY_PATH_MANY(query_where_in_field_path, WhereIn)
    GM_FS_QUERY_PATH_MANY(query_where_not_in_field_path, WhereNotIn)

#undef GM_FS_QUERY_PATH_ONE
#undef GM_FS_QUERY_PATH_MANY

    uint64_t query_order_by_field_path(uint64_t ref, uint64_t field_path_ref, double direction)
    {
        firebase::firestore::Query q;
        firebase::firestore::FieldPath fp;
        if (!resolveFieldPath(field_path_ref, fp) || !resolveFirestoreQuery(ref, q)) return 0;
        return registerFirestoreQuery(q.OrderBy(fp, static_cast<firebase::firestore::Query::Direction>(static_cast<int>(direction))));
    }

    uint64_t query_count(uint64_t ref)
    {
        firebase::firestore::Query q;
        return resolveFirestoreQuery(ref, q) ? registerFirestoreAggregateQuery(q.Count()) : 0;
    }

    uint64_t aggregate_query_get_query(uint64_t ref)
    {
        firebase::firestore::AggregateQuery q;
        return resolveAggregateQuery(ref, q) ? registerFirestoreQuery(q.query()) : 0;
    }

    bool aggregate_query_is_valid(uint64_t ref)
    {
        firebase::firestore::AggregateQuery q;
        return resolveAggregateQuery(ref, q) && q.is_valid();
    }

    double aggregate_query_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::AggregateQuery q;
        if (!resolveAggregateQuery(ref, q)) return 0.0;
        q.Get(static_cast<firebase::firestore::AggregateSource>(static_cast<int>(source))).OnCompletion(
            [callback](const firebase::Future<firebase::firestore::AggregateQuerySnapshot>& f)
        {
            setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback) return;
            std::optional<uint64_t> result;
            if (f.error() == 0 && f.result()) result = registerFirestoreAggregateSnapshot(*f.result());
            callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, result);
        });
        return 1.0;
    }

    void aggregate_query_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_AGG_QUERY)
            unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_aggregate_query_map);
        else setFirebaseLastError(-1, "invalid AggregateQuery handle");
    }

    double aggregate_snapshot_count(uint64_t ref)
    {
        firebase::firestore::AggregateQuerySnapshot s;
        return resolveAggregateSnapshot(ref, s) ? static_cast<double>(s.count()) : 0.0;
    }

    uint64_t aggregate_snapshot_get_query(uint64_t ref)
    {
        firebase::firestore::AggregateQuerySnapshot s;
        return resolveAggregateSnapshot(ref, s) ? registerFirestoreAggregateQuery(s.query()) : 0;
    }

    bool aggregate_snapshot_is_valid(uint64_t ref)
    {
        firebase::firestore::AggregateQuerySnapshot s;
        return resolveAggregateSnapshot(ref, s) && s.is_valid();
    }

    void aggregate_snapshot_release(uint64_t ref)
    {
        if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT)
            unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_aggregate_snapshot_map);
        else setFirebaseLastError(-1, "invalid AggregateQuerySnapshot handle");
    }

    uint64_t add_snapshots_in_sync_listener(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (!fs) return 0;
        auto reg = fs->AddSnapshotsInSyncListener([callback]() { if (callback) callback->call(); });
        auto* boxed = new firebase::firestore::ListenerRegistration(std::move(reg));
        return registerFirebasePointer(boxed, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
    }

    double load_bundle(uint64_t instance_ref, GMBuffer bundle,
        const std::optional<gm::wire::GMFunction>& progress_callback,
        const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (!fs) return 0.0;
        std::string bytes(static_cast<const char*>(bundle.data()), static_cast<size_t>(bundle.length()));
        auto progress = [progress_callback](const firebase::firestore::LoadBundleTaskProgress& p)
        {
            if (progress_callback) progress_callback->call(loadBundleProgressStruct(p));
        };
        firebase::Future<firebase::firestore::LoadBundleTaskProgress> future = progress_callback
            ? fs->LoadBundle(bytes, progress) : fs->LoadBundle(bytes);
        future.OnCompletion([callback](const firebase::Future<firebase::firestore::LoadBundleTaskProgress>& f)
        {
            setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback) return;
            if (f.result()) callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, loadBundleProgressStruct(*f.result()));
            else callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, std::optional<std::uint8_t>{});
        });
        return 1.0;
    }

    double named_query(uint64_t instance_ref, std::string_view name, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
        if (!fs) return 0.0;
        fs->NamedQuery(std::string(name)).OnCompletion([callback](const firebase::Future<firebase::firestore::Query>& f)
        {
            setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (!callback) return;
            std::optional<uint64_t> result;
            if (f.error() == 0 && f.result() && f.result()->is_valid()) result = registerFirestoreQuery(*f.result());
            callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, result);
        });
        return 1.0;
    }

    // SetOptions::MergeFieldPaths variants.
    double document_ref_set_merge_field_paths(uint64_t ref, const gm::wire::GMValue& data,
        const gm::wire::GMValue& field_paths, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (!doc) return 0.0;
        auto options = firebase::firestore::SetOptions::MergeFieldPaths(gmValueToFieldPathVector(field_paths));
        doc->Set(gmValueToMapFieldValue(data), options).OnCompletion([callback](const firebase::Future<void>& f)
        {
            setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback) callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    void write_batch_set_merge_field_paths(uint64_t batch_ref, uint64_t document_ref,
        const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (!wb || !doc) return;
        wb->Set(*doc, gmValueToMapFieldValue(data), firebase::firestore::SetOptions::MergeFieldPaths(gmValueToFieldPathVector(field_paths)));
    }

    // ============================================================
    // Remaining value-object/accessor coverage
    // ============================================================

    double field_value_type(uint64_t ref)
    {
        auto* v = resolveFieldValueHandle(ref); return v ? static_cast<double>(v->type()) : -1.0;
    }
    bool field_value_is_valid(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_valid(); }
    bool field_value_is_null(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_null(); }
    bool field_value_is_boolean(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_boolean(); }
    bool field_value_is_integer(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_integer(); }
    bool field_value_is_double(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_double(); }
    bool field_value_is_timestamp(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_timestamp(); }
    bool field_value_is_string(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_string(); }
    bool field_value_is_blob(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_blob(); }
    bool field_value_is_reference(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_reference(); }
    bool field_value_is_geo_point(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_geo_point(); }
    bool field_value_is_array(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_array(); }
    bool field_value_is_map(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_map(); }
    bool field_value_boolean_value(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_boolean() ? v->boolean_value() : false; }
    double field_value_integer_value(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_integer() ? static_cast<double>(v->integer_value()) : 0.0; }
    double field_value_double_value(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_double() ? v->double_value() : 0.0; }
    std::string field_value_string_value(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_string() ? v->string_value() : std::string(); }
    double field_value_blob_size(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v && v->is_blob() ? static_cast<double>(v->blob_size()) : 0.0; }

    double field_value_blob_copy(uint64_t ref, GMBuffer out_buffer)
    {
        auto* v = resolveFieldValueHandle(ref);
        if (!v || !v->is_blob()) return 0.0;
        size_t n = std::min(v->blob_size(), static_cast<size_t>(out_buffer.length()));
        if (n) std::memcpy(out_buffer.data(), v->blob_value(), n);
        return static_cast<double>(n);
    }

    uint64_t field_value_reference_value(uint64_t ref)
    {
        auto* v = resolveFieldValueHandle(ref);
        return v && v->is_reference() ? registerFirestoreDocRef(v->reference_value()) : 0;
    }

    gm::wire::DataStream field_value_timestamp_value(uint64_t ref)
    {
        gm::wire::StructStream s;
        auto* v = resolveFieldValueHandle(ref);
        if (v && v->is_timestamp())
        {
            auto t = v->timestamp_value();
            s.add("seconds", static_cast<double>(t.seconds()));
            s.add("nanoseconds", static_cast<double>(t.nanoseconds()));
        }
        gm::wire::DataStream out; out << s; return out;
    }

    gm::wire::DataStream field_value_geo_point_value(uint64_t ref)
    {
        gm::wire::StructStream s;
        auto* v = resolveFieldValueHandle(ref);
        if (v && v->is_geo_point())
        {
            auto g = v->geo_point_value();
            s.add("latitude", g.latitude());
            s.add("longitude", g.longitude());
        }
        gm::wire::DataStream out; out << s; return out;
    }

    gm::wire::DataStream field_value_array_value(uint64_t ref)
    {
        gm::wire::ArrayStream a;
        auto* v = resolveFieldValueHandle(ref);
        if (v && v->is_array())
            for (const auto& x : v->array_value()) pushFieldValueToArray(a, x);
        gm::wire::DataStream out; out << a; return out;
    }

    gm::wire::DataStream field_value_map_value(uint64_t ref)
    {
        gm::wire::StructStream s;
        auto* v = resolveFieldValueHandle(ref);
        if (v && v->is_map())
            for (const auto& kv : v->map_value()) addFieldValueToStruct(s, kv.first, kv.second);
        gm::wire::DataStream out; out << s; return out;
    }

    std::string field_value_to_string(uint64_t ref) { auto* v = resolveFieldValueHandle(ref); return v ? v->ToString() : std::string(); }

    uint64_t query_get_firestore(uint64_t ref)
    {
        firebase::firestore::Query q;
        if (!resolveFirestoreQuery(ref, q)) return 0;
        auto* fs = q.firestore();
        return fs ? registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE) : 0;
    }

    uint64_t document_ref_get_firestore(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        auto* fs = doc ? doc->firestore() : nullptr;
        return fs ? registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE) : 0;
    }

    std::string document_ref_to_string(uint64_t ref)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        return doc ? doc->ToString() : std::string();
    }

    double document_ref_update_field_paths(uint64_t ref, const gm::wire::GMValue& entries, const std::optional<gm::wire::GMFunction>& callback)
    {
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (!doc) return 0.0;
        doc->Update(gmValueToMapFieldPathValue(entries)).OnCompletion([callback](const firebase::Future<void>& f)
        {
            setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
            if (callback) callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
        });
        return 1.0;
    }

    double write_batch_update_field_paths(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& entries)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        firebase::firestore::DocumentReference* doc = nullptr;
        validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
        if (!wb || !doc) return 0.0;
        wb->Update(*doc, gmValueToMapFieldPathValue(entries));
        return 1.0;
    }

    bool write_batch_is_valid(uint64_t batch_ref)
    {
        firebase::firestore::WriteBatch* wb = nullptr;
        validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, wb);
        return wb && wb->is_valid();
    }

    std::string settings_to_string(uint64_t instance_ref)
    {
        auto* fs = resolveFirestore(instance_ref);
        return fs ? fs->settings().ToString() : std::string();
    }

    uint64_t get_app(uint64_t instance_ref)
    {
        auto* fs = resolveFirestore(instance_ref);
        return fs ? wrapFirebaseApp(fs->app()) : 0;
    }

    uint64_t get_instance_for_app(uint64_t app_ref)
    {
        auto* app = resolveFirebaseApp(app_ref);
        if (!app) return 0;
        firebase::InitResult result = firebase::kInitResultSuccess;
        auto* fs = firebase::firestore::Firestore::GetInstance(app, &result);
        if (!fs || result != firebase::kInitResultSuccess) { setFirebaseLastError((int)result, "failed to get Firestore instance for app"); return 0; }
        return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
    }

    uint64_t get_instance_for_app_database(uint64_t app_ref, std::string_view database_id)
    {
        auto* app = resolveFirebaseApp(app_ref);
        if (!app) return 0;
        firebase::InitResult result = firebase::kInitResultSuccess;
        std::string db(database_id);
        auto* fs = firebase::firestore::Firestore::GetInstance(app, db.c_str(), &result);
        if (!fs || result != firebase::kInitResultSuccess) { setFirebaseLastError((int)result, "failed to get Firestore instance for app/database"); return 0; }
        return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
    }

    double field_value_boolean(bool value) { return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Boolean(value))); }
    double field_value_string(std::string_view value) { return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::String(std::string(value)))); }
    double field_value_array(const gm::wire::GMValue& value) { return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Array(gmValueToFieldValueVector(value)))); }
    double field_value_map(const gm::wire::GMValue& value) { return static_cast<double>(registerFirestoreFieldValue(firebase::firestore::FieldValue::Map(gmValueToMapFieldValue(value)))); }
}

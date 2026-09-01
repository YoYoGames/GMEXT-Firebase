package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseDatabaseBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseDatabaseInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebaseDatabase_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebaseDatabase_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance_for_url(String url, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance_for_url(url, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_get_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_url(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference_at_path(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference_at_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_go_offline(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_go_offline(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_go_online(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_go_online(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_purge_outstanding_writes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_purge_outstanding_writes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_set_persistence_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_set_log_level(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_set_log_level(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_log_level(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_log_level(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_start_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_start_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_end_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_end_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_equal_to_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_limit_to_first(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_limit_to_last(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_keep_synchronized(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_add_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_value_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_all_value_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_add_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_child_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_all_child_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_start_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_start_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_end_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_end_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_equal_to_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_limit_to_first(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_limit_to_last(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_set_keep_synchronized(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_get_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_add_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_value_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_all_value_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_add_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_child_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_all_child_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_push(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_push(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_go_online(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_go_online(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_go_offline(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_go_offline(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_priority(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_priority(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_value_and_priority(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_value_and_priority(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_update_children(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_update_children(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_run_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_run_transaction(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_exists(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_exists(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_has_child(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_has_child(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_has_children(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_has_children(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_children_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_children_count(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_children(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_children(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_snapshot_key(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_key(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_info(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_release(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_ref_key(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_key(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_is_root(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_is_root(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get_parent(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get_root(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_root(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get_database(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_database(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_ref_get_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_url(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_server_timestamp(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_server_timestamp(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_on_disconnect(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_on_disconnect(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_cancel(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_cancel(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_remove_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_remove_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_set_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_set_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_set_value_and_priority(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_set_value_and_priority(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_update_children(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_update_children(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_on_disconnect_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_on_disconnect_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance_for_app_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance_for_app_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
}
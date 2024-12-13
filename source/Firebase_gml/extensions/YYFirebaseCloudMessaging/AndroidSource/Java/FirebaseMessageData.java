

package ${YYAndroidPackageName};

import android.content.Intent;
import android.os.Bundle;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.zip.CRC32;
import java.nio.charset.StandardCharsets;

public class FirebaseMessageData {

    public static final String EXTRA_ID = "google.message_id";
    public static final String EXTRA_ORIGINAL_PRIORITY = "google.original_priority";
    public static final String EXTRA_DELIVERED_PRIORITY = "google.delivered_priority";
    public static final String EXTRA_SENT_TIME = "google.sent_time";
    public static final String EXTRA_TTL = "google.ttl";
    public static final String EXTRA_FROM = "from";
    public static final String EXTRA_COLLAPSE_KEY = "collapse_key";

    // Define the set of reserved keys
    static Set<String> reservedKeys = new HashSet<>(Arrays.asList(
        EXTRA_ID,
        EXTRA_ORIGINAL_PRIORITY,
        EXTRA_DELIVERED_PRIORITY,
        EXTRA_SENT_TIME,
        EXTRA_TTL,
        EXTRA_FROM,
        EXTRA_COLLAPSE_KEY,
        "google.product_id",
        "gcm.n.analytics_data"
        // Add any other reserved keys we might want to exclude
    ));

    private String id;
    private String originalPriority;
    private String deliveredPriority;
    private long sentTime;
    private int ttl;
    private String from;
    private String collapseKey;
    private Map<String, Object> extraData;
    
    public FirebaseMessageData(String id, String originalPriority, String deliveredPriority, long sentTime, int ttl, String from, String collapseKey, Map<String, Object> extraData) {
        this.id = id;
        this.originalPriority = originalPriority;
        this.deliveredPriority = deliveredPriority;
        this.sentTime = sentTime;
        this.ttl = ttl;
        this.from = from;
        this.collapseKey = collapseKey;
        this.extraData = extraData;
    }

    // Getters
    public String getId() { return id; }
    public String getOriginalPriority() { return originalPriority; }
    public String getDeliveredPriority() { return deliveredPriority; }
    public long getSentTime() { return sentTime; }
    public int getTtl() { return ttl; }
    public String getFrom() { return from; }
    public String getCollapseKey() { return collapseKey; }
    public Map<String, Object> getExtraData() { return extraData; };

    public void toIntent(Intent intent) {
        intent.putExtra(EXTRA_ID, id);
        intent.putExtra(EXTRA_ORIGINAL_PRIORITY, originalPriority);
        intent.putExtra(EXTRA_DELIVERED_PRIORITY, deliveredPriority);
        intent.putExtra(EXTRA_SENT_TIME, sentTime);
        intent.putExtra(EXTRA_TTL, ttl);
        intent.putExtra(EXTRA_FROM, from);
        intent.putExtra(EXTRA_COLLAPSE_KEY, collapseKey);
    }

    public static FirebaseMessageData fromIntent(Intent intent) {
        if (intent == null) return null;
        if (!intent.hasExtra(EXTRA_ID)) return null;

        String id = intent.getStringExtra(EXTRA_ID);
        String originalPriority = intent.getStringExtra(EXTRA_ORIGINAL_PRIORITY);
        String deliveredPriority = intent.getStringExtra(EXTRA_DELIVERED_PRIORITY);
        long sentTime = intent.getLongExtra(EXTRA_SENT_TIME, 0L);
        int ttl = intent.getIntExtra(EXTRA_TTL, 0);
        String from = intent.getStringExtra(EXTRA_FROM);
        String collapseKey = intent.getStringExtra(EXTRA_COLLAPSE_KEY);

        Bundle extras = intent.getExtras();
        Map<String, Object> extraData = new HashMap<>();
        for (String key : extras.keySet()) {
            // Skip reserved keys
            if (reservedKeys.contains(key)) {
                continue;
            }
            Object value = extras.get(key);
            extraData.put(key, value);
        }

        return new FirebaseMessageData(id, originalPriority, deliveredPriority, sentTime, ttl, from, collapseKey, extraData);
    }

    // Method to clear cloud message data from an Intent
    public static void clearFromIntent(Intent intent) {
        if (intent == null) return;

        intent.removeExtra(EXTRA_ID);
        intent.removeExtra(EXTRA_ORIGINAL_PRIORITY);
        intent.removeExtra(EXTRA_DELIVERED_PRIORITY);
        intent.removeExtra(EXTRA_SENT_TIME);
        intent.removeExtra(EXTRA_TTL);
        intent.removeExtra(EXTRA_FROM);
        intent.removeExtra(EXTRA_COLLAPSE_KEY);
    }
}
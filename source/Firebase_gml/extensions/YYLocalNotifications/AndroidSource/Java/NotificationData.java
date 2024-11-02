package ${YYAndroidPackageName};

import android.content.Intent;

import java.util.zip.CRC32;
import java.nio.charset.StandardCharsets;

public class NotificationData {

    public static final String EXTRA_KEY = "@@NotificationData@@";
    public static final String EXTRA_ID = "id";
    public static final String EXTRA_TITLE = "title";
    public static final String EXTRA_MESSAGE = "message";
    public static final String EXTRA_DATA = "data";
    public static final String EXTRA_IMAGE_PATH = "imagePath";

    private String id;
    private String title;
    private String message;
    private String data;
    private String imagePath;

    public NotificationData(String id, String title, String message, String data, String imagePath) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.data = data;
        this.imagePath = imagePath;
    }

    // Getters
    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getMessage() { return message; }
    public String getData() { return data; }
    public String getImagePath() { return imagePath; }

    public static int getUniqueInteger(String name) {
        CRC32 crc = new CRC32();
        crc.update(name.getBytes(StandardCharsets.UTF_8));
        return (int) crc.getValue();
    }

    public void toIntent(Intent intent) {
        intent.putExtra(EXTRA_KEY, true);
        intent.putExtra(EXTRA_ID, id);
        intent.putExtra(EXTRA_TITLE, title);
        intent.putExtra(EXTRA_MESSAGE, message);
        intent.putExtra(EXTRA_DATA, data);
        intent.putExtra(EXTRA_IMAGE_PATH, imagePath);
    }

    public static NotificationData fromIntent(Intent intent) {
        if (intent == null) return null;
        if (!intent.getBooleanExtra(EXTRA_KEY, false)) return null;

        String id = intent.getStringExtra(EXTRA_ID);
        String title = intent.getStringExtra(EXTRA_TITLE);
        String message = intent.getStringExtra(EXTRA_MESSAGE);
        String data = intent.getStringExtra(EXTRA_DATA);
        String imagePath = intent.getStringExtra(EXTRA_IMAGE_PATH);
        return new NotificationData(id, title, message, data, imagePath);
    }

    // Method to clear notification data from an Intent
    public static void clearFromIntent(Intent intent) {
        if (intent == null) return;

        intent.removeExtra(EXTRA_KEY);
        intent.removeExtra(EXTRA_ID);
        intent.removeExtra(EXTRA_TITLE);
        intent.removeExtra(EXTRA_MESSAGE);
        intent.removeExtra(EXTRA_DATA);
        intent.removeExtra(EXTRA_IMAGE_PATH);
    }
}
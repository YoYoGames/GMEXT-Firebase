package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.NotificationData;

public interface NotificationCallback {
    boolean onNotificationReceived(final NotificationData notificationData);
}
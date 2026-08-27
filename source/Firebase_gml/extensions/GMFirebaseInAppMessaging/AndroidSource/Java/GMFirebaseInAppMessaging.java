package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.google.firebase.inappmessaging.FirebaseInAppMessaging;
import com.google.firebase.inappmessaging.FirebaseInAppMessagingClickListener;
import com.google.firebase.inappmessaging.FirebaseInAppMessagingDismissListener;
import com.google.firebase.inappmessaging.FirebaseInAppMessagingDisplayCallbacks;
import com.google.firebase.inappmessaging.FirebaseInAppMessagingDisplayErrorListener;
import com.google.firebase.inappmessaging.FirebaseInAppMessagingImpressionListener;

import com.google.firebase.inappmessaging.model.Action;
import com.google.firebase.inappmessaging.model.Button;
import com.google.firebase.inappmessaging.model.InAppMessage;
import com.google.firebase.inappmessaging.model.Text;

import org.json.JSONObject;

import java.util.Locale;
import java.util.Map;


public class GMFirebaseInAppMessaging
    extends GMFirebaseInAppMessagingInternal
    implements
        FirebaseInAppMessagingClickListener,
        FirebaseInAppMessagingDismissListener,
        FirebaseInAppMessagingDisplayErrorListener,
        FirebaseInAppMessagingImpressionListener
{
    private static final String TAG =
        "GMFirebaseInAppMessaging";

    private volatile GMFunction impressionCallback = null;
    private volatile GMFunction clickCallback = null;
    private volatile GMFunction dismissCallback = null;
    private volatile GMFunction displayErrorCallback = null;

    private final Object callbackLock = new Object();

    private static final Handler MAIN_HANDLER =
        new Handler(Looper.getMainLooper());

    // Keep the native FIAM bridge active before the GML Create event.
    // Startup/test events are buffered until the matching GML callback exists.
    private volatile boolean bridgeEnabled = true;

    private MessageInfo pendingImpression = null;
    private ClickInfo pendingClick = null;
    private MessageInfo pendingDismiss = null;
    private DisplayErrorInfo pendingDisplayError = null;


    @Override
    public void onStart()
    {
        installNativeListeners("onStart");
    }


    @Override
    public void onResume()
    {
        installNativeListeners("onResume");
    }


    @Override
    public void onDestroy()
    {
        removeNativeListeners("onDestroy");
    }


    private FirebaseInAppMessaging fiam()
    {
        return FirebaseInAppMessaging.getInstance();
    }


    private void installNativeListeners(String reason)
    {
        if (!bridgeEnabled)
            return;

        try
        {
            FirebaseInAppMessaging instance = fiam();

            // FIAM can clear developer listeners when the Activity goes to the
            // background. Remove-before-add prevents duplicates on every resume.
            instance.removeImpressionListener(this);
            instance.removeClickListener(this);
            instance.removeDismissListener(this);
            instance.removeDisplayErrorListener(this);

            instance.addImpressionListener(this);
            instance.addClickListener(this);
            instance.addDismissListener(this);
            instance.addDisplayErrorListener(this);

            Log.i(TAG, "FIAM developer listeners attached: " + reason);
        }
        catch (Exception error)
        {
            Log.e(TAG, "Failed to attach FIAM developer listeners: " + reason, error);
        }
    }


    private void removeNativeListeners(String reason)
    {
        try
        {
            FirebaseInAppMessaging instance = fiam();
            instance.removeImpressionListener(this);
            instance.removeClickListener(this);
            instance.removeDismissListener(this);
            instance.removeDisplayErrorListener(this);
            Log.i(TAG, "FIAM developer listeners removed: " + reason);
        }
        catch (Exception error)
        {
            Log.e(TAG, "Failed to remove FIAM developer listeners: " + reason, error);
        }
    }


    // -------------------------------------------------------------------------
    // Runtime controls
    // -------------------------------------------------------------------------

    public void firebase_in_app_messaging_set_automatic_data_collection_enabled(
        boolean enabled)
    {
        fiam().setAutomaticDataCollectionEnabled(enabled);
    }


    public boolean firebase_in_app_messaging_is_automatic_data_collection_enabled()
    {
        return fiam().isAutomaticDataCollectionEnabled();
    }


    public void firebase_in_app_messaging_set_messages_suppressed(
        boolean suppressed)
    {
        fiam().setMessagesSuppressed(suppressed);
    }


    public boolean firebase_in_app_messaging_are_messages_suppressed()
    {
        return fiam().areMessagesSuppressed();
    }


    public void firebase_in_app_messaging_trigger_event(
        String event_name)
    {
        if (event_name == null || event_name.isEmpty())
            return;

        fiam().triggerEvent(event_name);
    }


    // -------------------------------------------------------------------------
    // Callback registration
    // -------------------------------------------------------------------------

    public void firebase_in_app_messaging_set_impression_callback(
        GMFunction callback)
    {
        MessageInfo pending;

        synchronized (callbackLock)
        {
            bridgeEnabled = true;
            impressionCallback = callback;
            pending = pendingImpression;
            pendingImpression = null;
        }

        installNativeListeners("set_impression_callback");

        if (callback != null && pending != null)
        {
            final MessageInfo event = pending;
            runOnGameThread(() -> invokeImpression(callback, event));
        }
    }


    public void firebase_in_app_messaging_set_click_callback(
        GMFunction callback)
    {
        ClickInfo pending;

        synchronized (callbackLock)
        {
            bridgeEnabled = true;
            clickCallback = callback;
            pending = pendingClick;
            pendingClick = null;
        }

        installNativeListeners("set_click_callback");

        if (callback != null && pending != null)
        {
            final ClickInfo event = pending;
            runOnGameThread(() -> invokeClick(callback, event));
        }
    }


    public void firebase_in_app_messaging_set_dismiss_callback(
        GMFunction callback)
    {
        MessageInfo pending;

        synchronized (callbackLock)
        {
            bridgeEnabled = true;
            dismissCallback = callback;
            pending = pendingDismiss;
            pendingDismiss = null;
        }

        installNativeListeners("set_dismiss_callback");

        if (callback != null && pending != null)
        {
            final MessageInfo event = pending;
            runOnGameThread(() -> invokeDismiss(callback, event));
        }
    }


    public void firebase_in_app_messaging_set_display_error_callback(
        GMFunction callback)
    {
        DisplayErrorInfo pending;

        synchronized (callbackLock)
        {
            bridgeEnabled = true;
            displayErrorCallback = callback;
            pending = pendingDisplayError;
            pendingDisplayError = null;
        }

        installNativeListeners("set_display_error_callback");

        if (callback != null && pending != null)
        {
            final DisplayErrorInfo event = pending;
            runOnGameThread(() -> invokeDisplayError(callback, event));
        }
    }


    public void firebase_in_app_messaging_clear_callbacks()
    {
        synchronized (callbackLock)
        {
            bridgeEnabled = false;

            impressionCallback = null;
            clickCallback = null;
            dismissCallback = null;
            displayErrorCallback = null;

            pendingImpression = null;
            pendingClick = null;
            pendingDismiss = null;
            pendingDisplayError = null;
        }

        removeNativeListeners("clear_callbacks");
    }


    // -------------------------------------------------------------------------
    // Firebase lifecycle callbacks
    // -------------------------------------------------------------------------

    @Override
    public void impressionDetected(
        InAppMessage inAppMessage)
    {
        final MessageInfo info = messageInfo(inAppMessage);
        final GMFunction callback;

        synchronized (callbackLock)
        {
            if (!bridgeEnabled)
                return;

            callback = impressionCallback;

            if (callback == null)
            {
                pendingImpression = info;
                Log.i(TAG, "FIAM impression buffered: " + info.campaignName);
                return;
            }
        }

        runOnGameThread(() -> invokeImpression(callback, info));
    }


    @Override
    public void messageClicked(
        InAppMessage inAppMessage,
        Action action)
    {
        final ClickInfo info = clickInfo(inAppMessage, action);
        final GMFunction callback;

        synchronized (callbackLock)
        {
            if (!bridgeEnabled)
                return;

            callback = clickCallback;

            if (callback == null)
            {
                pendingClick = info;
                Log.i(TAG, "FIAM click buffered: " + info.message.campaignName);
                return;
            }
        }

        runOnGameThread(() -> invokeClick(callback, info));
    }


    @Override
    public void messageDismissed(
        InAppMessage inAppMessage)
    {
        final MessageInfo info = messageInfo(inAppMessage);
        final GMFunction callback;

        synchronized (callbackLock)
        {
            if (!bridgeEnabled)
                return;

            callback = dismissCallback;

            if (callback == null)
            {
                pendingDismiss = info;
                Log.i(TAG, "FIAM dismiss buffered: " + info.campaignName);
                return;
            }
        }

        runOnGameThread(() -> invokeDismiss(callback, info));
    }


    @Override
    public void displayErrorEncountered(
        InAppMessage inAppMessage,
        FirebaseInAppMessagingDisplayCallbacks.InAppMessagingErrorReason errorReason)
    {
        final DisplayErrorInfo info = new DisplayErrorInfo(
            messageInfo(inAppMessage),
            errorReason != null ? errorReason.name() : "UNKNOWN"
        );

        final GMFunction callback;

        synchronized (callbackLock)
        {
            if (!bridgeEnabled)
                return;

            callback = displayErrorCallback;

            if (callback == null)
            {
                pendingDisplayError = info;
                Log.i(TAG, "FIAM display error buffered: " + info.message.campaignName);
                return;
            }
        }

        runOnGameThread(() -> invokeDisplayError(callback, info));
    }


    private void invokeImpression(GMFunction callback, MessageInfo info)
    {
        try
        {
            Log.i(TAG, "FIAM impression -> GML: " + info.campaignName);
            callback.call(
                info.messageId,
                info.campaignName,
                info.isTestMessage,
                info.messageType,
                info.dataJson
            );
        }
        catch (Exception error)
        {
            Log.e(TAG, "Impression callback failed.", error);
        }
    }


    private void invokeClick(GMFunction callback, ClickInfo info)
    {
        try
        {
            Log.i(TAG, "FIAM click -> GML: " + info.message.campaignName);
            callback.call(
                info.message.messageId,
                info.message.campaignName,
                info.message.isTestMessage,
                info.message.messageType,
                info.actionUrl,
                info.actionText,
                info.message.dataJson
            );
        }
        catch (Exception error)
        {
            Log.e(TAG, "Click callback failed.", error);
        }
    }


    private void invokeDismiss(GMFunction callback, MessageInfo info)
    {
        try
        {
            Log.i(TAG, "FIAM dismiss -> GML: " + info.campaignName);
            callback.call(
                info.messageId,
                info.campaignName,
                info.isTestMessage,
                info.messageType,
                info.dataJson
            );
        }
        catch (Exception error)
        {
            Log.e(TAG, "Dismiss callback failed.", error);
        }
    }


    private void invokeDisplayError(GMFunction callback, DisplayErrorInfo info)
    {
        try
        {
            Log.i(TAG, "FIAM display error -> GML: " + info.message.campaignName);
            callback.call(
                info.message.messageId,
                info.message.campaignName,
                info.message.isTestMessage,
                info.message.messageType,
                info.errorMessage,
                info.message.dataJson
            );
        }
        catch (Exception error)
        {
            Log.e(TAG, "Display-error callback failed.", error);
        }
    }


    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    private static final class MessageInfo
    {
        final String messageId;
        final String campaignName;
        final boolean isTestMessage;
        final String messageType;
        final String dataJson;

        MessageInfo(
            String messageId,
            String campaignName,
            boolean isTestMessage,
            String messageType,
            String dataJson)
        {
            this.messageId = messageId;
            this.campaignName = campaignName;
            this.isTestMessage = isTestMessage;
            this.messageType = messageType;
            this.dataJson = dataJson;
        }
    }


    private static final class ClickInfo
    {
        final MessageInfo message;
        final String actionUrl;
        final String actionText;

        ClickInfo(MessageInfo message, String actionUrl, String actionText)
        {
            this.message = message;
            this.actionUrl = actionUrl;
            this.actionText = actionText;
        }
    }


    private static final class DisplayErrorInfo
    {
        final MessageInfo message;
        final String errorMessage;

        DisplayErrorInfo(MessageInfo message, String errorMessage)
        {
            this.message = message;
            this.errorMessage = errorMessage;
        }
    }


    @SuppressWarnings("deprecation")
    private static MessageInfo messageInfo(
        InAppMessage message)
    {
        if (message == null)
        {
            return new MessageInfo(
                "",
                "",
                false,
                "unknown",
                "{}"
            );
        }

        // These compatibility getters still exist in the current FIAM API.
        // Firebase marks them deprecated in favor of CampaignMetadata, but
        // keeping them here avoids tying the wrapper to CampaignMetadata API
        // shape changes while retaining the same public GML contract.
        String messageId =
            safe(message.getCampaignId());

        String campaignName =
            safe(message.getCampaignName());

        Boolean test =
            message.getIsTestMessage();

        String type = "unknown";

        if (message.getMessageType() != null)
        {
            type =
                message.getMessageType()
                    .name()
                    .toLowerCase(Locale.US);
        }

        return new MessageInfo(
            messageId,
            campaignName,
            test != null && test.booleanValue(),
            type,
            dataJson(message.getData())
        );
    }


    private static ClickInfo clickInfo(
        InAppMessage message,
        Action action)
    {
        String actionUrl = "";
        String actionText = "";

        if (action != null)
        {
            actionUrl = safe(action.getActionUrl());

            Button button = action.getButton();
            if (button != null)
            {
                Text text = button.getText();
                if (text != null)
                    actionText = safe(text.getText());
            }
        }

        return new ClickInfo(
            messageInfo(message),
            actionUrl,
            actionText
        );
    }


    private static String dataJson(
        Map<String, String> data)
    {
        if (data == null || data.isEmpty())
            return "{}";

        try
        {
            return new JSONObject(data).toString();
        }
        catch (Exception error)
        {
            return "{}";
        }
    }


    private static String safe(
        String value)
    {
        return value != null ? value : "";
    }


    private static void runOnGameThread(
        Runnable runnable)
    {
        // GameMaker's Java callback bridge is safe from Android's main thread.
        // Do not depend on CurrentActivity here: a lifecycle callback may arrive
        // while the Activity reference is temporarily unavailable.
        if (Looper.myLooper() == Looper.getMainLooper())
        {
            runnable.run();
            return;
        }

        MAIN_HANDLER.post(runnable);
    }
}


package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.RunnerActivity;

import android.app.Activity;
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

    private volatile boolean impressionListenerInstalled = false;
    private volatile boolean clickListenerInstalled = false;
    private volatile boolean dismissListenerInstalled = false;
    private volatile boolean displayErrorListenerInstalled = false;


    private FirebaseInAppMessaging fiam()
    {
        return FirebaseInAppMessaging.getInstance();
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
        impressionCallback = callback;

        if (!impressionListenerInstalled)
        {
            fiam().addImpressionListener(this);
            impressionListenerInstalled = true;
        }
    }


    public void firebase_in_app_messaging_set_click_callback(
        GMFunction callback)
    {
        clickCallback = callback;

        if (!clickListenerInstalled)
        {
            fiam().addClickListener(this);
            clickListenerInstalled = true;
        }
    }


    public void firebase_in_app_messaging_set_dismiss_callback(
        GMFunction callback)
    {
        dismissCallback = callback;

        if (!dismissListenerInstalled)
        {
            fiam().addDismissListener(this);
            dismissListenerInstalled = true;
        }
    }


    public void firebase_in_app_messaging_set_display_error_callback(
        GMFunction callback)
    {
        displayErrorCallback = callback;

        if (!displayErrorListenerInstalled)
        {
            fiam().addDisplayErrorListener(this);
            displayErrorListenerInstalled = true;
        }
    }


    public void firebase_in_app_messaging_clear_callbacks()
    {
        FirebaseInAppMessaging instance = fiam();

        if (impressionListenerInstalled)
        {
            instance.removeImpressionListener(this);
            impressionListenerInstalled = false;
        }

        if (clickListenerInstalled)
        {
            instance.removeClickListener(this);
            clickListenerInstalled = false;
        }

        if (dismissListenerInstalled)
        {
            instance.removeDismissListener(this);
            dismissListenerInstalled = false;
        }

        if (displayErrorListenerInstalled)
        {
            instance.removeDisplayErrorListener(this);
            displayErrorListenerInstalled = false;
        }

        impressionCallback = null;
        clickCallback = null;
        dismissCallback = null;
        displayErrorCallback = null;
    }


    // -------------------------------------------------------------------------
    // Firebase lifecycle callbacks
    // -------------------------------------------------------------------------

    @Override
    public void impressionDetected(
        InAppMessage inAppMessage)
    {
        final GMFunction callback = impressionCallback;

        if (callback == null)
            return;

        final MessageInfo info =
            messageInfo(inAppMessage);

        runOnGameThread(() ->
        {
            try
            {
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
        });
    }


    @Override
    public void messageClicked(
        InAppMessage inAppMessage,
        Action action)
    {
        final GMFunction callback = clickCallback;

        if (callback == null)
            return;

        final MessageInfo info =
            messageInfo(inAppMessage);

        final String actionUrl =
            action != null
                ? safe(action.getActionUrl())
                : "";

        String actionText = "";

        if (action != null)
        {
            Button button = action.getButton();

            if (button != null)
            {
                Text text = button.getText();

                if (text != null)
                    actionText = safe(text.getText());
            }
        }

        final String finalActionText = actionText;

        runOnGameThread(() ->
        {
            try
            {
                callback.call(
                    info.messageId,
                    info.campaignName,
                    info.isTestMessage,
                    info.messageType,
                    actionUrl,
                    finalActionText,
                    info.dataJson
                );
            }
            catch (Exception error)
            {
                Log.e(TAG, "Click callback failed.", error);
            }
        });
    }


    @Override
    public void messageDismissed(
        InAppMessage inAppMessage)
    {
        final GMFunction callback = dismissCallback;

        if (callback == null)
            return;

        final MessageInfo info =
            messageInfo(inAppMessage);

        runOnGameThread(() ->
        {
            try
            {
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
        });
    }


    @Override
    public void displayErrorEncountered(
        InAppMessage inAppMessage,
        FirebaseInAppMessagingDisplayCallbacks.InAppMessagingErrorReason errorReason)
    {
        final GMFunction callback = displayErrorCallback;

        if (callback == null)
            return;

        final MessageInfo info =
            messageInfo(inAppMessage);

        final String errorMessage =
            errorReason != null
                ? errorReason.name()
                : "UNKNOWN";

        runOnGameThread(() ->
        {
            try
            {
                callback.call(
                    info.messageId,
                    info.campaignName,
                    info.isTestMessage,
                    info.messageType,
                    errorMessage,
                    info.dataJson
                );
            }
            catch (Exception error)
            {
                Log.e(TAG, "Display-error callback failed.", error);
            }
        });
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
        Activity activity =
            RunnerActivity.CurrentActivity;

        if (activity == null)
        {
            Log.w(
                TAG,
                "Skipping FIAM callback because CurrentActivity is null."
            );
            return;
        }

        activity.runOnUiThread(runnable);
    }
}

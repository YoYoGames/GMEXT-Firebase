package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

import com.google.firebase.functions.FirebaseFunctions;
import com.google.firebase.functions.HttpsCallableResult;
import com.google.firebase.functions.HttpsCallableReference;
import com.google.firebase.functions.FirebaseFunctionsException;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

import android.util.Log;

import androidx.annotation.NonNull;

import org.json.JSONObject;
import org.json.JSONException;

import java.util.Map;
import java.util.HashMap;

public class YYFirebaseCloudFunctions extends RunnerSocial {

    private static final String LOG_TAG = "YYFirebaseCloudFunctions";

    FirebaseFunctions functions;

    public YYFirebasePerformance() {
        functions = FirebaseFunctions.getInstance();
    }

    public void SDKFirebaseCloudFunctions_Init() {
        boolean useEmulator = FirebaseUtils.GetBoolExtOption("YYFirebaseCloudFunctions", "useEmulator");
        if (useEmulator) {
            String host = FirebaseUtils.extOptionGetString("YYFirebaseCloudFunctions", "emulatorHost");
            int port = FirebaseUtils.extOptionGetInt("YYFirebaseCloudFunctions", "emulatorPort");
            FirebaseFunctions.useEmulator(host, port);
        }
    }

    // <editor-fold desc="General API">

    /**
     * Calls a Firebase Cloud Function with the specified name, data, and timeout.
     *
     * @param functionName   The name of the Cloud Function to call.
     * @param data           The data to send to the Cloud Function, represented as a string.
     * @param timeoutSeconds The timeout in seconds. If negative, timeout is not set.
     * @return The async ID as a double.
     */
    public double SDKFirebaseCloudFunctions_Call(String functionName, String data, double timeoutSeconds) {
        final long asyncId = getNextAsyncId();

        // Submit the task to a background thread
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            Object parsedData = null;

            // Parse the data
            try {
                parsedData = parseDataString(data);
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Invalid JSON input", e);
                sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, 400, "Invalid JSON input");
                return;
            }

            FirebaseFunctions functions = FirebaseFunctions.getInstance();

            // Get the callable reference
            com.google.firebase.functions.HttpsCallableReference callable = functions.getHttpsCallable(functionName);

            // Set timeout if specified
            if (timeoutSeconds > 0) {
                callable = callable.setTimeout((long) (timeoutSeconds * 1000)); // Convert seconds to milliseconds
            }

            callable
                .call(parsedData)
                .addOnCompleteListener(task -> {
                    if (!task.isSuccessful()) {
                        // Handle error
                        Exception e = task.getException();
                        String errorMessage = "Unknown error";
                        int statusCode = 400;

                        if (e instanceof FirebaseFunctionsException) {
                            FirebaseFunctionsException ffe = (FirebaseFunctionsException) e;
                            FirebaseFunctionsException.Code code = ffe.getCode();
                            errorMessage = ffe.getMessage();
                            statusCode = getStatusCodeFromFunctionsExceptionCode(code);
                        } else if (e != null) {
                            errorMessage = e.getMessage();
                        }

                        sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, statusCode, errorMessage);
                    } else {
                        // Get the result
                        HttpsCallableResult result = task.getResult();
                        Object responseData = result.getData();

                        Map<String, Object> extraData = new HashMap<>();
                        extraData.put("value", responseData);

                        sendFunctionsEvent("FirebaseCloudFunctions_Call", asyncId, 200, extraData);
                    }
                });
        });

        return (double) asyncId;
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    /**
     * Parses a string representation of data and converts it into the appropriate Java object type.
     * This method attempts to interpret the input string {@code data} as one of several possible data types.
     *
     * @param data The string representation of the data to be parsed. It can be a special keyword, JSON string, numeric value, or plain text.
     * @return The parsed data as an appropriate Java object.
     * @throws JSONException If an error occurs while parsing {@code data} as a JSON object or array.
     *                       Note that in this implementation, {@code JSONException} is caught internally, so this method
     *                       does not actually throw it. You may consider removing {@code throws JSONException} from the method signature.
     */
    private Object parseDataString(String data) throws JSONException {

        if (data.isEmpty()) {
            return data;
        }

        switch (data.toLowerCase()) {
            case "@@null$$":
                return null;
            case "@@true$$":
                return true;
            case "@@false$$":
                return false;
            default:
                // Not special types
                break;
        }

        // Try parsing as JSON object
        try {
            JSONObject jsonObject = new JSONObject(data);
            return jsonObject;
        } catch (JSONException e) {
            // Not a JSON object
        }

        // Try parsing as JSON array
        try {
            JSONArray jsonArray = new JSONArray(data);
            return jsonArray;
        } catch (JSONException e) {
            // Not a JSON array
        }

        // Try parsing as number
        try {
            if (data.contains(".")) {
                return Double.parseDouble(data);
            } else {
                return Long.parseLong(data);
            }
        } catch (NumberFormatException e) {
            // Not a number
        }

        // Treat as string
        return data;
    }

    /**
     * Generates the next unique async ID using FirebaseUtils.
     *
     * @return The next async ID as a long.
     */
    private long getNextAsyncId() {
        return FirebaseUtils.getInstance().getNextAsyncId();
    }

    /**
     * Maps a FirebaseFunctionsException.Code to an appropriate HTTP status code.
     *
     * @param code The FirebaseFunctionsException.Code to map.
     * @return The corresponding HTTP status code as an int.
     */
    private int getStatusCodeFromFunctionsExceptionCode(FirebaseFunctionsException.Code code) {
        switch (code) {
            case OK:
                return 200;
            case CANCELLED:
                return 499;
            case UNKNOWN:
                return 500;
            case INVALID_ARGUMENT:
                return 400;
            case DEADLINE_EXCEEDED:
                return 504;
            case NOT_FOUND:
                return 404;
            case ALREADY_EXISTS:
                return 409;
            case PERMISSION_DENIED:
                return 403;
            case RESOURCE_EXHAUSTED:
                return 429;
            case FAILED_PRECONDITION:
                return 412;
            case ABORTED:
                return 409;
            case OUT_OF_RANGE:
                return 400;
            case UNIMPLEMENTED:
                return 501;
            case INTERNAL:
                return 500;
            case UNAVAILABLE:
                return 503;
            case DATA_LOSS:
                return 500;
            case UNAUTHENTICATED:
                return 401;
            default:
                return 500;
        }
    }

    /**
     * Sends an event by assembling common data and delegating to sendSocialAsyncEvent.
     *
     * @param eventType The type of event.
     * @param asyncId   The unique async ID.
     * @param status    The HTTP status code representing the result.
     * @param extraData Additional data to include in the event.
     */
    private void sendFunctionsEvent(String eventType, long asyncId, int status, Map<String, Object> extraData) {
        Map<String, Object> data = new HashMap<>();
        data.put("listener", asyncId);
        data.put("status", status);

        if (extraData != null) {
            data.putAll(extraData);
        }

        FirebaseUtils.sendSocialAsyncEvent(eventType, data);
    }

    /**
     * Sends an error event with the specified parameters.
     *
     * @param eventType    The type of event.
     * @param asyncId      The unique async ID.
     * @param statusCode   The HTTP status code representing the error.
     * @param errorMessage The error message to include.
     */
    private void sendErrorEvent(String eventType, long asyncId, int statusCode, String errorMessage) {
        Map<String, Object> extraData = new HashMap<>();
        extraData.put("errorMessage", errorMessage);

        sendFunctionsEvent(eventType, asyncId, statusCode, extraData);
    }

    // </editor-fold>
}

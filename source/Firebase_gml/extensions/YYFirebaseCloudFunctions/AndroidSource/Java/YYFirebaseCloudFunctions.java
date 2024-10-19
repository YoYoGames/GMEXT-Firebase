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

    private HashMap<Long, HttpsCallableReference> referenceMap;

    public YYFirebaseCloudFunctions() {
        referenceMap = new HashMap<>();
    }

    public void SDKFirebaseCloudFunctions_Init() {
        // use emulator??
    }

    // <editor-fold desc="General API">

    /**
     * Calls a Firebase Cloud Function with the specified name and JSON data.
     *
     * @param functionName The name of the Cloud Function to call.
     * @param jsonData     The JSON string representing the data to send.
     * @return The async ID as a double.
     */
    public double SDKFirebaseCloudFunctions_Call(String functionName, String jsonData) {
        final long asyncId = getNextAsyncId();

        // Submit the task to a background thread
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            // Parse the JSON data
            Map<String, Object> dataMap = null;
            try {
                dataMap = FirebaseUtils.convertJSONToMap(new JSONObject(jsonData));
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Invalid JSON input", e);
                sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, 400, "Invalid JSON input");
            }

            FirebaseFunctions functions = FirebaseFunctions.getInstance();

            functions
                .getHttpsCallable(functionName)
                .call(dataMap)
                .addOnCompleteListener(new OnCompleteListener<HttpsCallableResult>() {
                    @Override
                    public void onComplete(@NonNull Task<HttpsCallableResult> task) {
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
                            Object data = result.getData();

                            Map<String, Object> extraData = new HashMap<>();
                            extraData.put("value", data);

                            sendFunctionsEvent("FirebaseCloudFunctions_Call", asyncId, 200, extraData);
                        }
                    }
                });
        });

        return (double) asyncId;
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

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

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.ProcessedDataItem;

import com.yoyogames.runner.RunnerJNILib;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

public class FirebaseUtils {

    // A list to store initialization functions and their priorities
    private List<InitFunction> initFunctions;

    // Define the InitFunction class
    private static class InitFunction implements Comparable<InitFunction> {
        Runnable function;
        int priority;

        InitFunction(Runnable function, int priority) {
            this.function = function;
            this.priority = priority;
        }

        @Override
        public int compareTo(InitFunction other) {
            // Lower priority value means higher priority
            return Integer.compare(this.priority, other.priority);
        }
    }

    // Event handling variables
    private static final int EVENT_SOCIAL = 70;
    private static final long MAX_DOUBLE_SAFE = 9007199254740992L; // 2^53
    private static final Pattern I64_PATTERN = Pattern.compile("^@i64@([0-9a-fA-F]{1,16})\\$i64\\$$"); // match "@i64@%llx$i64$"

    // UID generator variables
    private AtomicLong currentAsyncId;

    private static final long GENERATOR_STARTING_POINT = 5000;

    // Executor variables
    private ExecutorService executorService;

    private static int CORE_POOL_SIZE = 0;
    private static int MAX_POOL_SIZE = 100;
    private static long KEEP_ALIVE_TIME = 60L;
    private static TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.SECONDS;

    private static FirebaseUtils instance;

    private FirebaseUtils() {
        currentAsyncId = new AtomicLong(GENERATOR_STARTING_POINT); // Starting point
        
        // Custom ThreadPoolExecutor with bounded maximum threads
        BlockingQueue<Runnable> workQueue = new SynchronousQueue<>();
        
        executorService = new ThreadPoolExecutor(
            CORE_POOL_SIZE,
            MAX_POOL_SIZE,
            KEEP_ALIVE_TIME,
            KEEP_ALIVE_TIME_UNIT,
            workQueue,
            Executors.defaultThreadFactory(),
            new ThreadPoolExecutor.AbortPolicy()
        );

        // Initialize the initFunctions list
        initFunctions = new ArrayList<>();
    }

    public static synchronized FirebaseUtils getInstance() {
        if (instance == null) {
            instance = new FirebaseUtils();
        }
        return instance;
    }

    public void registerInitFunction(Runnable function, int priority) {
        if (function == null) {
            return;
        }
        synchronized (initFunctions) {
            initFunctions.add(new InitFunction(function, priority));
        }
    }

    public void initializeAll() {
        synchronized (initFunctions) {
            // Sort the functions based on priority
            Collections.sort(initFunctions);
    
            // Execute each function
            for (InitFunction initFunction : initFunctions) {
                try {
                    initFunction.function.run();
                } catch (Exception e) {
                    System.err.println("FirebaseUtils: Initialization function failed - " + e.getMessage());
                    e.printStackTrace();
                }
            }
    
            // Clear the list after initialization
            initFunctions.clear();
        }
    }

    public long getNextAsyncId() {
        long nextId = currentAsyncId.incrementAndGet();
        // Ensure the double can represent the long value accurately
        if (nextId >= (1L << 53)) {
            throw new RuntimeException("Listener ID limit reached");
        }
        return nextId;
    }

    public void submitAsyncTask(Runnable task) {
        try {
            executorService.submit(task);
        } catch (RejectedExecutionException e) {
            // Handle task rejection (e.g., log, retry, or alert)
            System.err.println("FirebaseUtils: Task submission rejected - " + e.getMessage());
        }
    }

    public static void sendSocialAsyncEvent(String eventType, Map<String, Object> data) {
        FirebaseUtils.sendAsyncEvent(EVENT_SOCIAL, eventType, data);
    }

    public static void sendAsyncEvent(int eventId, String eventType, Map<String, Object> data) {
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            List<ProcessedDataItem> processedItems = new ArrayList<>();

            // Add the event type
            processedItems.add(new ProcessedDataItem("type", eventType, ProcessedDataItem.FunctionType.ADD_STRING));

            if (data != null) {
                for (Map.Entry<String, Object> entry : data.entrySet()) {
                    ProcessedDataItem item = processValue(entry.getKey(), entry.getValue());
                    if (item != null) {
                        processedItems.add(item);
                    }
                }
            }

            // Dispatch to UI thread
            RunnerActivity.CurrentActivity.runOnUiThread(() -> {
                int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);

                for (ProcessedDataItem item : processedItems) {
                    switch (item.functionType) {
                        case ADD_STRING:
                            RunnerJNILib.DsMapAddString(dsMapIndex, item.key, (String) item.value);
                            break;
                        case ADD_DOUBLE:
                            RunnerJNILib.DsMapAddDouble(dsMapIndex, item.key, (Double) item.value);
                            break;
                        case ADD_INT:
                            RunnerJNILib.DsMapAddDouble(dsMapIndex, item.key, ((Integer) item.value).doubleValue()); // Use DsMapAddInt if available
                            break;
                    }
                }

                RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, eventId);
            });
        });
    }

    private static ProcessedDataItem processValue(String key, Object value) {
        if (value == null) {
            return null;
        }
        
        if (value instanceof String) {
            return new ProcessedDataItem(key, value, ProcessedDataItem.FunctionType.ADD_STRING);
        } else if (value instanceof Boolean) {
            double doubleValue = (Boolean) value ? 1.0 : 0.0;
            return new ProcessedDataItem(key, doubleValue, ProcessedDataItem.FunctionType.ADD_DOUBLE);
        } else if (value instanceof Integer || value instanceof Short || value instanceof Byte) {
            int intValue = ((Number) value).intValue();
            return new ProcessedDataItem(key, intValue, ProcessedDataItem.FunctionType.ADD_INT);
        } else if (value instanceof Double || value instanceof Float) {
            double doubleValue = ((Number) value).doubleValue();
            return new ProcessedDataItem(key, doubleValue, ProcessedDataItem.FunctionType.ADD_DOUBLE);
        } else if (value instanceof Long) {
            long longValue = (Long) value;
            if (Math.abs(longValue) <= MAX_DOUBLE_SAFE) {
                return new ProcessedDataItem(key, (double) longValue, ProcessedDataItem.FunctionType.ADD_DOUBLE);
            } else {
                String formattedLong = String.format("@i64@%016x$i64$", longValue);
                return new ProcessedDataItem(key, formattedLong, ProcessedDataItem.FunctionType.ADD_STRING);
            }
        } else if (value instanceof Map) {
            try {
                String jsonString = new JSONObject((Map<?, ?>) value).toString();
                return new ProcessedDataItem(key, jsonString, ProcessedDataItem.FunctionType.ADD_STRING);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else if (value instanceof List) {
            try {
                String jsonString = new JSONArray((List<?>) value).toString();
                return new ProcessedDataItem(key, jsonString, ProcessedDataItem.FunctionType.ADD_STRING);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else {
            // Convert other types to String
            return new ProcessedDataItem(key, value.toString(), ProcessedDataItem.FunctionType.ADD_STRING);
        }
    }

    /**
     * Recursively converts a JSONObject or JSONArray into a Map<String, Object> or List<Object>.
     * Special handling is added for Strings matching the "@i64@%llx$i64$" pattern, converting them to Long.
     *
     * @param json The JSONObject, JSONArray, or primitive to convert.
     * @return A Map<String, Object>, List<Object>, or primitive type.
     */
    public static Object convertJSON(Object json) {
        if (json == null) {
            return null;
        }

        if (json instanceof JSONObject) {
            return convertJSONObject((JSONObject) json);
        } else if (json instanceof JSONArray) {
            return convertJSONArray((JSONArray) json);
        } else if (json instanceof Boolean || json instanceof Long || json instanceof Double) {
            return json;
        }
        else if (json instanceof String) {
            Long convertedLong = convertStringToLongIfApplicable((String) json);
            return (convertedLong != null) ? convertedLong : json;
        } else {
            // Handle other types if necessary, defaulting to String representation
            return json.toString();
        }
    }

    /**
     * Converts a JSONObject into a Map<String, Object>, handling nested structures recursively.
     * Applies special conversion for strings matching the "@i64@%llx$i64$" pattern.
     *
     * @param jsonObject The JSONObject to convert.
     * @return A Map<String, Object> representing the JSONObject.
     */
    private static Map<String, Object> convertJSONObject(JSONObject jsonObject) {
        Map<String, Object> map = new HashMap<>();

        Iterator<String> keys = jsonObject.keys(); // Use keys() instead of keySet()
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = jsonObject.opt(key);
            map.put(key, convertJSON(value)); // Assume convertJSON is implemented correctly
        }

        return Collections.unmodifiableMap(map);
    }

    /**
     * Converts a JSONArray into a List<Object>, handling nested structures recursively.
     * Applies special conversion for strings matching the "@i64@%llx$i64$" pattern.
     *
     * @param jsonArray The JSONArray to convert.
     * @return A List<Object> representing the JSONArray.
     */
    private static List<Object> convertJSONArray(JSONArray jsonArray) {
        List<Object> list = new ArrayList<>();

        for (int i = 0; i < jsonArray.length(); i++) {
            Object value = jsonArray.opt(i);
            list.add(convertJSON(value));
        }

        return Collections.unmodifiableList(list);
    }

    /**
     * Checks if a string matches the "@i64@%llx$i64$" pattern and converts it to Long if applicable.
     *
     * @param str The string to check and potentially convert.
     * @return The Long value if conversion is successful; otherwise, null.
     */
    private static Long convertStringToLongIfApplicable(String str) {
        Matcher matcher = I64_PATTERN.matcher(str);
        if (matcher.matches()) {
            String hexPart = matcher.group(1);
            try {
                // Parse the hexadecimal part to a Long
                return Long.parseLong(hexPart, 16);
            } catch (NumberFormatException e) {
                System.err.println("JSONConverter: Failed to parse hex string to Long - " + e.getMessage());
                // Optionally, handle the error or return null
            }
        }
        return null;
    }

    public static double extOptionGetReal(String extension, String option) {
        return RunnerJNILib.extOptGetReal(extension, option);
    }

    public static int extOptionGetInt(String extension, String option) {
        return (int) extOptionGetReal(extension, option);
    }

    public static String extOptionGetString(String extension, String option) {
        return RunnerJNILib.extOptGetString(extension, option);
    }

    public static boolean extOptionGetBool(String extension, String option) {
        return extOptionGetString(extension, option).toLowerCase().equals("true");
    }

    public void shutdown() {
        executorService.shutdown();
        try {
            if (!executorService.awaitTermination(60, TimeUnit.SECONDS)) {
                executorService.shutdownNow();
                if (!executorService.awaitTermination(60, TimeUnit.SECONDS)) {
                    System.err.println("FirebaseUtils: ExecutorService did not terminate");
                }
            }
        } catch (InterruptedException ie) {
            executorService.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }
}

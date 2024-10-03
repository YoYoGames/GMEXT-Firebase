package ${YYAndroidPackageName};
import java.util.concurrent.atomic.AtomicLong;

public class ListenerIDGenerator {
	private static final long GENERATOR_STARTING_POINT = 5000;

    private static ListenerIDGenerator instance;
    private AtomicLong currentListenerId;

    private ListenerIDGenerator() {
        currentListenerId = new AtomicLong(GENERATOR_STARTING_POINT); // Starting point
    }

    public static synchronized ListenerIDGenerator getInstance() {
        if (instance == null) {
            instance = new ListenerIDGenerator();
        }
        return instance;
    }

    public long getNextListenerId() {
        long nextId = currentListenerId.incrementAndGet();
        // Ensure the double can represent the long value accurately
        if (nextId >= (1L << 53)) {
            throw new RuntimeException("Listener ID limit reached");
        }
        return nextId;
    }
}
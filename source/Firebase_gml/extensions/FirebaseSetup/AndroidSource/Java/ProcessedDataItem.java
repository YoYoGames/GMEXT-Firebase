package ${YYAndroidPackageName};

public class ProcessedDataItem {
    public enum FunctionType {
        ADD_STRING,
        ADD_DOUBLE,
        ADD_INT
    }

    public String key;
    public Object value; // Can be String or Number
    public FunctionType functionType;

    public ProcessedDataItem(String key, Object value, FunctionType functionType) {
        this.key = key;
        this.value = value;
        this.functionType = functionType;
    }
}

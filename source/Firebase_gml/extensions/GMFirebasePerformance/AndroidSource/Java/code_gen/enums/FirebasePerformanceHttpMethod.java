// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName}.enums;

public enum FirebasePerformanceHttpMethod
{
    Get((int)0),
    Put((int)1),
    Post((int)2),
    Delete((int)3),
    Head((int)4),
    Patch((int)5),
    Options((int)6),
    Trace((int)7),
    Connect((int)8);

    private final int value;
    private FirebasePerformanceHttpMethod(int v)
    {
        this.value = v;
    }
    public int value()
    {
        return this.value;
    }
    public static FirebasePerformanceHttpMethod from(int v)
    {
        switch (v)
        {
            case 0:
                return FirebasePerformanceHttpMethod.Get;
            case 1:
                return FirebasePerformanceHttpMethod.Put;
            case 2:
                return FirebasePerformanceHttpMethod.Post;
            case 3:
                return FirebasePerformanceHttpMethod.Delete;
            case 4:
                return FirebasePerformanceHttpMethod.Head;
            case 5:
                return FirebasePerformanceHttpMethod.Patch;
            case 6:
                return FirebasePerformanceHttpMethod.Options;
            case 7:
                return FirebasePerformanceHttpMethod.Trace;
            case 8:
                return FirebasePerformanceHttpMethod.Connect;
            default:
                throw new IllegalArgumentException("Unknown FirebasePerformanceHttpMethod value: " + v);
        }
    }
}
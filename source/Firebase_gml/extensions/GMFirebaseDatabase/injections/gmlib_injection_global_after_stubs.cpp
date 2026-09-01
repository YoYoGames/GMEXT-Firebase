struct GMRTRunnerInterface
{
    const char* (*ExtOptGetString)(const char* _ext, const char* _opt);
};
void Init_GMFirebaseDatabase()
{
    GMRTRunnerInterface ri;
    ri.ExtOptGetString = &ExtensionOptions_GetValue;

    using FunctionPointer = void (*)(GMRTRunnerInterface*, size_t);
    FunctionPointer fnHandle = nullptr;
    void* libHandle = nullptr;

    libHandle = ExtUtils_GetLibraryHandle("GMFirebaseDatabase.ext");
    if (libHandle)
    {
        fnHandle = (FunctionPointer)SharedLibrary_GetFunctionAddress(libHandle, "GMExtensionInitialise");
        if (fnHandle) fnHandle(&ri, sizeof(GMRTRunnerInterface));
    }
}
void Startup_GMFirebaseDatabase()
{
    if (isInitialized) return;

    using FunctionPointer = void (*)();
    FunctionPointer fnHandle = nullptr;
    void* libHandle = nullptr;

    isInitialized = true;
}
void Shutdown_GMFirebaseDatabase()
{
    if (!isInitialized) return;

    using FunctionPointer = void (*)();
    FunctionPointer fnHandle = nullptr;
    void* libHandle = nullptr;

    isInitialized = false;
}

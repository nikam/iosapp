import 'dart:ffi'; // For FFI
//import 'dart:io'; // For Platform.isX

// final DynamicLibrary nativeAddLib = Platform.isIOS
//     ? DynamicLibrary.open('libVulkanCompute.dylib')
//     : DynamicLibrary.process();

class FFIBridge {
  static bool initialize() {
    DynamicLibrary nativeApiLib = DynamicLibrary.process();

    final runTest = nativeApiLib
        .lookup<NativeFunction<Int32 Function()>>('runTest')
        .asFunction<int Function()>();

    // final testrun = nativeApiLib
    //     .lookup<NativeFunction<Void Function()>>('test_run')
    //     .asFunction<void Function()>();

    final run = nativeApiLib
        .lookup<NativeFunction<Int32 Function()>>('run')
        .asFunction<int Function()>();

    // Function _run = run.asFunction<int Function()>();

    run();
    runTest();
    // testrun();

    return true;
  }
}

void main() {
  FFIBridge.initialize();
  // runApp(const MyApp());
}

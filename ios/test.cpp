#include <iostream>
using namespace std;

extern "C" /* <= C++ only */ __attribute__((visibility("default"))) __attribute__((used))

void test_run() {
    
    cout<< "hello from program 2";
}

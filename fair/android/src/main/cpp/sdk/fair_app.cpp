
#include <fair_app.h>
#include <jni.h>
#include <fair_ffi.h>
#include <cstring>
#include <cstdlib>

jobject fair_ffi;

extern "C"
JNIEXPORT void JNICALL
Java_com_wuba_fair_channel_FairFfi_init(JNIEnv *env,
                                                           jobject instance,
                                                           jobject obj) {
//---- 强全局变量
  fair_ffi = env->NewGlobalRef(obj);
}

extern "C"
JNIEXPORT void JNICALL
Java_com_wuba_fair_channel_FairFfi_release(JNIEnv *env,
                                                              jobject instance) {
  env->DeleteGlobalRef(fair_ffi);
}

jobject get_fair_ffi() {
  return fair_ffi;
}
//extern "C"
//JNIEXPORT jstring JNICALL
//Java_com_wuba_fair_channel_FairFfi_nativeCallFlutterFunctionSync(
//    JNIEnv *env,
//    jobject thiz,
//    jstring json_string) {
//  const char *convert_param = env->GetStringUTFChars(json_string, nullptr);
//  char *result = NativeCallFlutterFunctionSync(strdup(convert_param));
//  jstring resultString = env->NewStringUTF(result);
//  free(result);
//  return resultString;
//}


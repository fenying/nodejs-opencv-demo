#include <napi.h>
#include <vector>
#include <opencv2/opencv.hpp>

Napi::Value get_image_size(const Napi::CallbackInfo& info) {

  Napi::Env env = info.Env();

  if (info.Length() < 1 || !info[0].IsString()) {
    Napi::TypeError::New(env, "Invalid argument: image path").ThrowAsJavaScriptException();
    return Napi::Buffer<uint8_t>::New(env, 0);
  }

  auto path = info[0].As<Napi::String>();

  cv::Mat img = cv::imread((std::string)path);

  // Check for invalid input
  if(img.empty()) {
    Napi::TypeError::New(env, "Invalid image").ThrowAsJavaScriptException();
    return Napi::Buffer<uint8_t>::New(env, 0);
  }

  Napi::Object obj = Napi::Object::New(env);

  obj.Set("width", Napi::Number::New(env, img.cols));
  obj.Set("height", Napi::Number::New(env, img.rows));

  return obj;
}


Napi::Object Init(Napi::Env env, Napi::Object exports) {

    exports.Set(
        Napi::String::New(env, "get_image_size"),
        Napi::Function::New(env, get_image_size)
    );

    return exports;
}

NODE_API_MODULE(addon, Init)
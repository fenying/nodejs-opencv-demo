{
  "targets": [
    {
      "target_name": "image",
      "cflags_cc!": [ "-fno-exceptions","-fno-rtti" ],
      "sources": [ "image.cc" ],
      "include_dirs": [
        "/usr/local/include/opencv4",
         "./node_modules/node-addon-api",
      ],
      "libraries": [
        "-L/usr/local/lib/",
        "-lopencv_core",
        "-lopencv_imgproc",
        "-lopencv_imgcodecs"
      ],
      'defines': [ 'NAPI_DISABLE_CPP_EXCEPTIONS' ],
    }
  ]
}
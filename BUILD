load("@rules_python//python:defs.bzl", "py_binary")

cc_binary(
    name = "hello",
    srcs = ["hello.cc"],
)

py_binary(
  name = "main",
  srcs = ["main.py"],
)

cc_library(
    name = "say",
    srcs = ["say.cc"],
    hdrs = ["say.h"],
)

cc_binary(
    name = "do_say",
    srcs = ["do_say.cc"],
    deps = [
      ":say",
    ],
)
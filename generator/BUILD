load("@pip_deps//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
  name = "pillow_generator",
  srcs = ["pillow_generator.py"],
  deps = [
    requirement("Pillow"),
  ],
  visibility = [
    "//visibility:public",
  ],
)
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("//build_defs:images.bzl", "pillow_image")

# ------------------------------------------------

# Images generated with Bazel

pillow_image(
    name = "hello_world",
    message = "Hello world Bazel!",
)

pillow_image(
    name = "foo",
    message = "This is foo!",
)

pillow_image(
    name = "bar",
    message = "This is bar!",
)

[
    pillow_image(
        name = word,
        message = word + word + word,
    )
    
    for word in ['lorem', 'ipsum']
]

# ------------------------------------------------

# A webserver hosting the images above

go_binary(
    name = "server",
    srcs = ["server.go"],
    embedsrcs = [
        ":hello_world.png",
        ":foo.png",
        ":bar.png",
        ":lorem.png",
        ":ipsum.png",
    ],
)
def _pillow_image_impl(ctx):
    output_image = ctx.outputs.out
    generator_args = ctx.actions.args()

    generator_args.add("--image", output_image.path)
    generator_args.add("--message", ctx.attr.message)

    ctx.actions.run(
        outputs = [output_image],
        arguments = [generator_args],
        executable = ctx.executable.generator,
    )

    return [
        DefaultInfo(files = depset([output_image]))
    ]

_pillow_image = rule(
    implementation = _pillow_image_impl,
    attrs = {
        "message": attr.string(
            doc = "Message for the generated image",
            mandatory = True,
        ),
        "out": attr.output(
            doc = "Output label for the generated PNG (must end with .png)",
            mandatory = True,
        ),
        "generator": attr.label(
            default = Label("//generator:pillow_generator"),
            allow_files = True,
            executable = True,
            cfg = "exec",
        ),
    },
)

def pillow_image(name, **kwargs):
    output_label = "%s.png" % name

    _pillow_image(
        name = name,
        out = output_label,
        **kwargs)
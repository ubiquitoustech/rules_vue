"""
vue actions
"""

load("@build_bazel_rules_nodejs//:providers.bzl", "run_node")

def vue_build_action(ctx, srcs, out):
    """Run a production build of the vite project

    Args:
        ctx: arguments description, can be
        multiline with additional indentation.
        srcs: source files
        out: output directory
    """

    # setup the args passed to vite
    launcher_args = ctx.actions.args()

    launcher_args.add_all([
        "build",
        "--dest",
        out.path,
    ])

    launcher_args.add_all(ctx.attr.args)

    outputs = []
    outputs.append(out)

    execution_requirements = {}
    if "no-remote-exec" in ctx.attr.tags:
        execution_requirements = {"no-remote-exec": "1"}

    run_node(
        ctx = ctx,
        # progress_message = "Building vue project %s [vue]" % outputs[0].short_path,
        inputs = depset(srcs),
        outputs = outputs,
        arguments = [launcher_args],
        # execution_requirements = execution_requirements,
        mnemonic = "vue",
        executable = "_vue",
        # link_workspace_root = True,
        # env = {"BUILD_DIR": out.path},
    )

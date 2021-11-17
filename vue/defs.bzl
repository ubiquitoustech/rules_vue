"Public API re-exports"

load(
    "@ubiquitous_tech_rules_vue//vue/private:rules.bzl",
    _vue = "vue_build",
    _vue_dev = "vue_devserver_macro",
)

vue = _vue
vue_dev = _vue_dev

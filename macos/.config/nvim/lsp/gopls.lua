return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "WORKSPACE", "BUILD.bazel", ".git" },
  ["build.directoryFilters"] = {
    "-bazel-bin",
    "-bazel-gocode",
    "-bazel-out",
    "-bazel-testlogs",
    "-vendor/github.com/containernetworking/plugins/pkg/ns",
    "-vendor/github.com/bsm/go-sparkey",
    "-puppet-config",
  },
  ["formatting.local"] = "git.corp.stripe.com/stripe-internal/gocode",
  memoryMode = "DegradeClosed",
  staticcheck = false,
}

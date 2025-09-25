#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Sets an environment variable with the tool version when asdf is the source" {
  export BUILDKITE_PLUGIN_TOOL_VERSIONS_ENV_TOOLS_123="terraform"
  export BUILDKITE_PLUGIN_TOOL_VERSIONS_ENV_SOURCE="asdf"

  run "$PWD/hooks/post-checkout"

  assert_success
  assert_output --partial "Setting TERRAFORM_VERSION to 1.2.3."
}

@test "Sets an environment variable with the tool version when mise is the source" {
  export BUILDKITE_PLUGIN_TOOL_VERSIONS_ENV_TOOLS_123="tflint"
  export BUILDKITE_PLUGIN_TOOL_VERSIONS_ENV_SOURCE="mise"

  run "$PWD/hooks/post-checkout"

  assert_success
  assert_output --partial "Setting TFLINT_VERSION to 9.87.6."
}

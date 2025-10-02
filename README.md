# Tool versions -> env

A Buildkite plugin to read `asdf` or `mise` config files, and set environment variables.

## Example

Use the plugin in your steps like this:

```yaml
steps:
  - command: 'echo $RUBY_VERSION'
    plugins:
      - buildkite/tool-versions-env#main:
          source: asdf
          tools:
            - terraform
```

## Configuration

### `source` (optional, string)

Defaults to `asdf`.

This determines the type of config the plugin will read.

When `source` is set to `asdf` (or left as the default), the plugin will read from `.tool-versions`.

When `source` is set to `mise`, the plugin will read from `.mise.toml`.

### `tools` (required, array(string))

A list of tools as they appear in the config file. These should be the names of `asdf` or `mise` plugins.

## Requirements

The plugin requires the following binaries to be available on the `PATH`:

- `awk`
- `tr`

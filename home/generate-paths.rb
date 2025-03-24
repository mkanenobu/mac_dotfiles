#!/usr/bin/env ruby

# Generate PATH string for use in shell configuration.

home = ENV['HOME']

paths = [
  "/opt/homebrew/bin",
  "$HOME/.nimble/bin",
  "$HOME/.cargo/bin",
  "$HOME/.nodenv/bin",
  "$HOME/go/bin",
  "$HOME/.local/toolbox",
  "$HOME/.local/bin",

  # Rancher Desktop
  "$HOME/.rd/bin",
  # Android
  "$HOME/Library/Android/sdk/platform-tools",
  # Google Cloud SDK
  "$HOME/google-cloud-sdk/bin",
  # rebar3 (for erlang)
  "$HOME/.cache/rebar3/bin",
  # coursier (for scala)
  "$HOME/Library/Application Support/Coursier/bin",
  # moonbit
  "$HOME/.moon/bin",
  # elan, lean 4 version manager
  "$HOME/.elan/bin",
]

# Replace "$HOME" with the actual home directory path
path_string = paths.map { |path| path.gsub('$HOME', home) }.join(':')

puts path_string

#!/usr/bin/env ruby

# Generate PATH string for use in shell configuration.

home = ENV['HOME']

paths = [
  "/opt/homebrew/bin",
  "$HOME/.nimble/bin",
  "$HOME/.cargo/bin",
  "$HOME/go/bin",
  "$HOME/.local/toolbox",
  "$HOME/.local/bin",
  "$HOME/.claude/local",

  # Android
  "$HOME/Library/Android/sdk/platform-tools",
  # Google Cloud SDK
  "$HOME/google-cloud-sdk/bin",
  # Flutter
  "$HOME/.flutter/bin",

  # Julia
  "$HOME/.juliaup/bin",
]

# Replace "$HOME" with the actual home directory path
path_string = paths.map { |path| path.gsub('$HOME', home) }.join(':')

puts path_string

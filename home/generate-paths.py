#!/usr/bin/env python

import os

# Generate PATH string for use in shell configuration.
home = os.getenv("HOME")

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
]

# Replace "$HOME" with the actual home directory path
path_string = ":".join(path.replace("$HOME", home) for path in paths)

print(path_string)

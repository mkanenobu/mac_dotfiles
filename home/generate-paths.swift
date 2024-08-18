#!/usr/bin/swift

/**
 * Generate PATH string for use in shell configuration.
 */

import Foundation
import Darwin

let home = ProcessInfo.processInfo.environment["HOME"]!

let paths = [
  "/opt/homebrew/bin",
  "$HOME/.nimble/bin",
  "$HOME/.cargo/bin",
  "$HOME/.nodenv/bin",
  "$HOME/go/bin",
  "$HOME/.local/toolbox",
  "$HOME/.local/bin",

  // Rancher Desktop
  "$HOME/.rd/bin",
  // Android
  "$HOME/Library/Android/sdk/platform-tools",
  // Google Cloud SDK
  "$HOME/google-cloud-sdk/bin",
  // rebar3 (for erlang)
  "$HOME/.cache/rebar3/bin",
  // coursier (for scala)
  "$HOME/Library/Application Support/Coursier/bin",
]

let pathString = paths.map { $0.replacingOccurrences(of: "$HOME", with: home) }.joined(separator: ":")

fputs(pathString, stdout)

#!/bin/sh

enable() {
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
}

disable() {
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
}

case "$1" in
  "enable"  ) enable  ;;
  "disable" ) disable ;;
  * ) echo "select enable or disable" ;;
esac
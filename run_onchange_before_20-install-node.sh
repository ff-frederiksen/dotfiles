#!/usr/bin/env bash
set -euo pipefail

NODE_VERSION="20.11.0"
FNM="$HOME/.local/bin/fnm"

if ! "$FNM" list | grep -q "$NODE_VERSION"; then
    "$FNM" install "$NODE_VERSION"
fi
"$FNM" default "$NODE_VERSION"

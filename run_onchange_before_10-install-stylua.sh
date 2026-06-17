#!/usr/bin/env bash

set -euo pipefail

# stylua ships a single binary in a ZIP. Verify the exact asset name
# on the releases page — the format has varied across versions.
STYLUA_VERSION="v2.5.2"
ARCH="$(uname -m)"
BIN="$HOME/.local/bin/stylua"
ZIP="stylua-linux-${ARCH}.zip"
URL="https://github.com/JohnnyMorganz/StyLua/releases/download/\
${STYLUA_VERSION}/${ZIP}"

current="$("$BIN" --version 2>/dev/null | head -1 | awk '{print $2}' \
    || true)"
if [[ "$current" == "${STYLUA_VERSION#v}" ]]; then
    exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp/$ZIP"
unzip -q "$tmp/$ZIP" -d "$tmp"

mkdir -p "$HOME/.local/bin"
install -m 0755 "$tmp/stylua" "$BIN"

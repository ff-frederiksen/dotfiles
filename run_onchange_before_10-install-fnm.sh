#!/usr/bin/env bash

set -euo pipefail

FNM_VERSION="v1.39.0"
BIN="$HOME/.local/bin/fnm"
ZIP="fnm-linux.zip"
URL="https://github.com/Schniz/fnm/releases/download/\
${FNM_VERSION}/${ZIP}"

current="$("$BIN" --version 2>/dev/null | head -1 | awk '{print $2}' \
    || true)"
if [[ "$current" == "${FNM_VERSION#v}" ]]; then
    exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp/$ZIP"
unzip -q "$tmp/$ZIP" -d "$tmp"

mkdir -p "$HOME/.local/bin"
install -m 0755 "$tmp/fnm" "$BIN"

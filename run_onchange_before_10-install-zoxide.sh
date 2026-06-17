#!/usr/bin/env bash

set -euo pipefail

ZOXIDE_VERSION="0.9.6"
ARCH="$(uname -m)"
BIN="$HOME/.local/bin/zoxide"
TARBALL="zoxide-${ZOXIDE_VERSION}-${ARCH}-unknown-linux-musl.tar.gz"
URL="https://github.com/ajeetdsouza/zoxide/releases/download/\
v${ZOXIDE_VERSION}/${TARBALL}"

current="$("$BIN" --version 2>/dev/null | head -1 | awk '{print $2}' \
    || true)"
if [[ "$current" == "$ZOXIDE_VERSION" ]]; then
    exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp/$TARBALL"
tar -xzf "$tmp/$TARBALL" -C "$tmp"

mkdir -p "$HOME/.local/bin"
install -m 0755 "$tmp/zoxide" "$BIN"

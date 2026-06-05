#!/usr/bin/env bash

set -euo pipefail

STARSHIP_VERSION="v1.25.1"
ARCH="$(uname -m)"
BIN="$HOME/.local/bin/starship"
TARBALL="starship-${ARCH}-unknown-linux-musl.tar.gz"
URL="https://github.com/starship/starship/releases/download/\
${STARSHIP_VERSION}/${TARBALL}"

current="$("$BIN" --version 2>/dev/null | head -1 | awk '{print $2}' \
    || true)"
if [[ "$current" == "${STARSHIP_VERSION#v}" ]]; then
    exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp/$TARBALL"
tar -xzf "$tmp/$TARBALL" -C "$tmp"

mkdir -p "$HOME/.local/bin"
install -m 0755 "$tmp/starship" "$BIN"

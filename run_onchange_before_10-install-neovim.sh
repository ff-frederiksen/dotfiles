#!/usr/bin/env bash

set -euo pipefail

NVIM_VERSION="v0.11.7"
ARCH="linux-x86_64"
OPT_DIR="$HOME/.local/opt/nvim"
TARBALL="nvim-${ARCH}.tar.gz"
URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/${TARBALL}"

# Idempotent: skip if already at the pinned version.
current="$("$OPT_DIR/bin/nvim" --version 2>/dev/null |
    head -1 | awk '{print $2}' || true)"
if [[ "$current" == "$NVIM_VERSION" ]]; then
    exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp/$TARBALL"
tar -xzf "$tmp/$TARBALL" -C "$tmp"

rm -rf "$OPT_DIR"
mkdir -p "$(dirname "$OPT_DIR")"
mv "$tmp/nvim-${ARCH}" "$OPT_DIR"

mkdir -p "$HOME/.local/bin"
ln -sf "$OPT_DIR/bin/nvim" "$HOME/.local/bin/nvim"

#!/usr/bin/env bash
set -euo pipefail

TS_VERSION="0.26.1"
BIN_DIR="$HOME/.local/bin"
TARGET="$BIN_DIR/tree-sitter"

if [ -x "$TARGET" ]; then
    current="$("$TARGET" --version | awk '{print $2}')"
    if [ "$current" = "$TS_VERSION" ]; then
        echo "tree-sitter CLI $TS_VERSION already installed."
        exit 0
    fi
fi

case "$(uname -m)" in
x86_64) arch="x64" ;;
aarch64) arch="arm64" ;;
*)
    echo "unsupported arch: $(uname -m)" >&2
    exit 1
    ;;
esac

ASSET="tree-sitter-linux-${arch}.gz"
URL="https://github.com/tree-sitter/tree-sitter/releases/download"
URL="${URL}/v${TS_VERSION}/${ASSET}"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL "$URL" -o "$tmp/tree-sitter.gz"
gunzip "$tmp/tree-sitter.gz"

mkdir -p "$BIN_DIR"
install -m 0755 "$tmp/tree-sitter" "$TARGET"

echo "Installed tree-sitter CLI $TS_VERSION to $TARGET."

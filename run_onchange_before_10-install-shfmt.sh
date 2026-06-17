#!/usr/bin/env bash
set -euo pipefail

SHFMT_VERSION="v3.8.0"
BIN="$HOME/.local/bin/shfmt"

case "$(uname -m)" in
x86_64) arch="amd64" ;;
aarch64) arch="arm64" ;;
*)
    echo "unsupported arch: $(uname -m)" >&2
    exit 1
    ;;
esac

ASSET="shfmt_${SHFMT_VERSION}_linux_${arch}"
URL="https://github.com/mvdan/sh/releases/download/\
${SHFMT_VERSION}/${ASSET}"

current="$("$BIN" --version 2>/dev/null | head -1 || true)"
if [[ "$current" == "$SHFMT_VERSION" ]]; then
    exit 0
fi

mkdir -p "$HOME/.local/bin"
curl -fsSL "$URL" -o "$BIN"
chmod +x "$BIN"

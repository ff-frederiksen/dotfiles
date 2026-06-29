#!/usr/bin/env bash
set -euo pipefail

DOTNET_CHANNEL="10.0"
DOTNET_DIR="$HOME/.dotnet"

if [ -x "$DOTNET_DIR/dotnet" ]; then
    if "$DOTNET_DIR/dotnet" --list-sdks |
        grep -q "^${DOTNET_CHANNEL}"; then
        echo "dotnet SDK ${DOTNET_CHANNEL} already present."
        exit 0
    fi
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL https://dot.net/v1/dotnet-install.sh \
    -o "$tmp/dotnet-install.sh"
chmod +x "$tmp/dotnet-install.sh"
"$tmp/dotnet-install.sh" \
    --channel "$DOTNET_CHANNEL" \
    --install-dir "$DOTNET_DIR"

echo "Installed dotnet SDK ${DOTNET_CHANNEL} to ${DOTNET_DIR}."

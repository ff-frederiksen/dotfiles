#!/usr/bin/env bash

set -euo pipefail

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"

install_tool() {
    local pkg="$1"
    if dotnet tool list -g | awk '{print $1}' |
        grep -qix "$pkg"; then
        echo "${pkg} already installed."
    else
        echo "Installing ${pkg}..."
        dotnet tool install -g "$pkg"
    fi
}

install_tool "csharpier"
install_tool "EasyDotnet"

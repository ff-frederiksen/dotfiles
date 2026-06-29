#!/usr/bin/env bash

set -euo pipefail

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"

if dotnet tool list -g | grep -qi "csharpier"; then
    echo "csharpier already installed."
else
    dotnet tool install -g csharpier
fi

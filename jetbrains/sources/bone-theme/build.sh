#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JAR_PATH="$HOME/.dotfiles/jetbrains/Library/Application Support/JetBrains/RustRover2026.1/plugins/bone-theme/lib/bone-theme.jar"

cd "$SRC_DIR"
rm -f "$JAR_PATH"
zip -r "$JAR_PATH" META-INF themes > /dev/null
echo "Rebuilt: $JAR_PATH"
echo "Restart RustRover (Cmd+Q) to apply."

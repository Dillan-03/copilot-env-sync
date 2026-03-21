#!/bin/sh
# install.sh — Install copilot-sync into ~/.local/bin
set -e

INSTALL_DIR="$HOME/.local/bin"
BIN="$INSTALL_DIR/copilot-sync"

mkdir -p "$INSTALL_DIR"

# Copy the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp "$SCRIPT_DIR/bin/copilot-sync" "$BIN"
chmod +x "$BIN"

printf '✓ Installed copilot-sync to %s\n' "$BIN"

# PATH check
case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    printf '\n! %s is not in your PATH.\n' "$INSTALL_DIR"
    printf '  Add this to your ~/.zshrc or ~/.bashrc:\n'
    printf '    export PATH="$HOME/.local/bin:$PATH"\n'
    printf '  Then: source ~/.zshrc\n'
    ;;
esac

printf '\nGet started:\n'
printf '  copilot-sync init\n'

#!/bin/sh
# install.sh — Install copilot-sync to ~/.local/bin
# Usage: curl -fsSL https://raw.githubusercontent.com/Dillan-03/copilot-env-sync/main/install.sh | sh

set -e

REPO_URL="https://raw.githubusercontent.com/Dillan-03/copilot-env-sync/main"
INSTALL_DIR="$HOME/.local/bin"
BIN_NAME="copilot-sync"

die() { printf 'error: %s\n' "$1" >&2; exit 1; }

# Ensure install dir exists
mkdir -p "$INSTALL_DIR"

# Download or copy the binary
if [ -f "$(dirname "$0")/bin/$BIN_NAME" ]; then
  # Running from a cloned repo
  cp "$(dirname "$0")/bin/$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
else
  # Downloading from GitHub
  command -v curl >/dev/null 2>&1 || die "curl is required"
  curl -fsSL "$REPO_URL/bin/$BIN_NAME" -o "$INSTALL_DIR/$BIN_NAME"
fi

chmod +x "$INSTALL_DIR/$BIN_NAME"
printf '\033[32m✓\033[0m Installed %s to %s\n' "$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"

# Check PATH
case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    printf '\n\033[33m!\033[0m %s is not in your PATH.\n' "$INSTALL_DIR"
    printf '  Add this to your shell config (~/.zshrc or ~/.bashrc):\n'
    printf '  \033[36mexport PATH="$HOME/.local/bin:$PATH"\033[0m\n\n'
    ;;
esac

printf '\nGet started:\n'
printf '  \033[36mcopilot-sync init\033[0m\n'

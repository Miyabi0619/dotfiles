#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
. ./bootstrap/lib.sh

if [ "$(uname -s)" != "Darwin" ]; then
  echo "ERROR: this script is only for macOS." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  echo "Install Homebrew explicitly, then rerun: make bootstrap-macos"
  echo 'Suggested command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

if [ "${RUN_BREW_BUNDLE:-0}" = "1" ] && [ -f dot_Brewfile ]; then
  brew bundle --file=dot_Brewfile
else
  echo "Skipping brew bundle. Set RUN_BREW_BUNDLE=1 after pruning dot_Brewfile to OS-owned packages."
fi

if ! command -v nix >/dev/null 2>&1; then
  echo "Nix is not installed."
  echo "Install Nix explicitly, then rerun: make bootstrap-macos"
  echo "Suggested command: sh <(curl -L https://nixos.org/nix/install) --daemon"
  exit 1
fi

home_manager_switch
chezmoi apply --dry-run --verbose

echo "Bootstrap checks complete. Run 'make chezmoi-apply' after reviewing the dry-run."

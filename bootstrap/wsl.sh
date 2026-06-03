#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
. ./bootstrap/lib.sh

if [ "$(uname -s)" != "Linux" ]; then
  echo "ERROR: this script is only for Linux." >&2
  exit 1
fi

if ! grep -qi microsoft /proc/version; then
  echo "ERROR: WSL was not detected. Use make bootstrap-ubuntu for native Ubuntu." >&2
  exit 1
fi

sudo apt-get update
sudo apt-get install -y curl ca-certificates git xz-utils build-essential

if ! command -v nix >/dev/null 2>&1; then
  echo "Nix is not installed."
  echo "Install Nix explicitly inside WSL, then rerun: make bootstrap-wsl"
  echo "Suggested command: sh <(curl -L https://nixos.org/nix/install) --daemon"
  exit 1
fi

home_manager_switch
chezmoi apply --dry-run --verbose

echo "Bootstrap checks complete. Run 'make chezmoi-apply' after reviewing the dry-run."

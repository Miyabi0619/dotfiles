#!/usr/bin/env sh
set -eu

repo_root() {
  cd "$(dirname "$0")/.." && pwd
}

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "ERROR: required command not found: $1" >&2
    exit 1
  fi
}

install_nix_hint() {
  if command -v nix >/dev/null 2>&1; then
    return 0
  fi

  echo "ERROR: nix is not installed." >&2
  echo "Install Nix first, then rerun this bootstrap." >&2
  echo "Recommended: sh <(curl -L https://nixos.org/nix/install) --daemon" >&2
  exit 1
}

home_manager_profile() {
  host="$(hostname | tr '[:upper:]' '[:lower:]' | sed 's/\.local$//' | tr -c 'a-z0-9-' '-' | sed 's/-$//')"
  if grep -q "\"${host}\"" ./nix/flake.nix; then
    printf '%s\n' "${host}"
    return 0
  fi

  case "$(uname -s)" in
    Darwin)
      printf '%s-darwin\n' "${USER}"
      ;;
    Linux)
      printf '%s-linux\n' "${USER}"
      ;;
    *)
      echo "ERROR: unsupported OS for Home Manager: $(uname -s)" >&2
      exit 1
      ;;
  esac
}

home_manager_switch() {
  profile="${HM_PROFILE:-$(home_manager_profile)}"

  if command -v home-manager >/dev/null 2>&1; then
    home-manager switch --flake "./nix#${profile}"
  else
    nix run github:nix-community/home-manager -- switch --flake "./nix#${profile}"
  fi
}

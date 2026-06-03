SHELL := /bin/sh
NIX_FLAGS := --extra-experimental-features "nix-command flakes"

.PHONY: bootstrap-ubuntu bootstrap-macos bootstrap-wsl bootstrap-windows chezmoi-dry chezmoi-apply mise-install nix-lock nix-switch nix-check

bootstrap-ubuntu:
	./bootstrap/ubuntu.sh

bootstrap-macos:
	./bootstrap/macos.sh

bootstrap-wsl:
	./bootstrap/wsl.sh

bootstrap-windows:
	pwsh -NoProfile -ExecutionPolicy Bypass -File ./bootstrap/windows.ps1

chezmoi-dry:
	chezmoi apply --dry-run --verbose

chezmoi-apply:
	chezmoi apply --verbose

mise-install:
	mise install

nix-switch:
	@host="$$(hostname | tr '[:upper:]' '[:lower:]' | sed 's/\.local$$//' | tr -c 'a-z0-9-' '-' | sed 's/-$$//')"; \
	if [ "$$(uname -s)" = "Darwin" ]; then fallback="$${USER}-darwin"; else fallback="$${USER}-linux"; fi; \
	profile="$${HM_PROFILE:-$${host}}"; \
	if ! grep -q "\"$${profile}\"" ./nix/flake.nix; then profile="$${fallback}"; fi; \
	if command -v home-manager >/dev/null 2>&1; then home-manager switch --flake "./nix#$${profile}"; else nix $(NIX_FLAGS) run github:nix-community/home-manager -- switch --flake "./nix#$${profile}"; fi

nix-lock:
	cd nix && nix $(NIX_FLAGS) flake lock

nix-check:
	nix $(NIX_FLAGS) flake check ./nix

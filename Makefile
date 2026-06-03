SHELL := /bin/sh

.PHONY: bootstrap-ubuntu bootstrap-macos bootstrap-wsl bootstrap-windows chezmoi-dry chezmoi-apply mise-install nix-switch nix-check

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
	@if [ "$$(uname -s)" = "Darwin" ]; then profile="$${HM_PROFILE:-$${USER}-darwin}"; else profile="$${HM_PROFILE:-$${USER}-linux}"; fi; \
	if command -v home-manager >/dev/null 2>&1; then home-manager switch --flake "./nix#$${profile}"; else nix run github:nix-community/home-manager -- switch --flake "./nix#$${profile}"; fi

nix-check:
	nix flake check ./nix

{ pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    age
    bat
    chezmoi
    direnv
    eza
    fd
    fzf
    gh
    git
    jq
    lazygit
    mise
    neovim
    ripgrep
    sheldon
    sops
    starship
    tmux
    tree
    wget
    zoxide
    zsh
  ];
}

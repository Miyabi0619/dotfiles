# Copilot Instructions for chezmoi Configuration

## 1. Current chezmoi Source Directory Structure

The user's chezmoi source directory is located at `/home/yuni/.local/share/chezmoi/`.
It contains the following key files and directories:

-   `.git/`: Git repository for version control of dotfiles.
-   `.chezmoiscripts/`: Contains executable scripts run by chezmoi.
    -   `run_onchange_install-packages.sh.tmpl`: A templated script that installs `apt` and `snap` packages based on the OS (Linux, macOS placeholders exist). This script was originally present and is now confirmed as the primary package installer.
-   `dot_bashrc`: User's existing bash configuration.
-   `dot_config/`: Directory for XDG Base Directory Specification compliant configurations.
    -   `starship.toml.tmpl`: Templated Starship prompt configuration. Currently configured for Linux, with macOS placeholders.
    -   `zsh/`: Directory for Zsh configurations.
        -   `dot_zshrc.tmpl`: Templated Zsh runtime configuration. Currently configured for Linux, with macOS placeholders.
        -   `dot_zshenv.tmpl`: Templated Zsh environment configuration.
        -   `plugins/`: Placeholder for Zsh plugins (managed by sheldon).
    -   `sheldon/`: Directory for Sheldon plugin manager configuration.
        -   `plugins.toml.tmpl`: Templated Sheldon plugin list.
-   `dot_gitconfig`: User's existing Git configuration.
-   `dot_ideavimrc`: User's existing IdeaVim configuration.
-   `dot_profile`: User's existing profile configuration.
-   `dot_vimrc`: User's existing Vim configuration.
-   `packages/`: Directory containing lists of packages to install.
    -   `apt.txt`: List of APT packages for Debian/Ubuntu systems.
    -   `snap.txt`: List of Snap packages.

## 2. Future Plans and Next Steps

The primary goal is to optimize the chezmoi setup for the current Linux environment, with an eye towards future expansion to macOS and Windows, and to avoid changing the default shell from `bash`.

### 2.1. Immediate Next Steps (Linux Environment)

1.  **Test Zsh Environment**:
    -   Although `zsh` and `sheldon` are installed, and configurations are in place, the user's default shell remains `bash`.
    -   The user should manually launch `zsh` from `bash` to verify that `starship` (prompt), `sheldon` (plugins), and all `zshrc` settings (e.g., history, options) are functioning as expected.
    -   Adjust `dot_zshrc.tmpl`, `plugins.toml.tmpl`, and `starship.toml.tmpl` as needed based on testing feedback.
2.  **User's Existing Dotfiles Review**:
    -   Review `dot_bashrc`, `dot_gitconfig`, `dot_ideavimrc`, `dot_profile`, `dot_vimrc`.
    -   Decide whether these should be managed by chezmoi and potentially templated for OS-specific needs or unified with Zsh/Starship.

### 2.2. Optional Enhancements and Future Expansions

1.  **`gh` (GitHub CLI) Configuration (Revisit if desired)**:
    -   `gh` is installed, but its configuration is not managed by `chezmoi` due to token security concerns.
    -   If the user wishes to manage `gh` configuration with `chezmoi` safely in the future, methods involving secure handling of tokens (e.g., via `~/.config/chezmoi/chezmoi.toml` and template variables) can be re-evaluated.
2.  **`mise` Introduction**:
    -   The user expressed interest in `mise` (multi-language version manager).
    -   It can be added to `packages/apt.txt` and installed via `chezmoi apply`.
    -   Guidance on using `mise` safely alongside ROS2 (e.g., disabling `mise` in ROS2 workspaces) can be provided.
3.  **macOS and Windows Support**:
    -   The `starship.toml.tmpl` and `dot_zshrc.tmpl` files already contain placeholders for macOS.
    -   When supporting macOS/Windows, expand these templates with OS-specific settings.
    -   Consider adding platform-specific package managers (e.g., Homebrew for macOS, Winget/Chocolatey for Windows) and their corresponding `run_onchange_` scripts or data files.
4.  **Further Dotfile Refinement**:
    -   Integrate other tools/settings found in the reference `dotfile/` and `dotfiles/` repositories (e.g., `zellij`, `git` aliases, editor configurations) as needed.
    -   Utilize `chezmoidata` for more structured data management where appropriate.

This document serves as a guide for continued optimization and management of the chezmoi configuration.

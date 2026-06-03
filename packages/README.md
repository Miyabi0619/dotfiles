# packages

OS 標準のパッケージ管理で扱うものだけをここに置きます。

## apt

- `apt/base.txt`: bootstrap に必要な最小パッケージ
- `apt/desktop.txt`: desktop, IME, fonts
- `apt/robotics.txt`: ROS2 and robotics tools
- `apt/network.txt`: network and remote access tools
- `apt/manual.txt`: kernel, bootloader, OEM packages. Never auto-install.

Legacy full dumps remain as `apt.txt` and `snap.txt` until they are fully classified.

## brew

- `brew/gui.Brewfile`: macOS GUI apps and casks
- `brew/vscode.Brewfile`: VS Code extensions

Nix-owned CLI tools and mise-owned language runtimes should not be added here.

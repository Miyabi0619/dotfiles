# dotfiles

このリポジトリは、macOS / Ubuntu / WSL / Windows の環境を分けて管理するための dotfiles です。

## 方針

| 領域 | 管理者 | 目的 |
| --- | --- | --- |
| 共通 CLI | Nix + Home Manager | git, gh, rg, fd, jq, bat, eza, fzf, zoxide, starship, sheldon など |
| 言語ランタイム | mise | Node.js, Python, Java などのバージョン固定 |
| dotfiles | chezmoi | shell, git, starship, mise などの設定ファイル配置 |
| OS / GUI アプリ | apt, Homebrew, winget | Android Studio, VS Code, ブラウザ, ドライバ, ROS2 など |

重要なルールは、chezmoi からパッケージインストールを自動実行しないことです。
`chezmoi apply` は設定ファイルの配置だけに使い、インストール処理は `make bootstrap-*` で明示的に実行します。

## 初回セットアップ

OS に合わせて、必ず明示的な target を実行します。

```sh
make bootstrap-macos
make bootstrap-ubuntu
make bootstrap-wsl
make bootstrap-windows
```

各 bootstrap は OS ガードを持っています。例えば Ubuntu 用スクリプトは macOS や WSL では止まります。

既存の `dot_Brewfile` と `packages/winget.json` はまだ未分類のため、デフォルトでは一括インストールしません。
OS 管理に残すパッケージへ整理したあと、必要な場合だけ `RUN_BREW_BUNDLE=1 make bootstrap-macos` または `RUN_WINGET_IMPORT=1 make bootstrap-windows` を使います。

## 通常運用

```sh
make nix-switch
make chezmoi-dry
make chezmoi-apply
make mise-install
```

`chezmoi-dry` で差分を確認してから `chezmoi-apply` を実行します。

## ディレクトリ

```text
.
├── bootstrap/          # 明示実行する OS 別 bootstrap
├── nix/                # Nix flake と Home Manager 設定
│   └── home/
├── packages/           # OS 標準パッケージ管理用の一覧
├── dot_config/         # chezmoi が配置する XDG 設定
├── dot_gitconfig
├── dot_Brewfile        # macOS の Homebrew 管理対象
└── Makefile
```

## パッケージ所有者

| ツール | 管理者 |
| --- | --- |
| git / gh / ripgrep / fd / jq / bat / eza | Nix |
| zsh / starship / sheldon / direnv / tmux / neovim | Nix でバイナリ、chezmoi で設定 |
| Node.js / Python / Java | mise |
| Gradle | プロジェクトの Gradle Wrapper |
| Android Studio / VS Code / ブラウザ | OS 標準 |
| ROS2 / Docker / ドライバ | OS 標準 |

同じソフトを複数の管理ツールで入れないことを優先します。

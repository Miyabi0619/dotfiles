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

既存の `dot_Brewfile`、`packages/apt.txt`、`packages/winget.json` は棚卸しの履歴として残していますが、デフォルトでは一括インストールしません。
macOS の GUI アプリと VS Code 拡張だけ入れる場合は `RUN_BREW_BUNDLE=1 make bootstrap-macos`、Windows の winget import を使う場合は `RUN_WINGET_IMPORT=1 make bootstrap-windows` を使います。

## 通常運用

```sh
make nix-switch
make nix-lock
make chezmoi-dry
make chezmoi-apply
make mise-install
```

`chezmoi-dry` で差分を確認してから `chezmoi-apply` を実行します。

## Mac adoption

この Mac は `sorahas-gram` profile で管理します。

最初は安全な範囲だけを chezmoi 管理にします。

- manage: `.zshenv`, `.config/zsh/`, `.config/mise/`, `.config/sheldon/`, `.config/starship.toml`, `.gitconfig`
- do not manage yet: `.bash_profile`, `.bashrc`, `.profile`, `~/.Brewfile`, `~/Library/Application Support/Code/User/settings.json`

VS Code settings や app-specific settings は変更頻度が高いため、必要になったら明示的に再採用します。

## ディレクトリ

```text
.
├── bootstrap/          # 明示実行する OS 別 bootstrap
├── nix/                # Nix flake と Home Manager 設定
│   └── home/
├── packages/           # OS 標準パッケージ管理用の分類済み一覧
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

## Home Manager profiles

`make nix-switch` はまず hostname 由来の profile を探し、なければ `${USER}-darwin` または `${USER}-linux` にフォールバックします。

明示したい場合は次のように指定します。

```sh
HM_PROFILE=sorahas-gram make nix-switch
HM_PROFILE=yuni-linux make nix-switch
```

`nix/flake.lock` は Nix 導入後に生成してコミットします。

```sh
make nix-lock
```

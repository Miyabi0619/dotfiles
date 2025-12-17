# macOS Development Environment

このリポジトリは、macOSの開発環境をchezmoiで管理するためのdotfilesです。

## 🚀 新しいmacOSでの環境復旧手順

### 1. Chezmoiのインストール
```bash
# Homebrewでchezmoiをインストール
brew install chezmoi

# または直接インストール
sh -c "$(curl -fsLS chezmoi.io/get)"
```

### 2. Dotfilesのクローン（GitHubに上げている場合）
```bash
# GitHubからクローンして初期化（要リポジトリURL設定）
chezmoi init --apply https://github.com/yourusername/dotfiles.git
```

### 3. ローカルでの復旧（バックアップからの場合）
```bash
# chezmoiディレクトリをコピーした後
chezmoi apply
```

## 📦 管理されているファイル

### システム設定
- **Brewfile** - Homebrew packages & casks
- **.zshrc** - Zsh shell configuration
- **.env_dev** - Development environment variables
- **.gitconfig** - Git configuration

### アプリケーション設定
- **VS Code settings** - エディタ設定と拡張機能
- **SSH config** - SSH接続設定（要手動設定）

### 自動実行スクリプト
- **run_once_install.sh** - 初回セットアップスクリプト
- **run_once_macos-setup.sh** - macOSシステム設定

## 🔧 含まれるソフトウェア

### 開発ツール
- Git, Python, Java, Node.js
- VS Code, Android Studio
- Docker (OrbStack)

### 生産性ツール  
- Raycast, Rectangle, Maccy
- Bitwarden, Notion
- Starship (プロンプト)

### その他
- Firefox, Chrome
- VLC, Thunderbird
- ゲームエミュレータ各種

## 🔑 手動設定が必要なもの

### SSH設定
```bash
# SSH鍵の生成
ssh-keygen -t ed25519 -C "your.email@example.com"

# SSH agentに追加
ssh-add ~/.ssh/id_ed25519

# 公開鍵をGitHub/GitLabに追加
cat ~/.ssh/id_ed25519.pub
```

### Git設定（既に設定済み）
```bash
git config --global user.name "Miyabi0619"
git config --global user.email "c1406241@st.kanazaawa-it.ac.jp"
```

## 📝 使用方法

### ファイルの追加
```bash
chezmoi add ~/.filename
```

### 変更の適用
```bash
chezmoi apply
```

### 編集
```bash
chezmoi edit ~/.filename
```

### 状態確認
```bash
chezmoi status
chezmoi diff
```

## 🔄 定期的なメンテナンス

```bash
# VS Code拡張機能リストの更新
code --list-extensions > ~/.local/share/chezmoi/dot_vscode/extensions.txt

# Brewfileの更新
brew bundle dump --force --file=~/.local/share/chezmoi/Brewfile
```

## 📂 ディレクトリ構造

```
~/.local/share/chezmoi/
├── Brewfile                    # Homebrew packages
├── dot_zshrc                   # Zsh configuration
├── dot_env_dev                 # Development environment
├── dot_gitconfig               # Git settings
├── private_dot_ssh/            # SSH configuration
├── dot_vscode/                 # VS Code settings
├── run_once_install.sh.tmpl    # Setup script
├── run_once_macos-setup.sh.tmpl # macOS preferences
└── README.md                   # This file
```

## 🆘 トラブルシューティング

### 権限エラー
```bash
sudo chown -R $(whoami) ~/.local/share/chezmoi
```

### 設定の競合
```bash
chezmoi merge ~/.filename
```

### 完全リセット
```bash
chezmoi apply --force
```

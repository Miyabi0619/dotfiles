# これは何
じゃがびぃのchezmoiなdotfiles  
arm64なmacOSとx64なLinuxとx64なwindowsでの使用を想定しています

##  使い方
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Miyabi0619
```

## memo
```
# .Brewfile を更新する
brew bundle dump --file="$(chezmoi source-path)/dot_Brewfile_macos" --no-vscode --force
```

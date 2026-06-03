#!/bin/zsh

# alias
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --git"
  alias la="eza -a --git"
  alias ll="eza -ahl --git"
  alias lt="eza -T -L 3 -a -I 'node_modules|.git|.cache'"
  alias lta="eza -T -a -I 'node_modules|.git|.cache' --color=always | less -r"
  alias tree="lt"
else
  alias la="ls -A"
  alias ll="ls -alF"
  alias lt="find . -maxdepth 3 -print"
fi

alias l="clear && ls"

if command -v code-insiders >/dev/null 2>&1; then
  alias code="code-insiders"
fi

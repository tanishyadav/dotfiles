#!/usr/bin/env bash

BASE_PATH="$(dirname $(readlink -f $0))"
source "$BASE_PATH/config.sh"

echo "Sudoing..."
sudo echo "SUPER HELLO!"

echo "Apt init..."
sudo apt update
sudo apt upgrade

torun=( "crap-pack-rm"
	"apt-packages"
	"vim"
	"terminator"
	"zsh"
	"zsh-powerline10k"
	"zsh-syntax-highlighting"
	"zsh-autosuggestions"
	"zsh-history-substring-search"
	"zsh-git"
	"zsh-sudo"
	"pyenv"
	"color-spaces"
	"bat"
	"fasd"
	"ag"
	"delta"
	"fd"
	"fzf"
	"git-fzf"
	"exa"
	"hyperfine"
)
for script in "${torun[@]}"; do
	if yesno "Install $script ? (y/n) "; then
		bash "$BASE_PATH/install-$script.sh"
	fi
done

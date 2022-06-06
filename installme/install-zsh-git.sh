#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZGT_SRC_PATH="$ZSH_PATH/zsh-git"
ZGT_SRC_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh"

if [[ -d "$ZGT_SRC_PATH" ]]; then
	echo "Removing already existing zsh-git directory..."
	rm -rf "$ZGT_SRC_PATH"
fi

echo "Creating zsh-git directory..."
mkdir -p "$ZGT_SRC_PATH"

curl -o "$ZGT_SRC_PATH/git.zsh" "$ZGT_SRC_LINK"

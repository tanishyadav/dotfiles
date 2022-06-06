#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZSU_SRC_PATH="$ZSH_PATH/zsh-sudo"
ZSU_SRC_LINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh"

if [[ -d "$ZSU_SRC_PATH" ]]; then
	echo "Removing already existing zsh-sudo directory..."
	rm -rf "$ZSU_SRC_PATH"
fi

echo "Creating zsh-sudo directory..."
mkdir -p "$ZSU_SRC_PATH"

curl -o "$ZSU_SRC_PATH/sudo.zsh" "$ZSU_SRC_LINK"

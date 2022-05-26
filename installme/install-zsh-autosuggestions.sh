#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZAS_SRC_PATH="$ZSH_PATH/zsh-autosuggestions"
ZAS_SRC_LINK="https://github.com/zsh-users/zsh-autosuggestions"

if [[ -d "$ZAS_SRC_PATH" ]]; then
	echo "Removing already existing zsh-autosuggestions directory..."
	rm -rf "$ZAS_SRC_PATH"
fi

echo "Creating zsh-autosuggestions directory..."
mkdir -p "$ZAS_SRC_PATH"

git clone $ZAS_SRC_LINK $ZAS_SRC_PATH

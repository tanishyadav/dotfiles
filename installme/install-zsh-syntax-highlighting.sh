#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZSYH_SRC_PATH="$ZSH_PATH/zsh-syntax-highlighting"
ZSYH_SRC_LINK="https://github.com/zsh-users/zsh-syntax-highlighting.git"

if [[ -d "$ZSYH_SRC_PATH" ]]; then
	echo "Removing already existing zsh-syntax-highlighting directory..."
	rm -rf "$ZSYH_SRC_PATH"
fi

echo "Creating zsh-syntax-highlighting directory..."
mkdir -p "$ZSYH_SRC_PATH"

git clone --depth=1 "$ZSYH_SRC_LINK" "$ZSYH_SRC_PATH"

#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZHSS_SRC_PATH="$ZSH_PATH/zsh-history-substring-search"
ZHSS_SRC_LINK="https://github.com/zsh-users/zsh-history-substring-search.git"

if [[ -d "$ZHSS_SRC_PATH" ]]; then
	echo "Removing already existing zsh-history-substring-search directory..."
	rm -rf "$ZHSS_SRC_PATH"
fi

echo "Creating zsh-history-substring-search directory"
mkdir -p "$ZHSS_SRC_PATH"

git clone --depth=1 "$ZHSS_SRC_LINK" "$ZHSS_SRC_PATH"

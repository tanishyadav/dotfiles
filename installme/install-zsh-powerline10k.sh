#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZPK_SRC_PATH="$ZSH_PATH/powerlevel10k"
ZPK_SRC_LINK="https://github.com/romkatv/powerlevel10k.git"

if [[ -d "$ZPK_SRC_PATH" ]]; then
	echo "Removing already existing powerlevel10k directory..."
	rm -rf "$ZPK_SRC_PATH"
fi

echo "Creating powerlevel10k directory..."
mkdir -p "$ZPK_SRC_PATH"

git clone --depth=1 "$ZPK_SRC_LINK" "$ZPK_SRC_PATH"

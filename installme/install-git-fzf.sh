#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

src_path="$ZSH_PATH/git-fzf"
src_link="https://gist.github.com/0c1afd6c9e5a6a3c8b73a2fc8e808a39.git"

if [[ -e "$src_path" ]]; then
	echo "Removing already existing git-fzf..."
	rm -rf "$src_path"
fi

echo "Creating git-fzf directory..."
mkdir -p "$src_path"

git clone --depth=1 "$src_link" "$src_path"

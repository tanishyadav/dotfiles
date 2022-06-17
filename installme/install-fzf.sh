#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

fzf_path="$HOME/.fzf"
fzf_link="https://github.com/junegunn/fzf.git"

echo "Uninstalling fzf..."
[[ -e "$fzf_path/uninstall" ]] && "$fzf_path/uninstall"
echo "Removing exiting fzf..."
[[ -e "$fzf_path" ]] && rm -rf "$fzf_path"

echo "Creating fzf directory..."
mkdir -p "$fzf_path"

echo "Cloning..."
git clone --depth=1 "$fzf_link" "$fzf_path"

echo "Installing..."
"$fzf_path/install"

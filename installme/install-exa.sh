#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"
gh_api_link="https://api.github.com/repos/ogham/exa/releases/latest"
exa_binary="$BIN_PATH/exa"
exa_man="$MAN_PATH/exa.1"
exa_color_man="$MAN_PATH/exa_colors.5"
exa_comp="$ZSH_FUNC_PATH/_exa"
ar_path="$TMP_PATH/exa.zip"
ar_ext_path="$TMP_PATH/exa"
ar_binary="bin/exa"
ar_man="man/exa.1"
ar_color_man="man/exa_colors.5"
ar_comp="completions/exa.zsh"

echo "Getting latest release archive url using github api..."
ar_url=$(curl -sSL "$gh_api_link" | grep "browser_download_url" | \
					grep "linux-x86_64" | grep -v "musl")
ar_url=${ar_url#*: \"}
ar_url=${ar_url%\"}

echo "Removing already present..."
[[ -e "$ar_path" ]] && echo "archive..." && rm -f "$ar_path"
[[ -e "$ar_ext_path" ]] && echo "extracted archive..." && rm -f "$ar_ext_path"
[[ -e "$exa_binary" ]] && echo "binary..." && rm -f "$exa_binary"
[[ -e "$exa_man" ]] && echo "man..." && rm -f "$exa_man"
[[ -e "$exa_color_man" ]] && echo "man_colors..." && rm -f "$exa_color_man"
[[ -e "$exa_comp" ]] && echo "zsh-completion..." && rm -f "$exa_comp"

echo "Downloading archive..."
curl -Lo "$ar_path" "$ar_url"
echo "Extracting archive..."
mkdir -p "$ar_ext_path"
cd "$ar_ext_path"
unzip "$ar_path"

echo "Installing..."
mv "$ar_binary" "$exa_binary"
mv "$ar_man" "$exa_man"
mv "$ar_color_man" "$exa_color_man"
mv "$ar_comp" "$exa_comp"

echo "Removing..."
echo "archive..."
rm -f "$ar_path"
echo "extracted archive..."
rm -rf "$ar_ext_path"

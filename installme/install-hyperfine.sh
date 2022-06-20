#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"
gh_api_link="https://api.github.com/repos/sharkdp/hyperfine/releases/latest"
binary="$BIN_PATH/hyperfine"
man="$MAN_PATH/hyperfine.1"
comp="$ZSH_FUNC_PATH/_hyperfine"
ar_path="$TMP_PATH/hyperfine.tar.gz"
ar_binary="hyperfine"
ar_man="hyperfine.1"
ar_comp="autocomplete/_hyperfine"

echo "Getting latest release archive url using github api..."
ar_url=$(curl -sSL "$gh_api_link" | grep "browser_download_url" | \
					grep "x86_64-unknown-linux-gnu.tar.gz")
ar_url=${ar_url#*: \"}
ar_url=${ar_url%\"}

echo "Removing already present..."
[[ -e "$ar_path" ]] && echo "archive..." && rm -f "$ar_path"
[[ -e "$binary" ]] && echo "binary..." && rm -f "$binary"
[[ -e "$man" ]] && echo "man..." && rm -f "$man"
[[ -e "$comp" ]] && echo "zsh-completion..." && rm -f "$comp"

echo "Downloading archive..."
curl -Lo "$ar_path" "$ar_url"

echo "Installing..."
cd "$BIN_PATH"
tar --no-anchored --strip-components=1 -zxvf "$ar_path" "$ar_binary"
cd "$MAN_PATH"
tar --no-anchored --strip-components=1 -zxvf "$ar_path" "$ar_man"
cd "$ZSH_FUNC_PATH"
tar --no-anchored --strip-components=2 -zxvf "$ar_path" "$ar_comp"

echo "Removing archive..."
rm "$ar_path"

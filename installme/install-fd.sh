#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"
gh_api_link="https://api.github.com/repos/sharkdp/fd/releases/latest"
fd_binary="$BIN_PATH/fd"
ar_path="$TMP_PATH/fd.tar.gz"

echo "Getting latest release archive url using github api..."
ar_url=$(curl -sSL "$gh_api_link" | grep "browser_download_url" | \
					grep "x86_64-unknown-linux-gnu.tar.gz")
ar_url=${ar_url#*: \"}
ar_url=${ar_url%\"}

echo "Removing already present binary..."
[[ -e "$fd_binary" ]] && rm -f "$fd_binary"

echo "Removing already present archive..."
[[ -e "$ar_path" ]] && rm -f "$ar_path"

echo "Downloading archive..."
curl -Lo "$ar_path" "$ar_url"

echo "Extracting..."

echo "fd..."
cd "$BIN_PATH"
tar --no-anchored --strip-components=1 -zxvf "$ar_path" "fd"
echo "fd.1 (manpage)..."
cd "$MAN_PATH"
tar --no-anchored --strip-components=1 -zxvf "$ar_path" "fd.1"
echo "_fd (zsh-completion)..."
cd "$ZSH_FUNC_PATH"
tar --no-anchored --strip-components=2 -zxvf "$ar_path" "_fd"

echo "Removing archive..."
rm "$ar_path"

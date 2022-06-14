#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"
gh_api_link="https://api.github.com/repos/dandavison/delta/releases/latest"
delta_binary_path="$BIN_PATH"
delta_binary="$delta_binary_path/delta"
ar_path="$TMP_PATH/delta.tar.gz"

echo "Getting latest release archive url using github api..."
ar_url=$(curl -sSL "$gh_api_link" | grep "browser_download_url" | \
					grep "x86_64-unknown-linux-gnu.tar.gz")
ar_url=${ar_url#*: \"}
ar_url=${ar_url%\"}

echo "Removing already present delta binary..."
[[ -e "$delta_binary" ]] && rm -f "$delta_binary"

echo "Removing already present delta archive..."
[[ -e "$ar_path" ]] && rm -f "$ar_path"

echo "Downloading archive..."
curl -Lo "$ar_path" "$ar_url"
echo "Extracting delta from archive..."
cd "$delta_binary_path"
tar --no-anchored --strip-components=1 -zxvf "$ar_path" delta
echo "Removing archive..."
rm "$ar_path"

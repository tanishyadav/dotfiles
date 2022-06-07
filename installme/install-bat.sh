#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

echo "Removing already present bat..."
sudo apt remove bat

deb_url=$(curl -sSL https://api.github.com/repos/sharkdp/bat/releases/latest | grep "browser_download_url" | grep -v musl | grep amd64 | grep deb)
deb_url=${deb_url#*: \"}
deb_url=${deb_url%\"}

deb_file=${deb_url##*/}

deb_path="$SRC_PATH/$deb_file"

if [[ -e "$deb_path" ]]; then
	echo "Removing already present deb file..."
	rm "$deb_path"
fi

echo "Downloading deb file..."
curl -Lo "$deb_path" "$deb_url"
echo "Installing deb package..."
sudo dpkg -i "$deb_path"
echo "Removing deb file"
rm "$deb_path"

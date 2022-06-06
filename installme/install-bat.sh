#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

echo "Removing already present bat..."
sudo apt remove bat

defver="0.21.0"
read -p "Give the version of bat to install ($defver): " ver
ver=${ver:-"$defver"}

url="https://github.com/sharkdp/bat/releases/download/v$ver"
fname="bat_${ver}_amd64.deb"
fpath="$SRC_PATH/$fname"

if [[ -e "$fpath" ]]; then
	echo "Removing already present deb file..."
	rm "$fpath"
fi

echo "Installing deb file..."
curl -Lo "$fpath" "$url/$fname"
echo "Installing deb package..."
sudo dpkg -i "$fpath"
echo "Removing deb file"
rm "$fpath"

echo "Linking..."
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat 2> /dev/null
echo "DONE!!!"

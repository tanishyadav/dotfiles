#!/bin/bash

#set -euxo pipefail

source "$(dirname $(readlink -f $0))/config.sh"

ZSH_SRC_NAME=$SRC_PATH/zsh.tar.xz
ZSH_PACK_DIR=$SRC_PATH/zsh
ZSH_LINK="https://sourceforge.net/projects/zsh/files/latest/download"

if [[ -d "$ZSH_PACK_DIR" ]]; then
	echo "Removing already existing zsh directory..."
	rm -rf "$ZSH_PACK_DIR"
fi

if [[ ! -d "$ZSH_PACK_DIR" ]]; then
	echo "Creating zsh directory..."
	mkdir -p "$ZSH_PACK_DIR"
fi

if [[ -f $ZSH_SRC_NAME ]]; then
	echo "Removing already existing zsh source archive..."
	rm -f $ZSH_SRC_NAME
fi

if [[ ! -f $ZSH_SRC_NAME ]]; then
	echo "Downloading zsh source archive from $ZSH_LINK"
	curl -Lo "$ZSH_SRC_NAME" "$ZSH_LINK"
fi

tar xJvf "$ZSH_SRC_NAME" -C "$ZSH_PACK_DIR" --strip-components 1
cd "$ZSH_PACK_DIR"

#./configure --prefix="$HOME/local" \
#    CPPFLAGS="-I$HOME/local/include" \
#    LDFLAGS="-L$HOME/local/lib"

./configure --prefix="$PREFIX_PATH"
make -j && make install

while true; do
read -p "Do you want to add zsh to /etc/shells? (y/n) " yn
case $yn in
	[yY] ) echo "Adding to /etc/shells...";
		sudo add-shell "$PREFIX_PATH/bin/zsh";
		break;;
	[nN] ) echo "NOT adding to /etc/shells";
		break;;
	* ) echo "Invalid response";;
esac
done

while true; do
read -p "Do you want to change the default shell? (y/n) " yn
case $yn in
	[yY] ) echo "Changing default shell...";
		sudo chsh -s "$PREFIX_PATH/bin/zsh" $USER;
		break;;
	[nN] ) echo "NOT chaging the default shell";
		break;;
	* ) echo "Invalid response";;
esac
done

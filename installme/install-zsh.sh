#!/usr/bin/env bash

#set -euxo pipefail

source "$(dirname $(readlink -f $0))/config.sh"

ZSH_SRC_AC_NAME=$SRC_PATH/zsh.tar.xz
ZSH_SRC_PATH=$SRC_PATH/zsh
ZSH_AC_LINK="https://sourceforge.net/projects/zsh/files/latest/download"

if [[ -d "$ZSH_SRC_PATH" ]]; then
	echo "Removing already existing zsh directory..."
	rm -rf "$ZSH_SRC_PATH"
fi

echo "Creating zsh directory..."
mkdir -p "$ZSH_SRC_PATH"

if [[ -f $ZSH_SRC_AC_NAME ]]; then
	echo "Removing already existing zsh source archive..."
	rm -f $ZSH_SRC_AC_NAME
fi

echo "Downloading zsh source archive from $ZSH_AC_LINK"
curl -Lo "$ZSH_SRC_AC_NAME" "$ZSH_AC_LINK"

tar xJvf "$ZSH_SRC_AC_NAME" -C "$ZSH_SRC_PATH" --strip-components 1
cd "$ZSH_SRC_PATH"

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

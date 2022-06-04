#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

ZSH_SRC_AC_NAME="$SRC_PATH/zsh.tar.xz"
ZSH_SRC_PATH="$SRC_PATH/zsh"
ZSH_AC_LINK="https://sourceforge.net/projects/zsh/files/latest/download"

if [[ -d "$ZSH_SRC_PATH" ]]; then
	echo "Removing already existing zsh source directory..."
	rm -rf "$ZSH_SRC_PATH"
fi

echo "Creating zsh directory..."
mkdir -p "$ZSH_SRC_PATH"

if [[ -f "$ZSH_SRC_AC_NAME" ]]; then
	echo "Removing already existing zsh source archive..."
	rm -f "$ZSH_SRC_AC_NAME"
fi

echo "Downloading zsh source archive..."
curl -Lo "$ZSH_SRC_AC_NAME" "$ZSH_AC_LINK"

echo "Extracting zsh source archive..."
tar xJvf "$ZSH_SRC_AC_NAME" -C "$ZSH_SRC_PATH" --strip-components 1
echo "Removing zsh source archive..."
rm "$ZSH_SRC_AC_NAME"
cd "$ZSH_SRC_PATH"

echo "Running configure..."
./configure --prefix="$PREFIX_PATH"
echo "Running make..."
make -j && make install

echo
echo "---------------------------------------------------------------------"
echo "                            ZSH BUILT!!!                             "
echo "---------------------------------------------------------------------"
echo

if yesno "Do you want to add zsh to /etc/shells? (y/n) "; then
	echo "Adding to /etc/shells...";
	sudo add-shell "$PREFIX_PATH/bin/zsh";
fi

if yesno "Do you want to change the default shell? (y/n) "; then
	echo "Changing default shell...";
	sudo chsh -s "$PREFIX_PATH/bin/zsh" $USER;
fi

#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

FASD_SRC_LINK="https://github.com/clvv/fasd"
FASD_SRC_PATH="$SRC_PATH/fasd"

echo "Removing already present fasd..."
[[ -e "$PREFIX_PATH/bin/fasd" ]] && rm -f "$PREFIX_PATH/bin/fasd"
[[ -e "$PREFIX_PATH/share/man/man1/fasd.1" ]] && rm -f "$PREFIX_PATH/share/man/man1/fasd.1"
[[ -e "$FASD_SRC_PATH" ]] && rm -rf "$FASD_SRC_PATH"

echo "Cloning fasd..."
git clone --depth=1 "$FASD_SRC_LINK" "$FASD_SRC_PATH"

echo "Installing fasd..."
cd "$FASD_SRC_PATH"
PREFIX="$PREFIX_PATH" make install

echo "Fasd installed!!!"

#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

CLS_PATH="$PREFIX_PATH/bin/color-spaces"
CLS_LINK="https://raw.githubusercontent.com/robertknight/konsole/master/tests/color-spaces.pl"

if [[ -f "$CLS_PATH" ]]; then
	echo "Removing already existing color-spaces..."
	rm "$CLS_PATH"
fi

echo "Downloading color-spaces..."
curl -Lo "$CLS_PATH" "$CLS_LINK"
echo "Making color-spaces executable..."
chmod +x "$CLS_PATH"

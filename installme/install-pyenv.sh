#!/usr/bin/env bash

source "$(dirname $(readlink -f $0))/config.sh"

echo "Installing required packages..."
sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

if [[ -d "$PYENV_PATH" ]]; then
	echo "Removing already existing pyenv directory..."
	rm -rf "$PYENV_PATH"
fi

echo "Running pyenv.run script..."
curl https://pyenv.run | bash

echo
echo "----------------------------------------------------------------------"
echo "                          PYENV INSTALLED!!!                          "
echo "----------------------------------------------------------------------"
echo

latest_python3=$($PYENV_PATH/bin/pyenv install --list | sed 's/^  //' | \
	grep '^3.[0-9]*.[0-9]*$' | tail -n1)

if yesno "Install python '$latest_python3'? (y/n) "; then
	echo "Installing..."
	$PYENV_PATH/bin/pyenv install "$latest_python3"
fi

if yesno "Make '$latest_python3' global? (y/n) "; then
	echo "Globalling..."
	$PYENV_PATH/bin/pyenv global "$latest_python3"
fi

if yesno "Install python '2.7.18'? (y/n) "; then
	echo "Installing..."
	$PYENV_PATH/bin/pyenv install "2.7.18"
fi

#!/usr/bin/env bash

PYENV_PATH="$HOME/.pyenv"

if [[ -d "$PYENV_PATH" ]]; then
	echo "Removing already existing pyenv directory..."
	rm -rf "$PYENV_PATH"
fi

curl https://pyenv.run | bash

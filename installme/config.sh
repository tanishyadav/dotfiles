#!/usr/bin/env bash

TMP_PATH="/tmp"
PREFIX_PATH="$HOME/.local"
SRC_PATH="$PREFIX_PATH/src"
BIN_PATH="$PREFIX_PATH/bin"
PYENV_PATH="$HOME/.pyenv"
ZSH_PATH="$HOME/.zsh"

function yesno() {
	while true; do
		read -p "$1" answer
		case ${answer:0:1} in
			y|Y )
				return 0
				;;
			n|N )
				return 1
				;;
			* )
				echo "Invalid response"
				;;
		esac
	done
}

#!/usr/bin/env bash

PREFIX_PATH=$HOME/.local
SRC_PATH=$PREFIX_PATH/src
ZSH_PATH=$HOME/.zsh

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

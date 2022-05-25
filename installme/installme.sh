#!/bin/bash

#set -euxo pipefail

while true; do
read -p "Do you want to install Zsh? (y/n) " yn
case $yn in 
	[yY] ) source install-zsh.sh;
		break;;
	[nN] ) echo NOT instaling Zsh;
		break;;
	* ) echo Invalid response;;
esac
done

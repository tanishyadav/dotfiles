#!/usr/bin/env bash

echo "Installing vim-gtk3..."
sudo apt install vim-gtk3
echo "Removing vim-tiny..."
sudo apt remove vim-tiny

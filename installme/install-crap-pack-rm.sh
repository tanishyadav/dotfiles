#!/usr/bin/env bash

sudo apt install gnome-core
sudo apt remove --purge gnome-games
sudo apt remove --purge libreoffice*
sudo apt remove --purge malcontent
sudo apt remove --purge gnome-weather
sudo apt clean
sudo apt autoremove

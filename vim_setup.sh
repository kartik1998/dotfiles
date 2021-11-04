#!/bin/bash

function check_nvim {
while true; do
    read -p "Please Install nvim before setup starts. Is nvim installed? [Y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Please install nvim first." 
		     exit;;
        * ) echo "Please answer yes or no.";;
    esac
done 
}

check_nvim

rm -rf .vim*

# Setup neovim 
mkdir -p $HOME/.config
ln -s $PWD/vim $HOME/.config/nvim

# Install neovim plugins
nvim +PlugInstall




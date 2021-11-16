#!/bin/bash

function check_nvim {
while true; do
    read -p "Please Install nvim and node before setup starts. Is nvim, node installed? [Y/n]" yn
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

# Install coc plugins
nvim +'CocInstall coc-pairs'
nvim +'CocInstall coc-tabnine'
nvim +'CocInstall coc-tsserver'
nvim +'CocInstall coc-html'
nvim +'CocInstall coc-css'
nvim +'CocInstall coc-highlight'
nvim +'CocInstall coc-eslint'
nvim +'CocInstall coc-yaml'
nvim +'CocInstall coc-prettier'



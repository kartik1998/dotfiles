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

# Install universal-ctags (required for vim-gutentags)
if ! command -v ctags &> /dev/null; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install universal-ctags
  else
    sudo apt-get install -y universal-ctags
  fi
fi

# Setup neovim 
mkdir -p $HOME/.config
ln -s $PWD/vim $HOME/.config/nvim

# Setup ctags config
mkdir -p $HOME/.ctags.d
mkdir -p $HOME/.ctags.d/tags
ln -sf $PWD/vim/ctags.d/default.ctags $HOME/.ctags.d/default.ctags

# Install neovim and coc plugins
nvim +PlugInstall 




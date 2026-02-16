#!/bin/bash
set -e

echo "Setting up vim..."

# create required directories
mkdir -p "$HOME/.vim/colors"
mkdir -p "$HOME/.vim/undodir"

# get colorschemes
curl -sfLo "$HOME/.vim/colors/hybrid.vim" \
  https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/colors/hybrid.vim
curl -sfLo "$HOME/.vim/colors/codedark.vim" \
  https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/colors/codedark.vim

# get vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get vimrc
curl -sfLo "$HOME/.vimrc" \
  https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/.vimrc

# install plugins
vim +PlugInstall +qall

echo "Done! Run 'vim' to get started."

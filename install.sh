#!/bin/bash

echo "Dependencies: vim, zsh"
#TODO: Use readline/dirname to get directory of script

# Setup vim
#ln -s $PWD/vim $HOME/.vim
#ln -s $HOME/.vim/init.vim $HOME/.vimrc
#ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

# Setup neovim
#mkdir -p $HOME/.config
#ln -s $PWD/vim $HOME/.config/nvim

# Setup tmux
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh
# zsh setup needs improvement
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen #FixMe: Standardize
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/zsh/zshrc.alias $HOME/.zshrc.alias #TODO: Remove this;

# Init vim
#vim +PlugInstall +qall

# Set zsh as default shell
chsh -s /bin/zsh

# Init zsh and antigen plugins
touch $HOME/.profile  # Make sure this file exists to avoid warnings
zsh -l

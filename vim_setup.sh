# get colorscheme
mkdir -p $HOME/.vim/colors
curl -o $HOME/.vim/colors/hybrid.vim https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/colors/hybrid.vim

# get vimrc 
curl -o $HOME/.vimrc https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/.vimrc

# install plugins
vi +PlugInstall +qall

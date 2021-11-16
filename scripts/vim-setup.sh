# get colorscheme
mkdir -p $HOME/.vim/colors
curl -o $HOME/.vim/colors/hybrid.vim https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/colors/hybrid.vim > /dev/null

# get vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null

# get vimrc 
curl -o $HOME/.vimrc https://raw.githubusercontent.com/kartik1998/dotfiles/master/vim/.vimrc > /dev/null

# install plugins
vi +PlugInstall 

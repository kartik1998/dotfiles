if filereadable(expand("~/.config/nvim/vimrc.bundles"))
  source ~/.config/nvim/vimrc.bundles
endif
set rtp^=/usr/share/vim/vimfiles/
set runtimepath+=$GOROOT/misc/vim
syntax on
set number
set relativenumber
filetype plugin indent on
set hlsearch
set incsearch
set magic
set smarttab
set autoindent
set autoread
set tabstop=4 softtabstop=4
set nowrap
set scrolloff=10 "start scrolling down / up when you are 10 lines away
set shiftwidth=4
set nohlsearch "remove highlight from text after search 
set hidden "navigate away from buffers without saving them, takes a little bit more RAM but basically peanuts compared to VS code
set ignorecase "ignore case sensitivity while searching
set smartcase 
set undofile
set undodir=~/.vim/undodir
set background=dark
if has('mouse')
  set mouse=a
endif

let mapleader=" " 

" saves the buffer in insert mode
inoremap <C-s> <Esc>:w<cr>i
" saves the buffer in insert mode
nnoremap <C-s> <Esc>:w<cr>
" yanks to clipboard in visual mode
vnoremap <C-c> "+y


if filereadable(expand("~/.config/nvim/vimrc.bundles"))
  source ~/.config/nvim/vimrc.bundles
endif
set rtp^=/usr/share/vim/vimfiles/
syntax on
set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set number
set relativenumber
set hlsearch
set incsearch
set magic
set smarttab
set autoindent
set autoread
set tabstop=4 softtabstop=4
set nowrap
set diffopt+=vertical
set hidden
set cmdheight=1
set scrolloff=10 "start scrolling down / up when you are 10 lines away
set shiftwidth=4
set nohlsearch "remove highlight from text after search 
set hidden "navigate away from buffers without saving them, takes a little bit more RAM but basically peanuts compared to VS code
set ignorecase "ignore case sensitivity while searching
set smartcase 
"set signcolumn=yes
set undofile
set undodir=~/.vim/undodir
set background=dark
set updatetime=750
colorscheme codedark

if has('mouse')
  set mouse=a
endif
if has('termguicolors')
  set termguicolors
endif

filetype plugin indent on

let mapleader=" " 
let g:netrw_banner=0 "remove banner from file explorer
let g:markdown_fenced_languages = ["javascript", "js=javascript", "json=javascript"] "syntax highlighting for code snippets and markdown files

" saves the buffer in insert mode
inoremap <C-s> <Esc>:w<cr>i
" saves the buffer in insert mode
nnoremap <C-s> <Esc>:w<cr>
" yanks to clipboard in visual mode
vnoremap <C-c> "+y

" lightline and vim-gitbranch
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component_function': {
      \   'helloworld': 'gitbranch#name'
      \ },
      \ }



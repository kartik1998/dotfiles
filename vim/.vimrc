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
set smartindent
set autoread
set tabstop=2 softtabstop=2
set nowrap
set hidden
set cmdheight=1
set scrolloff=10 "start scrolling down / up when you are 10 lines away
set shiftwidth=2
set nohlsearch "remove highlight from text after search 
set hidden "navigate away from buffers without saving them, takes a little bit more RAM but basically peanuts compared to VS code
set ignorecase "ignore case sensitivity while searching
set smartcase 
"set signcolumn=yes
set undofile
set undodir=~/.vim/undodir
set background=dark
set cursorline
set updatetime=750
colorscheme hybrid

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

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

"split view remaps 
"vertical split
nnoremap <C-v> :vsplit <CR> 
"horizontal split
nnoremap <C-h> :split <CR>

" make Y effect to end of line instead of whole line
map Y y$
call plug#begin('~/.vim/plugged')

" autocompletion and intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"search, navigation related
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ctrlpvim/ctrlp.vim'

"accessories
Plug 'szw/vim-maximizer' "to maximize the split
Plug 'tpope/vim-commentary' "to comment source code
Plug 'machakann/vim-highlightedyank' "highlighted yanking
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' "surround your text effectively
Plug 'jiangmiao/auto-pairs' "auto pairing improved
Plug 'jeetsukumaran/vim-buffergator', { 'on': ['BuffergatorOpen', 'BuffergatorToggle'] }

call plug#end()

"scrooloose/nerdtree
map <leader>e :NERDTreeToggle<cr>
" auto refresh nerd tree for when a file is added / removed
autocmd BufEnter NERD_tree_* | execute 'normal R' 
" show dotfiles in NERDTree
let NERDTreeShowHidden=1
" ignore .git directory in nerd tree
let NERDTreeIgnore=['\.git$']

" szw/vim-maximizer - to maximize the split
nnoremap <leader>m :MaximizerToggle! <CR>

"ctrlp navigation
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Custom ignore for ctrlp
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bower_components/*,*/node_modules/*,*/dist/*,*/build/*

" buffergator
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>

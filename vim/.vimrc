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

"split view remaps
"vertical split
nnoremap <leader>v :vsplit <CR>
"horizontal split
nnoremap <leader>h :split <CR>

" make Y effect to end of line instead of whole line and copy to clipboard
map Y "+y$
" copy line yanks to clipboard
nnoremap yy "+yy
" copy visual mode text selections to clipboard
vnoremap y "+y
" paste all yanks in clipboard
nnoremap y "+y
nnoremap yw "+yiw

" Make <enter> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo
" reference: https://vi.stackexchange.com/questions/38690/change-the-keys-for-accepting-coc-dropdown
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <Leader>st :call FzfGitStash()<CR>

" Git stash viewer with fzf
function! FzfGitStash()
  let stashes = systemlist('git stash list')
  if empty(stashes)
    echo 'No stashes found'
    return
  endif
  call fzf#run(fzf#wrap({
    \ 'source': stashes,
    \ 'sink': function('s:HandleStash'),
    \ 'options': ['--preview', 'echo {} | cut -d: -f1 | xargs git stash show -p', '--preview-window=right:70%']
  \ }))
endfunction

function! s:HandleStash(line)
  let stash_id = split(a:line, ':')[0]
  call system('git stash apply ' . stash_id)
  quit
endfunction

" select entire file
map <C-a> ggVG

" join line i.e. <shift> j takes the cursor to the joined line first char.
" Below remap keeps the cursor IN PLACE
" nnoremap J mzJ`z

call plug#begin('~/.vim/plugged')

" autocompletion and intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"search, navigation related
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

"accessories
Plug 'szw/vim-maximizer' "to maximize the split
Plug 'tpope/vim-commentary' "to comment source code
Plug 'machakann/vim-highlightedyank' "highlighted yanking
Plug 'mg979/vim-visual-multi' "multiple cursors
Plug 'tpope/vim-surround' "surround your text effectively
Plug 'jiangmiao/auto-pairs' "auto pairing improved
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion' "easymotion
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

" fzf remaps
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <C-p> :Files <CR>
nnoremap <C-f> :Rg <CR>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

"easymotion/vim-easymotion
" Move to word
map  <Leader>f <Plug>(easymotion-bd-w)

" <Leader>f{char} to move to {char}
map  , <Plug>(easymotion-bd-f)

" Autoformat JSON files using jq when pressing <leader>l
autocmd FileType json nnoremap <buffer> <leader>l :%!jq .<CR>

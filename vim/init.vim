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

map <Esc>[B <Down>]

set undofile
set undodir=~/.vim/undodir

let mapleader=" "
map <leader>e :NERDTreeToggle<cr>
map <F9> :TagbarToggle<cr>
" let g:NERDTreeDirArrows=0

" Set default split positions
set splitright
set splitbelow

" saves the buffer in insert mode
inoremap <C-s> <Esc>:w<cr>i
" saves the buffer in insert mode
nnoremap <C-s> <Esc>:w<cr>
" yanks to clipboard in visual mode
vnoremap <C-c> "+y

" Make enter finish the completion popup menu
nnoremap gp `[v`] 
set backspace=indent,eol,start

" let g:codedark_conservative = 1
let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox
set background=dark

" Move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set laststatus=2

"Display whitespace characters
set listchars=tab:│\ ,trail:·
set list

"Fold Methods
set foldmethod=indent
set nofoldenable    "Stop from folding at load

if has('mouse')
  set mouse=a
endif

"Buffer Mappings
nmap <C-e> :b#<CR>
nmap <C-PageUp> :bnext<CR>
nmap <C-PageDown> :bprev<CR>
nmap <leader>] :tabnext<CR>
nmap <leader>[ :tabprev<CR>

"Toggle Highlights
map <leader>q :noh<CR>

"Map CtrlPTag
map <C-y> :CtrlPTag<CR>

"Functions
function Opaq()
  set t_Co=256
  colorscheme Tomorrow-Night-Eighties
endfunction

function Transp()
  set t_Co=128
endfunction

" NeoVim specific stuff
if has('nvim')
  set termguicolors
  let test#strategy = 'neovim' " for vim-test

  " Neovim terminal mappings
  tnoremap <Leader><ESC> <C-\><C-n>

  " Live substitute preview
  set inccommand=nosplit
endif

" Vim specific stuff
if !has('nvim')
  map y <Plug>(highlightedyank)
endif

"Smart Home (VimTip315)
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction

noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

"Custom ignore for ctrlp
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bower_components/*,*/node_modules/*,*/dist/*,*/build/*

"signify: updte git markers when vim gains focus
let g:signify_update_on_focusgained = 0

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 11
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

"Tagbar config for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

if has('cscope')
  set cscopetag

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" Tabline settings
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#neomake#enabled = 0

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Choosewine settings
nmap  <leader>w  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" For Lazy loading buffergator
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>

" vim: set ts=2 sw=2 et :

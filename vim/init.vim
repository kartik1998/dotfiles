if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
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
set tabstop=4
set shiftwidth=4
map <Esc>[B <Down>]

set undofile
set undodir=~/.vim/undodir

map <F8> :NERDTreeToggle<cr>
map <F9> :TagbarToggle<cr>
" let g:NERDTreeDirArrows=0

" Set default split positions
set splitright
set splitbelow

" Make enter finish the completion popup menu
nnoremap gp `[v`] 
set backspace=indent,eol,start
colorscheme yowish

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

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

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

"run Neomake on every document save
autocmd! BufWritePost * Neomake

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

let g:deoplete#enable_at_startup = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

let g:airline#extensions#neomake#enabled = 0

let g:neomake_elixir_mix_maker = {
      \ 'exe' : 'mix',
      \ 'args': ['compile', '--warnings-as-errors'],
      \ 'cwd': getcwd(),
      \ 'errorformat':
        \ '** %s %f:%l: %m,' .
        \ '%f:%l: warning: %m'
      \ }

let g:neomake_elixir_enabled_makers = ['mix']

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

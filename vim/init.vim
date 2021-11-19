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
set smartindent
set autoread
set tabstop=2 softtabstop=2
set nowrap
set diffopt+=vertical
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

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" " auto pairing 
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

"replace ~ (EndOfBuffer) with '-', ref: https://github.com/neovim/neovim/issues/2067 
set fcs=eob:- 

"go to definition with coc-definition
nmap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
nmap <silent> gD <Plug>(coc-implementation)

"remap <ctrl>+q to quit buffer
function! NumberOfOpenBuffers()
    let i = bufnr('$')
    let j = 0
    while i >= 1
        if buflisted(i)
            let j+=1
        endif
        let i-=1
    endwhile
    return j
endfunction

nnoremap <expr> <C-q> (NumberOfOpenBuffers() <= 1 ? ':q<cr>' : ':bd<cr>')

"split view remaps 
"vertical split
nnoremap <leader>v :vsplit <cr> 
"horizontal split
nnoremap <leader>h :split <cr>

" --- Plugin Configurations --- "

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

" kassio/neoterm - terminal for neovim
let g:neoterm_default_mod = 'belowright'
let g:neoterm_size = 11
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <C-t> :Ttoggle<CR>
tnoremap <C-t> <C-\><C-n>:Ttoggle<CR>

" machakann/vim-highlightedyank for highlighted yankiing
if !has('nvim')
  map y <Plug>(highlightedyank)
endif

" sbdchd/neoformat
nnoremap <leader>l :Neoformat prettier<CR> 

" commenting code: gc [in visual mode]

" nvim-telescope/telescope.nvim
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> :Telescope live_grep <CR>
"ignore node modules for live grep
lua << EOF
require('telescope').setup{
  defaults = { file_ignore_patterns = {"node_modules",".git"} }
}
EOF

nnoremap <leader>b :Telescope buffers <CR>
"nnoremap <leader>fh :Telescope help_tags<cr>

" tpopt/vim-fugitive
" 's' to stage a file, see diff with '=' & 'cc' to commit
nnoremap <leader>gst :G<CR>

" janko/vim-test
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"

" puremourning/vimspector
" run :VimspectorInstall vscode-node-debug2 for nodejs debugging. 
" launch.json will be .vimspector.json 
nnoremap <leader>ds :call vimspector#Launch()<CR> 
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nmap <Leader>dr <Plug>VimspectorRestart

nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>

nnoremap <leader>dk :call vimspector#StepOut()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>

" vim-airline/vim-airline tabline settings
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='codedark'
let g:airline#extensions#tabline#buffers_label = ''
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>

" luochen1990/rainbow (bracket pair colorizing)
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['#61AFEF', '#e6e600', 'darkcyan', '#C678DD'],
\	'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta'],
\	'operators': '',
\	'parentheses': map(['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'], 'v:val." fold"'),
\	'parentheses_options': 'contains=@NoSpell',
\	'separately': {
\		'csv': {
\			'parentheses': ['start=/\v[^,]*\,/ step=// end=/$/ keepend'],
\		},
\		'coq': 0,
\	}
\}

""lukas-reineke/indent-blankline.nvim
"lua << EOF
"vim.opt.list = true

"require("indent_blankline").setup {
"    show_end_of_line = true,
"}
"EOF

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

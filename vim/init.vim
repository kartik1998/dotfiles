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
set showmatch "Highlights matching parentheses
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
set autowrite
" colorscheme darkplus
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

" -- yank remaps (remap yanks to clipboard and main register) ---
" yanks to clipboard in visual mode
vnoremap <C-c> "+y
" make Y effect to end of line instead of whole line and copy to clipboard
map Y "+y$
" copy visual mode text selections to clipboard
vnoremap y "+y 
" paste all yanks in clipboard
nnoremap y "+y
nnoremap yw "+yiw
" note: this works with visual, line and Y kind of yank. not for count yanks
" like: (normal mode: <count>y<command>)
" -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

" remap ctrl+v to paste from clipboard
inoremap <C-v> <ESC>"+p<cr>i

" select entire file
map <C-a> ggVG

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

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
"alternate commands <C-w> v (vertical split) & <C-w> s (horizontal split)
nnoremap <leader>v :vsplit <cr> 
"horizontal split
nnoremap <leader>h :split <cr>

" join line i.e. <shift> j takes the cursor to the joined line first char.
" Below remap keeps the cursor IN PLACE
nnoremap J mzJ`z

" --- Plugin Configurations --- "

"scrooloose/nerdtree
map <leader>e :NERDTreeToggle<cr>
" auto refresh nerd tree for when a file is added / removed
autocmd BufEnter NERD_tree_* | execute 'normal R' 
" show dotfiles in NERDTree
let NERDTreeShowHidden=1
" ignore .git directory in nerd tree
let NERDTreeIgnore=['\.git$']
let g:NERDTreeWinPos = "right" "open nerd tree to the right

" szw/vim-maximizer - to maximize the split
nnoremap <C-m> :MaximizerToggle! <CR>

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
nnoremap <C-g>b :Telescope git_branches<cr>
nnoremap <C-g><C-b> :Telescope git_branches<cr>
nnoremap <C-g>log :Telescope git_commits<cr>
nnoremap <C-g>st :Telescope git_status<cr>
nnoremap <leader>st :Telescope git_stash<cr>

"ignore node modules for live grep
lua << EOF
require('telescope').setup{
  defaults = { file_ignore_patterns = {"node_modules",".git"} },
  pickers = { find_files = { hidden = true } }
}
EOF

nnoremap <leader>b :Telescope buffers <CR>
"nnoremap <leader>fh :Telescope help_tags<cr>

" tpopt/vim-fugitive
" 's' to stage a file, see diff with '=' & 'cc' to commit
" nnoremap <leader>gst :G<CR>

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
\	'guifgs': ['#61AFEF', '#e6e600', '#00a550', '#C678DD'],
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

" neoclide/coc.nvim

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-tabnine',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-highlight',
  \ 'coc-yaml',
  \ ]

" vim-go
" go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)

"jreybert/vimagit
nnoremap <leader>m :Magit <cr>

"easymotion/vim-easymotion 
" Move to word
map  <Leader>f <Plug>(easymotion-bd-w)

" <Leader>f{char} to move to {char}
map  , <Plug>(easymotion-bd-f)


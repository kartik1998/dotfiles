" Disable unused providers to speed up startup
let g:loaded_python3_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

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
nnoremap yw mz"+yiw`z
" -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

" remap ctrl+v to paste from clipboard
inoremap <C-v> <ESC>"+p<cr>i

" select entire file
map <C-a> ggVG

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

" built-in highlighted yank (nvim 0.11+)
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})

" nvim-telescope/telescope.nvim
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> :Telescope live_grep <CR>
nnoremap <C-g>b :Telescope git_branches<cr>
nnoremap <C-g><C-b> :Telescope git_branches<cr>
nnoremap <C-g>log :Telescope git_commits<cr>
nnoremap <C-g>st :Telescope git_status<cr>
nnoremap <leader>st :Telescope git_stash<cr>

" Make <enter> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo
" reference: https://vi.stackexchange.com/questions/38690/change-the-keys-for-accepting-coc-dropdown
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" nvim-lualine/lualine.nvim
lua << EOF
require('lualine').setup {
  options = {
    theme = 'codedark',
    section_separators = '',
    component_separators = '|',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {{'buffers', mode = 4}},
    lualine_z = {}
  },
}
EOF
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>

" HiPhish/rainbow-delimiters.nvim (treesitter-based bracket colorizing)
lua << EOF
local rainbow_delimiters = require('rainbow-delimiters')
vim.g.rainbow_delimiters = {
  strategy = { [''] = rainbow_delimiters.strategy['global'] },
  query = { [''] = 'rainbow-delimiters' },
  highlight = {
    'RainbowDelimiterBlue',
    'RainbowDelimiterYellow',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
  },
}
EOF

" neoclide/coc.nvim

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
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

" folke/flash.nvim (jump anywhere)
lua << EOF
require('flash').setup({
  modes = { char = { enabled = true } },
})
EOF
nnoremap <Leader>f <cmd>lua require('flash').jump()<CR>
xnoremap <Leader>f <cmd>lua require('flash').jump()<CR>
nnoremap , <cmd>lua require('flash').treesitter()<CR>
xnoremap , <cmd>lua require('flash').treesitter()<CR>


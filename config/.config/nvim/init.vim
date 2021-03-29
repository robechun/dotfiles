if !exists('g:vscode')

" ========================================================================= " 
" ====                         GLOBAL CONFIG                           ==== "
" ========================================================================= " 

" Where is python3?
let g:python3_host_prog = '/usr/bin/python3'
set encoding=UTF-8

" Allow for file type detection
filetype plugin indent on

" Re-map leader keys
let mapleader=","
let maplocalleader = "\\"

" ========================================================================= " 
" ====                         PLUGIN CONFIG                           ==== "
" ========================================================================= " 
call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'preservim/nerdtree'
" Plug 'kyazdani42/nvim-tree.lua'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim status bar
Plug 'glepnir/galaxyline.nvim'

" Vim surrond
Plug 'tpope/vim-surround'

" Commenting
Plug 'tpope/vim-commentary'

" Better Targeting of text objects
Plug 'wellle/targets.vim'

" fuzzyfind
Plug 'junegunn/fzf'

" Theme of text editor
Plug 'sainnhe/gruvbox-material'

" Icons for stuff
Plug 'ryanoasis/vim-devicons'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Function params help
Plug 'Shougo/echodoc.vim'

" Nvim built-in lsp
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

" status for LSP
Plug 'nvim-lua/lsp-status.nvim'

" Nvim LSP completion
Plug 'hrsh7th/nvim-compe'

" GUI on top of builtin lsp
Plug 'glepnir/lspsaga.nvim'

" Get help with function stuff on side
Plug 'liuchengxu/vista.vim'

" Get css colors within terminal
Plug 'norcalli/nvim-colorizer.lua'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Better bufferline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/nvim-bufferline.lua'

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }




call plug#end()

" FZF setup to work with vim
set rtp+=/usr/local/opt/fzf

" Tagging
"set tags=tags

" GitGutter settings
set updatetime=100


autocmd BufWritePre *.ts,*.js,*.jsx,*.tsx Prettier

"" ============================= "
"" ======    TELESCOPE    ====== "
"" ============================= "
" configs found in telescope.vim


"" ============================= "
"" ======      VISTA      ====== "
"" ============================= "
nnoremap <silent><C-v> :Vista nvim_lsp<CR>


"" ============================= "
"" ======    LSP Saga     ====== "
"" ============================= "

lua << EOF
    local saga = require 'lspsaga'
    saga.init_lsp_saga()
EOF

nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>gs :Lspsaga signature_help<CR>
nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent>gr :Lspsaga rename<CR>

nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>




"let g:echodoc#enable_at_startup = 1



" ============================ "
" ======    Nvim Tree   ====== "
" ============================ "

" nnoremap <leader>. :NvimTreeToggle<CR>
" nnoremap <leader>m :NvimTreeFindFile<CR>

 " Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Open nerdtree
nnoremap <leader>. :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>



" ========================================================================= " 
" ====                         EDITOR CONFIG                           ==== "
" ========================================================================= " 

" Don't do visual bells
set novisualbell


" use relative numbers
set number relativenumber

" colorscheme
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_palette = 'mix'
colorscheme gruvbox-material

 "CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set autoindent		" always set autoindenting on
set tabstop=4		" visual rep of tabs
set expandtab		" tabs are spaces
set shiftwidth=4	" shift width is 4 with >> or <<
set shiftround		" shift works with >>
set matchtime=3		" parenthesis matching
set wildmenu		" enhanced menu for cmd
set hlsearch		" hightlight search
set cmdheight=1     " Only one line for command line
set incsearch		" include search as you type
set noshowmode      " Don't dispay mode in command line (airilne already shows it)
set winbl=10        " Set floating window to be slightly transparent
set ignorecase      " ignore case when searching
set smartcase       " if the search string has an upper case letter in it, the search will be case sensitive
set splitright      " have vs split right instead of left 
set mouse=a         " Allow use of mouse in all modes


" undo highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]

" edit vim file fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Moving between windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" TODO this does not work well
" command-shift-t behavior in chrome
nnoremap <leader><C-t> :vs#<cr>

" Quick-fix list commands
nnoremap <C-q> :copen<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-b> :cprev<CR>



" turn on syntax highlighting
syntax on


" ========================================================================= " 
" ====                          MISC CONFIG                            ==== "
" ========================================================================= " 

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set termguicolors

" True colors and italics
"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

endif


" ===== PLUGINS ===== "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git stuff
Plugin 'tpope/vim-fugitive'

" Vim status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Emmet HTML plugin
" Plugin 'mattn/emmet-vim'

" Vim surrond
Plugin 'tpope/vim-surround'

" Commenting
Plugin 'scrooloose/nerdcommenter'

" TODO might not need with fugitive: git gutter
"Plugin 'mhinz/vim-signify'

" Better Targeting of text objects
Plugin 'wellle/targets.vim'

" fuzzyfind
Plugin 'junegunn/fzf'

" Autocomplete/Intellisense
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-bufword'      " for things within buffer
Plugin 'ncm2/ncm2-path'         " for file paths

" Typescript
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', {'do': './install.sh'}

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" TODO: silver searcher ag or ack
" TODO: syntax highlighting things

" Theme of text editor
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" FZF setup to work with vim
set rtp+=/usr/local/opt/fzf

" NCM2 configurations
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })
let g:python3_host_prog = '/usr/local/bin/python3'






" ====== NORMAL SETUP ===== "
set novisualbell
let mapleader=","
let maplocalleader = "\\"

" Airline configurations
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1

" NUMBERING "
set number relativenumber

" background contrast and colorscheme
colorscheme gruvbox

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set autoindent		" always set autoindenting on
set tabstop=4		" visual rep of tabs
set expandtab		" tabs are spaces
set shiftwidth=4	" shift width is 4 with >> or <<
set shiftround		" shift works with >>

set matchtime=3		" parenthesis matching
set wildmenu		" enhanced menu for cmd
"set cursorline		" show cursor line
set hlsearch		" hightlight search
set incsearch		" include search as you type

" undo highlight
nnoremap <leader><space> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]

" edit vim file fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


syntax on

" Tagging
set tags=tags

" GitGutter settings
set updatetime=100





" ===== MISC THINGS ===== "
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" True colors and italics
"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif

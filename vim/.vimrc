set nocompatible              " be iMproved, required
filetype off                  " required

" To italicize comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set novisualbell
let mapleader=","
let maplocalleader = "\\"

let g:material_terminal_italics = 1
let g:airline_theme = 'cool'

highlight Comment cterm=italic gui=italic

set background=dark

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

" Airline (Powerline for vim)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Palenight theme
Plugin 'drewtempelmeyer/palenight.vim'

" Kolor theme Plugin 'zeis/vim-kolor'

" Material theme
Plugin 'kaicataldo/material.vim'

" Smooth Scrolling "
"Plugin 'yuttie/comfortable-motion.vim'

" Emmet HTML plugin "
Plugin 'mattn/emmet-vim'

" ALE Linting
Plugin 'w0rp/ale'

" Multiline cursor
Plugin 'terryma/vim-multiple-cursors'

" Surrounding
Plugin 'tpope/vim-surround'

" vim LSP
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'

" C++ Extended Syntax Highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" GutenTags
Plugin 'ludovicchabant/vim-gutentags'

" NerdCommenter
Plugin 'scrooloose/nerdcommenter'

" Git gutter (what changed and additions, etc)
Plugin 'airblade/vim-gitgutter'

" Vim target
Plugin 'wellle/targets.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Highlighting
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme material
let g:material_theme_style = 'palenight'

" NUMBERING "
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" END NUMBERING "

" vim ISort for Python
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set autoindent		" always set autoindenting on
set tabstop=4		" visual rep of tabs
set expandtab		" tabs are spaces
set shiftwidth=4	" shift width is 4 with >> or <<
set shiftround		" shift works with >>
set showmatch		" parenthesis matching
set matchtime=3		" parenthesis matching
set wildmenu		" enhanced menu for cmd
"set cursorline		" show cursor line
set hlsearch		" hightlight search
set incsearch		" include search as you type


" delete line in insertmode
inoremap <c-d> <esc>ddO

" uppercase in insertmode
inoremap <c-u> <esc>lviwU

" undo highlight
nnoremap <leader><space> :nohlsearch<CR>

" Open nerdtree
nnoremap <leader>. :NERDTreeToggle<CR>
nnoremap <leader>v. :NERDTreeVCS<CR>

" movement to beginning/end of line
"nnoremap H ^
"nnoremap L $
"nnoremap ^ <nop>
"nnoremap $ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vim file fast
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" textwidth to 80 and color line
set textwidth=80
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

syntax on

" POWERLINE TODO"

" Using fzf
set rtp+=/usr/local/opt/fzf

" Tagging
set tags=tags

" GitGutter settings
set updatetime=100


" True colors and italics
"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set novisualbell
let mapleader=","
let maplocalleader = "\\"





" =============== VUNDLE ======================= " 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Smooth Scrolling "
Plugin 'yuttie/comfortable-motion.vim'

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

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" C++ Extended Syntax Highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" GutenTags
Plugin 'ludovicchabant/vim-gutentags'

" NerdCommenter
Plugin 'scrooloose/nerdcommenter' 

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





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
set cursorline		" show cursor line
set hlsearch		" hightlight search
set incsearch		" include search as you type


" delete line in insertmode
inoremap <c-d> <esc>ddO

" uppercase in insertmode
inoremap <c-u> <esc>lviwU

" undo highlight
nnoremap <leader><space> :nohlsearch<CR>

" movement to beginning/end of line
nnoremap H ^
nnoremap L $
nnoremap ^ <nop>
nnoremap $ <nop>

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

" Vim Powerline "
set rtp+=/Users/robertchung/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
" END POWERLINE "


" Using fzf
set rtp+=/usr/local/opt/fzf

" Tagging
set tags=tags

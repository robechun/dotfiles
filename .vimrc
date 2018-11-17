" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set novisualbell
let mapleader=","

" NUMBERING " 
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" END NUMBERING " 

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
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

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

" Vim-Plugin here"
" -------------- "

call plug#begin()

" Smooth Scrolling "
Plug 'yuttie/comfortable-motion.vim'

" Emmet HTML plugin "
Plug 'mattn/emmet-vim'

" ALE Linting
Plug 'w0rp/ale'

" Multiline cursor
Plug 'terryma/vim-multiple-cursors'

" Surrounding 
Plug 'tpope/vim-surround'

call plug#end()

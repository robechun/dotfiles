" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set novisualbell

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
set tabstop=4
set shiftwidth=4

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

call plug#end()

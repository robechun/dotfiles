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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NerdTree
Plugin 'preservim/nerdtree'

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
Plugin 'neoclide/coc.nvim'

" FZF and stuff real easy
Plugin 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Denite is an interface for
"Plugin 'Shougo/denite.nvim'

" TODO: silver searcher ag or ack
" TODO: syntax highlighting things

" Theme of text editor
Plugin 'morhetz/gruvbox'

" Show function signature completions in command line
Plugin 'Shougo/echodoc.vim'

" Icons for stuff
Plugin 'ryanoasis/vim-devicons'


call vundle#end()

" FZF setup to work with vim
set rtp+=/usr/local/opt/fzf

" Tagging
"set tags=tags

" GitGutter settings
set updatetime=100


"" ============================= "
"" ======     LEADERF     ====== "
"" ============================= "

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" Shortcuts
"
"   <C-p>      --- normal file searching use-case
"   <leader>b  --- searching within open buffers
"   <C-F>      --- find within text (cmd-shift-f) in IntelliJ
let g:Lf_ShortcutF = "<C-p>"
noremap <leader>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e ")<CR>

" Make split more intuitive
"
"   <C-l>      --- split vertical
"   <C-h>      --- split horizontal
let g:Lf_CommandMap = {
  \   '<C-]>': ['<C-l>'],
  \   '<C-x>': ['<C-h>'],
  \}


" ============================ "
" ======    NERDTree    ====== "
" ============================ "

" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Open nerdtree
nnoremap <leader>. :NERDTreeToggle<CR>
nnoremap <leader>v. :NERDTreeVCS<CR>



" ============================ "
" ====    VIM Airline    ===== "
" ============================ "

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Enable powerline fonts
let g:airline_powerline_fonts = 1


" ============================ "
" ========     COC    ======== "
" ============================ "

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


" ============================ "
" ======     EchoDoc     ===== "
" ============================ "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1



" ========================================================================= " 
" ====                         EDITOR CONFIG                           ==== "
" ========================================================================= " 

" Don't do visual bells
set novisualbell


" use relative numbers
set number relativenumber

" colorscheme
colorscheme gruvbox

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

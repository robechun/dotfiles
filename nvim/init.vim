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
" set rtp +=~/.vim
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" NerdTree
Plug 'preservim/nerdtree'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Emmet HTML plugin
" Plug 'mattn/emmet-vim'

" Vim surrond
Plug 'tpope/vim-surround'

" Commenting
Plug 'scrooloose/nerdcommenter'

" TODO might not need with fugitive: git gutter
"Plug 'mhinz/vim-signify'

" Better Targeting of text objects
Plug 'wellle/targets.vim'

" fuzzyfind
Plug 'junegunn/fzf'

" Autocomplete/Intellisense
Plug 'neoclide/coc.nvim'

" FZF and stuff real easy
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" TODO: syntax highlighting things

" Theme of text editor
Plug 'morhetz/gruvbox'

" Icons for stuff
Plug 'ryanoasis/vim-devicons'

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" Javascript syntax hightlighting
Plug 'pangloss/vim-javascript'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Function params help
Plug 'Shougo/echodoc.vim'

call plug#end()

" FZF setup to work with vim
set rtp+=/usr/local/opt/fzf

" Tagging
"set tags=tags

" GitGutter settings
set updatetime=100


"" ============================= "
"" ======    TELESCOPE    ====== "
"" ============================= "
" configs found in telescope.vim


"" ============================= "
"" ======     EchoDoc     ====== "
"" ============================= "

"let g:echodoc#enable_at_startup = 1



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
nnoremap <leader>m :NERDTreeFind<CR>
nnoremap <leader>v. :NERDTreeVCS<CR>




" ============================ "
" ====    VIM Airline    ===== "
" ============================ "

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" TODO HOW TO CONFIGURE THIS CORRECTLY???
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_active_highlight = 'bufferline_selected'
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

"let g:bufferline_separator = g:airline_symbols.space

"let g:airline#extensions#tabline#buf_label_first = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#alt_sep = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#show_tab_nr = 1

"" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

"let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])


" let g:airline_statusline_ontop = 1

"" Enable powerline fonts
let g:airline_powerline_fonts = 1


" ============================ "
" ========     COC    ======== "
" ============================ "

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


nmap <leader>ac  <Plug>(coc-codeaction)

" Quick fix
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)



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
set splitright      " have vs split right instead of left 


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

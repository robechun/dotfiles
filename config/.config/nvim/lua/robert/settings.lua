local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Leader key -> ','
--
-- In general, it's a good idea to opt(this early in your config, because otherwise
-- if you have any mappings you opt(BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.cmd('let g:python3_host_prog = \'/usr/bin/python3\'') -- where is python3
vim.cmd('set novisualbell')

vim.o.fileencoding = 'utf-8'

-- highlighting
-- example:  vim.cmd([[highlight BufferCurrent guibg=#5fd7ff guifg=#282a2e]])

local indent = 4

-- Buffer Scope
opt('b', 'expandtab', true)                  -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)               -- Size of an indent
opt('b', 'smartindent', true)                -- Insert indents automatically
opt('b', 'tabstop', indent)                  -- Number of spaces tabs count for

-- Global Scope
opt('o', 'updatetime', 200)                  -- Update time for buffer changes and stuff
opt('o', 'syntax', 'on')                     -- Allow syntax highlight
opt('o', 'clipboard', 'unnamedplus')         -- Clipboard to be normal stuff
opt('o', 'shiftround', true)                 -- Shift works with >>
opt('o', 'ignorecase', true)                 -- Ignore case when searching
opt('o', 'hlsearch', true)                   -- Highlight search
opt('o', 'incsearch', true)                  -- Include search as you type
opt('o', 'scrolloff', 8)                     -- Lines of context
opt('o', 'sidescrolloff', 8)                 -- Columns of context
opt('o', 'smartcase', true)                  -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                 -- Put new windows below current
opt('o', 'splitright', true)                 -- Put new windows right of current
opt('o', 'termguicolors', true)              -- True color support
opt('o', 'wildmode', 'list:longest')         -- Command-line completion mode
opt('o', 'winbl', 10)                        -- Set floating window to be slightly transparent
opt('o', 'cmdheight', 1)                     -- Only one lne for commmand line
opt('o', 'mouse', 'a')                       -- Set floating window to be slightly transparent
opt('o', 'completeopt', 'menuone,noselect')  -- Needed for nvim-compe
  -- Folding
opt('o', 'foldmethod', 'syntax')             -- Set floating window to be slightly transparent
opt('o', 'foldcolumn', '1')                  -- Set floating window to be slightly transparent
opt('o', 'foldlevelstart', 99)               -- Set floating window to be slightly transparent


-- Window Scope
opt('w', 'list', true)                       -- Show some invisible characters (tabs...)
opt('w', 'number', true)                     -- Print line number
opt('w', 'relativenumber', true)             -- Relative line numbers

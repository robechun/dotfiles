-- Leader key -> ','
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

local opt = vim.opt

opt.visualbell = false
opt.fileencoding = 'utf-8'

-- highlighting
-- example:  vim.cmd([[highlight BufferCurrent guibg=#5fd7ff guifg=#282a2e]])

local indent = 4

-- Indentation
opt.expandtab = true                         -- Use spaces instead of tabs
opt.shiftwidth = indent                      -- Size of an indent
opt.smartindent = true                       -- Insert indents automatically
opt.tabstop = indent                         -- Number of spaces tabs count for

-- UI
opt.cursorline = true                        -- Adds a cursorline
opt.updatetime = 400                         -- Update time for buffer changes and stuff
opt.spell = true                             -- Add spelling checks
opt.clipboard = 'unnamedplus'                -- Clipboard to be normal stuff
opt.shiftround = true                        -- Shift works with >>
opt.ignorecase = true                        -- Ignore case when searching
opt.hlsearch = true                          -- Highlight search
opt.incsearch = true                         -- Include search as you type
opt.scrolloff = 8                            -- Lines of context
opt.sidescrolloff = 8                        -- Columns of context
opt.smartcase = true                         -- Don't ignore case with capitals
opt.splitbelow = true                        -- Put new windows below current
opt.splitright = true                        -- Put new windows right of current
opt.termguicolors = true                     -- True color support
opt.wildmode = 'list:longest'                -- Command-line completion mode
opt.winblend = 10                            -- Set floating window to be slightly transparent
opt.cmdheight = 1                            -- Only one line for command line
opt.mouse = 'a'                              -- Enable mouse support
opt.completeopt = 'menu,menuone,noselect'    -- Needed for nvim-cmp

-- Folding
opt.foldmethod = 'expr'                            -- Use the expr below as fold method
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'   -- Folding using treesitter
opt.foldcolumn = '1'                               -- Show foldcolumn; if so, how
opt.foldlevelstart = 99                            -- Start with no folds closed
opt.signcolumn = 'yes:1'                           -- Signs column; and how wide

-- Window
opt.list = true                              -- Show some invisible characters (tabs...)
opt.number = true                            -- Print line number
opt.relativenumber = false                   -- Relative line numbers

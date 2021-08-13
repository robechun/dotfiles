
-- undo highlight
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', {noremap = true, silent = true})

-- edit vim file fast
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})

-- Moving between windows easier
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})

-- TODO this does not work well
-- command-shift-t behavior in chrome
vim.api.nvim_set_keymap('n', '<leader><C-t>', ':vs#<CR>', {noremap = true, silent = true})

-- Quick-fix list commands
vim.api.nvim_set_keymap('n', '<C-q>', ':copen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':cnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':cprev<CR>', {noremap = true, silent = true})

-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {silent = true})

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
vim.api.nvim_set_keymap('i', '<C-U>', '<C-G>u<C-U>', {noremap = true, silent = true})

-- nvim-compe remap
local compeOpts = {noremap = true, silent = true, expr = true}

vim.api.nvim_set_keymap('i', '<C-space>', [[compe#complete()]], compeOpts)
vim.api.nvim_set_keymap('i', '<CR>',      [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr())"]], compeOpts)
vim.api.nvim_set_keymap('i', '<C-e>',     [[compe#close('<C-e>')]], compeOpts)
vim.api.nvim_set_keymap('i', '<C-f>',     [[compe#scroll({'delta': +4 })]], compeOpts)
vim.api.nvim_set_keymap('i', '<C-d>',     [[compe#scroll({'delta': -4 })]], compeOpts)

local noremapAndSilentOpts = {silent = true, noremap = true}

-- undo highlight
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', {noremap = true, silent = true})

-- Moving between windows easier
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})

-- Quick-fix list commands
vim.api.nvim_set_keymap('n', '<C-q>', ':copen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':cnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':cprev<CR>', {noremap = true, silent = true})

-- Copy to clipboard
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {silent = true})

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
vim.api.nvim_set_keymap('i', '<C-U>', '<C-G>u<C-U>', {noremap = true, silent = true})

-- Copy current directory path fast
vim.api.nvim_set_keymap("n", "<leader><C-g>", ':let @+ = system(["git", "ls-files", "--full-name", expand("%")]) <cr>', noremapAndSilentOpts)


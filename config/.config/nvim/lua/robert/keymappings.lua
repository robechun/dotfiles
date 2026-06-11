local opts = { silent = true, noremap = true }

-- undo highlight
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', opts)

-- Moving between windows easier
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })

-- Quick-fix list commands
vim.keymap.set('n', '<C-q>', ':copen<CR>', opts)
vim.keymap.set('n', '<C-n>', ':cnext<CR>', opts)
vim.keymap.set('n', '<C-b>', ':cprev<CR>', opts)

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { silent = true })

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
vim.keymap.set('i', '<C-U>', '<C-G>u<C-U>', opts)

-- Copy current directory path fast
vim.keymap.set('n', '<leader><C-g>', ':let @+ = system(["git", "ls-files", "--full-name", expand("%")]) <cr>', opts)

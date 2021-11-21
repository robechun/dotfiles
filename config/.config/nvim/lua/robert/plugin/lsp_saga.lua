vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gr', ':Lspsaga rename<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>ca', '<cmd>\'<,\'>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', {noremap = true})

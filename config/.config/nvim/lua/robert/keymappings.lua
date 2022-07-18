local noremapAndSilentOpts = {silent = true, noremap = true}

-- Toggle Folding
vim.api.nvim_set_keymap('n', '<space>', 'za', noremapAndSilentOpts)

-- Terminal related
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', noremapAndSilentOpts)
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm dir=git_dir direction=horizontal<CR>', noremapAndSilentOpts)
vim.api.nvim_set_keymap('n', '<leader><C-t>', ':2ToggleTerm size=90 dir=git_dir direction=vertical<CR>', noremapAndSilentOpts)
vim.api.nvim_set_keymap('n', '<leader><C-y>', ':2TermExec size=90 dir=git_dir direction=vertical cmd="single %:r"<CR>', noremapAndSilentOpts)

-- undo highlight
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', {noremap = true, silent = true})

-- edit vim file fast
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', {noremap = true, silent = true})

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

-- snippets
-- TODO this breaks the completion, so we're just commenting it out for now
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
-- vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- Trouble plugin
local troubleOpts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", troubleOpts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", troubleOpts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", troubleOpts)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", troubleOpts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", troubleOpts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", troubleOpts)

-- Git configurations
vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<cr>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>gh", ":lua require'robert.plugin.diffview'.diff_history_toggle()<cr>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", noremapAndSilentOpts)

-- Copy current directory path fast
vim.api.nvim_set_keymap("n", "<leader><C-g>", ':let @+ = system(["git", "ls-files", "--full-name", expand("%")]) <cr>', noremapAndSilentOpts)

-- DAP
vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<F8>", ":lua require'dap'.step_over()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<F9>", ":lua require'dap'.step_into()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_out()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>da", ":lua require'robert.plugin.dap'.attach()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require'dap'.run_to_cursor()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>dh", ":lua require'dap.ui.widgets'.hover()<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>df", ":Telescope dap frames<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>d-", ":Telescope dap list_breakpoints<CR>", noremapAndSilentOpts)
vim.api.nvim_set_keymap("n", "<leader>dt", ":TestNearest -strategy=mochaFront<CR>", noremapAndSilentOpts)
-- TODO make the 'up' and 'down' mappings


local defaultOpts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", defaultOpts)
vim.api.nvim_set_keymap("n", "<leader>q", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", defaultOpts)

require("harpoon").setup({})

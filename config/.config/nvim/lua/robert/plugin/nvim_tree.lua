vim.api.nvim_set_keymap('n', '<leader>.', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

require'nvim-tree'.setup{
    disable_netrw = false,
    filters = {
        custom = {
            '.DS_Store',
            '.idea',
            '.sass-cache',
            '.git',
            'node_modules',
            '.cache'
        }
    },
    git = {
        ignore = true
    }
}

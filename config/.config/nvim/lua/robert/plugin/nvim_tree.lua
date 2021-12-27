vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open

vim.api.nvim_set_keymap('n', '<leader>.', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

require'nvim-tree'.setup{
    disable_netrw = false,
    filters = {
        custom = {
            '.DS_Store',
            'tags',
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

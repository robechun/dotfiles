return {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    opts = {
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
    },
    keys = {
        { '<leader>.', ':NvimTreeToggle<CR>',   mode = 'n', silent = true, noremap = true },
        { '<leader>r', ':NvimTreeRefresh<CR>',  mode = 'n', silent = true, noremap = true },
        { '<leader>m', ':NvimTreeFindFile<CR>', mode = 'n', silent = true, noremap = true },
    }
}

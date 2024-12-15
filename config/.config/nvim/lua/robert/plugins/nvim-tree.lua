return {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    opts = {
        disable_netrw = false,
        filters = {
            exclude = {
                '.venv'
            },
            custom = {
                '.DS_Store',
                '.idea',
                '.sass-cache',
                '.git',
                '.cache'
            }
        },
        git = {
            ignore = false
        }
    },
    keys = {
        { '<leader>.', ':NvimTreeToggle<CR>',   mode = 'n', silent = true, noremap = true },
        { '<leader>r', ':NvimTreeRefresh<CR>',  mode = 'n', silent = true, noremap = true },
        { '<leader>m', ':NvimTreeFindFile<CR>', mode = 'n', silent = true, noremap = true },
    }
}

return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lspsaga').setup({
            opts = {
                symbol_in_winbar = {
                    enable = false
                },
                finder = {
                    layout = 'normal',
                    keys = {
                        shuttle = '<C-CR>'
                    }
                },
                lightbulb = {
                    enable = true,
                    sign = false
                },
                rename = {
                    in_select = false,
                }
            }

        })
    end,
    keys = {
        { 'K',          ':Lspsaga hover_doc<CR>',                    mode = 'n', silent = true, noremap = true },
        { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",    mode = 'n', silent = true, noremap = true },
        { "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>", mode = 'n', silent = true, noremap = true },
        { "<leader>ca", ":Lspsaga code_action<CR>",                  mode = 'n', silent = true, noremap = true },
        { "gs",         ":Lspsaga signature_help<CR>",               mode = 'n', silent = true, noremap = true },
        { "gO",         ":Lspsaga outline<CR>",                      mode = 'n', silent = true, noremap = true },
        { "gr",         ":Lspsaga finder<CR>",                       mode = 'n', silent = true, noremap = true },
        { "gp",         ":Lspsaga peek_definition<CR>",              mode = 'n', silent = true, noremap = true },
        { "<leader>gr", ":Lspsaga rename<CR>",                       mode = 'n', silent = true, noremap = true },
        { "g?",         ":Lspsaga diagnostic_jump_next<CR>",         mode = 'n', silent = true, noremap = true },
        { "gl",         ":lua vim.diagnostic.open_float()<CR>",      mode = 'n', silent = true, noremap = true },
    }
}

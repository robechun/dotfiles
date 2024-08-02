return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'python' },
            auto_install = true,
        })

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
        { 'K',          ':Lspsaga hover_doc<CR>',                          mode = 'n', silent = true, noremap = true },
        { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",           mode = 'n', silent = true, noremap = true },
        { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",          mode = 'n', silent = true, noremap = true },
        { "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>",       mode = 'n', silent = true, noremap = true },
        { "<leader>ca", ":Lspsaga code_action<CR>",                        mode = 'n', silent = true, noremap = true },
        { "gs",         ":Lspsaga signature_help<CR>",                     mode = 'n', silent = true, noremap = true },
        { "gr",         ":Lspsaga finder<CR>",                             mode = 'n', silent = true, noremap = true },
        { "gp",         ":Lspsaga peek_definition<CR>",                    mode = 'n', silent = true, noremap = true },
        { "<leader>gr", ":Lspsaga rename<CR>",                             mode = 'n', silent = true, noremap = true },
        { "g?",         ":Lspsaga diagnostic_jump_next<CR>",               mode = 'n', silent = true, noremap = true },
        { "gl",         ":lua vim.diagnostic.open_float()<CR>",            mode = 'n', silent = true, noremap = true },
        { '<leader>f',  "<cmd>lua vim.lsp.buf.format({async = true})<CR>", mode = 'n', silent = true, noremap = true },
    }
}

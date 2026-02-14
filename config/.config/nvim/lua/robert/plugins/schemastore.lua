return {
    'b0o/schemastore.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    config = function()
        vim.lsp.config('jsonls', {
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                },
            },
        })
    end
}

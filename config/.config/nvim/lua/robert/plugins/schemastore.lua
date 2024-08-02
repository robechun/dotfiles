return {
    'b0o/schemastore.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
    },
    config = function()
        require('lspconfig').jsonls.setup {
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                },
            },
        }
    end
}

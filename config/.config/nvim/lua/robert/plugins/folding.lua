return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async'
    },
    config = true,
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'NeogitStatus' },
            callback = function()
                require('ufo').detach()
                vim.opt_local.foldenable = false
                vim.opt_local.foldcolumn = '0'
            end,
        })
    end,
    keys = {
        { '<space>', 'za', mode = 'n', silent = true, noremap = true }
    }
}

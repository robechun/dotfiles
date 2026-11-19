return {
    'catgoose/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'html' },
    opts = {
        filetypes = {
            'css',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            html = {
                mode = 'foreground',
            },
        },
    },
}

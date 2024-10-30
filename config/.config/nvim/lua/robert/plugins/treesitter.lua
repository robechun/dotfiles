return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'python' },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}

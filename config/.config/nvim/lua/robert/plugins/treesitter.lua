return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    main = 'nvim-treesitter',
    opts = {
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'python', 'comment' },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}

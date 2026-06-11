return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    -- On the master branch, setup opts go to the configs module —
    -- require('nvim-treesitter').setup() takes no arguments.
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'python', 'comment' },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}

return {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    keys = {
        { '<leader>gb', ':Gitsigns blame<CR>', mode = 'n', silent = true, noremap = true },
    },
    opts = {
        current_line_blame = true,
    },
}

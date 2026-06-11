return {
    'dstein64/nvim-scrollview',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        excluded_filetypes = { 'NvimTree' },
        current_only = false,
    }

}

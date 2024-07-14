require('lspsaga').setup({
    -- Don't need the top bar to show all the call site stuff
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
})

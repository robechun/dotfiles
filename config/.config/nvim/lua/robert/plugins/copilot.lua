return {
    'zbirenbaum/copilot.lua',
    opts = {
        suggestion = {
            accept = false,
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<M-l>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
    }
}


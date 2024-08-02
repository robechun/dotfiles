return {
    'psliwka/vim-smoothie',
    config = function()
        vim.g.smoothie_speed_exponentiation_factor = 1.1
        vim.g.smoothie_redraw_at_finish = 0
        vim.g.smoothie_speed_linear_factor = 10
        vim.g.smoothie_speed_constant_factor = 50
    end
}

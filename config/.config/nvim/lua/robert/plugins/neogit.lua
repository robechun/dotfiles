return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
        { '<leader>gg', ':Neogit<CR>', mode = 'n', silent = true, noremap = true },
    }
}

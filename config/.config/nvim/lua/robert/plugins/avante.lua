return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below is optional, make sure to setup it properly if you have lazy=true
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter', 
                'nvim-tree/nvim-web-devicons'
            },
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    opts = {
        claude = {
            api_key_name = "ANTHROPIC_API_KEY",
        }
    },
}

return {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = { "lua_ls", "ruff", "pyright" },
        -- v2 auto-enables every mason-installed server; typescript-tools
        -- provides the TS LSP, so never let ts_ls start alongside it.
        automatic_enable = {
            exclude = { "ts_ls" },
        },
    },
}

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
            json = { "biome", "prettierd", "prettier", stop_after_first = true },
            jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        format_on_save = { timeout_ms = 500 },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
            biome = {
                require_cwd = true,
                cwd = function(self, ctx)
                    return require("conform.util").root_file({
                        "biome.json",
                        "biome.jsonc",
                    })(self, ctx)
                end,
                args = {
                    "format",
                    "--stdin-file-path",
                    "$FILENAME",
                },
            },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}

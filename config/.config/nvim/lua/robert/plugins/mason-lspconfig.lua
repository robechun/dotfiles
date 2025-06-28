return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    automatic_enable = false,
    config = function()
        -- Need to require mason before setting everything up
        require('mason').setup()

        -----
        -- Set up diagnostics
        local config = {
            -- disable virtual text
            virtual_text = true,
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            }
        }
        vim.diagnostic.config(config)


        -----
        -- This makes it so that we jump directly to the first available definition every time.
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.lsp.handlers["textDocument/definition"] = function(_, result, _, _)
            if not result or vim.tbl_isempty(result) then
                return
            end

            if vim.tbl_islist(result) then
                vim.lsp.util.jump_to_location(result[1])
            else
                vim.lsp.util.jump_to_location(result)
            end
        end

        -- See: h:mason-lspconfig.setup_handlers()
        local handlers = {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                -- We're using typescript-tools for LSP, so we don't want to set up tsserver.
                if server_name == "tsserver" or server_name == "ts_ls" then
                    return
                end
            end,
            -- Next, you can provide targeted overrides for specific servers. E.g.:
            --[[ ["rust_analyzer"] = function () ]]
            --[[     require("rust-tools").setup {} ]]
            --[[ end, ]]
        }

        require('lspconfig').ruff.setup {}
        require('lspconfig').pyright.setup {}
        require('lspconfig').lua_ls.setup {}

        -- Set up specific handlers after
        require('mason-lspconfig').setup({
            ensure_installed = { "lua_ls", "ruff", "pyright", "ts_ls" },
            handlers = handlers,
        })


        require("robert.plugins.typescript-tools")
    end
}

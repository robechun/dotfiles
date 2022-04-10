local has_cmp, cmp = pcall(require, 'cmp')
local lspkind = require('lspkind');

if has_cmp then
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<C-Space>"] = cmp.mapping({ i = cmp.mapping.complete() }),
            ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort() }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer', keyword_length = 2 },
            { name = 'path', max_item_count = 10 },
        }),
        experimental = {
            ghost_text = true
        },

        completion = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            scrollbar = "║",
        },
        window = {
            documentation = { border = "rounded", scrollbar = "║" },
            completion = { border = "rounded", scrollbar = "║" },
        },
        formatting = {
            fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
            format = lspkind.cmp_format({ with_text = false }),
        }
    })
end

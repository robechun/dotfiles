local has_cmp, cmp = pcall(require, 'cmp')
local lspkind = require('lspkind');

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

if has_cmp then
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<Tab>"] = vim.schedule_wrap(function(fallback)
                if require("copilot.suggestion").is_visible() then
                    require("copilot.suggestion").accept()
                elseif cmp.visible() and has_words_before() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
                end),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ["<C-Space>"] = cmp.mapping({ i = cmp.mapping.complete() }),
            ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort() }),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            --[[ { name = 'copilot' }, ]]
            { name = 'buffer', keyword_length = 3 },
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
            format = lspkind.cmp_format({
                mode = "symbol",
                max_width = 50,
                symbol_map = { Copilot = "" }
            })
        }
    })

    -- Github copilot setup
    --[[ require('copilot_cmp').setup() ]]
end

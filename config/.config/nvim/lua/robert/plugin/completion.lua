--vim.o.completeopt = "menuone,noselect"

---- Don't show the dumb matching stuff.
--vim.cmd [[set shortmess+=c]]

---- completion.nvim
--vim.g.completion_confirm_key = ""
--vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

---- Decide on length
--vim.g.completion_trigger_keyword_length = 2

------------------------------------
---- TABS for completion
--local t = function(str)
--  return vim.api.nvim_replace_termcodes(str, true, true, true)
--end

--local check_back_space = function()
--    local col = vim.fn.col('.') - 1
--    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--        return true
--    else
--        return false
--    end
--end

---- Use (s-)tab to:
----- move to prev/next item in completion menuone
----- jump to prev/next snippet's placeholder
--_G.tab_complete = function()
--  if vim.fn.pumvisible() == 1 then
--    return t "<C-n>"
--  elseif check_back_space() then
--    return t "<Tab>"
--  else
--    return vim.fn['cmp#complete']()
--  end
--end

--_G.s_tab_complete = function()
--  if vim.fn.pumvisible() == 1 then
--    return t "<C-p>"
--  else
--    return t "<S-Tab>"
--  end
--end

--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


local has_cmp, cmp = pcall(require, 'cmp')
if has_cmp then
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },
        mapping = {
            ["<C-Space>"] = cmp.mapping({ i = cmp.mapping.complete() }),
            ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort() }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        }, {
            { name = 'buffer' },
        })
    })
end






  -- cmp.setup {
  --   enabled = true;
  --   autocomplete = true;
  --   debug = false;
  --   min_length = 1;
  --   preselect = 'enable';
  --   throttle_time = 80;
  --   source_timeout = 200;
  --   incomplete_delay = 400;
  --   allow_prefix_unmatch = false;
  --   documentation = {
  --     border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
  --     winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  --     max_width = 120,
  --     min_width = 60,
  --     max_height = math.floor(vim.o.lines * 0.3),
  --     min_height = 1,
  --   };

  --   source = {
  --     path = true;
  --     buffer = true;
  --     calc = true;
  --     vsnip = true;
  --     nvim_lsp = true;
  --     nvim_lua = true;
  --     spell = false;
  --     tags = false;
  --     snippets_nvim = true;
  --   };
  -- }
-- end


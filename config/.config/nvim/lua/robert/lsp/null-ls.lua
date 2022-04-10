local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
        -- Formatting
		formatting.prettier,
		formatting.stylua,
        -- Diagnostics
        diagnostics.eslint_d,
        -- Code actions
        code_actions.eslint_d,
        -- Completion
        completion.luasnip
	},
})

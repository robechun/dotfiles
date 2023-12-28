--
-- We're using this config file to set up everything related to LSP
-- because the order of how things get set-up matters. By having it in one file,
-- it makes it a lot easier to maintain.
--

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ruff_lsp", "tsserver", "pyright", "eslint"},
})

-----
-- Set up diagnostics
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
        active = signs,
    },
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
}
vim.diagnostic.config(config)


-----
-- This makes it so that we jump directly to the first available definition every time.
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


-----
-- Set up specific handlers
local on_attach = function(client, bufnr)
    -- Highlighting references.
    -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
    -- for the highlight trigger time see: `vim.opt.updatetime`

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end

    -- client.server_capabilities.documentFormattingProvider = false

    -- The following makes sure that we don't do symbol highlighting wrong
    client.server_capabilities.semanticTokensProvider = nil
end

local handlers = {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach
        }
    end,
    -- Next, you can provide targeted overrides for specific servers. E.g.:
    --[[ ["rust_analyzer"] = function () ]]
    --[[     require("rust-tools").setup {} ]]
    --[[ end, ]]
}



-- Set up lspconfig here because we need to require mason's lspconfig first, so it makes sure we're doing in order.
require('lspconfig').tsserver.setup {
    init_options = {
        preferences = {
            importModuleSpecifierPreference = "project-relative",
        }
    },
    codeActionsOnSave = {
        source = {
            organizeImports = true
        }
    },
    filetypes = {
        'typescript',
        'typescriptreact',
        'typescript.tsx'
    }
}

require('lspconfig').ruff_lsp.setup {}
require('lspconfig').pyright.setup {}
require('lspconfig').lua_ls.setup {}
require('lspconfig').eslint.setup {}

-- Set up specific handlers after
require("mason-lspconfig").setup_handlers(handlers)

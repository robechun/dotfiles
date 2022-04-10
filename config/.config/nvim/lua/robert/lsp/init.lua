

-- local custom_init = function(client)
--   client.config.flags = client.config.flags or {}
--   client.config.flags.allow_incremental_sync = true
-- end

-- local filetype_attach = setmetatable({
--   go = function(client)
--     vim.cmd [[
--       augroup lsp_buf_format
--         au! BufWritePre <buffer>
--         autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
--       augroup END
--     ]]
--   end,
-- }, {
--   __index = function()
--     return function() end
--   end,
-- })

-- local custom_attach = function(client)
--   local filetype = vim.api.nvim_buf_get_option(0, "filetype")

--   nvim_status.on_attach(client)

--   vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
--   vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
--   vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
--   vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')

--   vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     vim.cmd [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]]
--   end

--   -- Attach any filetype specific options to the client
--   filetype_attach[filetype](client)
-- end

-- local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
-- updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)

-- -- TODO: check if this is the problem.
-- updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

-- symbols for autocomplete (not sure if it actually does anything ATM)
vim.lsp.protocol.CompletionItemKind = {
    '   (Text) ',
    '   (Method)',
    '   (Function)',
    '   (Constructor)',
    ' ﴲ  (Field)',
    '[] (Variable)',
    '   (Class)',
    ' ﰮ  (Interface)',
    '   (Module)',
    ' 襁 (Property)',
    '   (Unit)',
    '   (Value)',
    ' 練 (Enum)',
    '   (Keyword)',
    '   (Snippet)',
    '   (Color)',
    '   (File)',
    '   (Reference)',
    '   (Folder)',
    '   (EnumMember)',
    ' ﲀ  (Constant)',
    ' ﳤ  (Struct)',
    '   (Event)',
    '   (Operator)',
    '   (TypeParameter)'
}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("robert.lsp.lsp-installer")
require("robert.lsp.handlers").setup()
require("robert.lsp.null-ls")

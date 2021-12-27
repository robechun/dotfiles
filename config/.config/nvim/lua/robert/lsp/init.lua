-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}', formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'},
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)
table.insert(tsserver_args, eslint)

-- symbols for autocomplete
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

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"

local nvim_status = require "lsp-status"

local handlers = require "robert.lsp.handlers"

-- Can set this lower if needed.
-- require("vim.lsp.log").set_level "debug"
-- require("vim.lsp.log").set_level "trace"

local status = require "robert.lsp.status"
status.activate()

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local filetype_attach = setmetatable({
  go = function(client)
    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end,
}, {
  __index = function()
    return function() end
  end,
})

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  nvim_status.on_attach(client)

  vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
  vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
  vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)

-- TODO: check if this is the problem.
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local servers = {
  -- gdscript = true,
  -- graphql = true,
  -- html = true,
  -- pyright = true,
  -- vimls = true,
  -- yamlls = true,

  -- clangd = {
  --   cmd = {
  --     "clangd",
  --     "--background-index",
  --     "--suggest-missing-includes",
  --     "--clang-tidy",
  --     "--header-insertion=iwyu",
  --   },
  --   -- Required for lsp-status
  --   init_options = {
  --     clangdFileStatus = true,
  --   },
  --   handlers = nvim_status.extensions.clangd.setup(),
  -- },

  -- gopls = {
  --   root_dir = function(fname)
  --     local Path = require "plenary.path"

  --     local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
  --     local absolute_fname = Path:new(fname):absolute()

  --     if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
  --       return absolute_cwd
  --     end

  --     return lspconfig_util.root_pattern("go.mod", ".git")(fname)
  --   end,

  --   settings = {
  --     gopls = {
  --       codelenses = { test = true },
  --     },
  --   },

  --   flags = {
  --     debounce_text_changes = 200,
  --   },
  -- },

  -- rust_analyzer = true,
  -- --   settings = {
  -- --     ["rust-analyzer"] = {
  -- --     },
  -- -- },

  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      -- "javascript",
      -- "javascriptreact",
      -- "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },

  efm = {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        'javascriptreact',
        'javascript',
        'typescript',
        'typescriptreact',
        'html',
        'css',
        'json',
        'yaml',
        'vue'
    },
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
			typescript = tsserver_args,
			typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
        }
    }
  }
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end


return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

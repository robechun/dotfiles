-- TypeScript LSP, per project:
--   TS <= 5 (node_modules/typescript ships lib/tsserver.js): typescript-tools,
--     which speaks the tsserver protocol directly and skips the ts_ls shim.
--   TS >= 7 (native Go compiler, no tsserver.js): the compiler's built-in LSP
--     via nvim-lspconfig's tsc config.

-- Nearest ancestor of `path` with a TypeScript install, plus whether that
-- install ships the legacy tsserver.js (TS <= 5).
local function find_ts_install(path)
    for dir in vim.fs.parents(path) do
        if vim.uv.fs_stat(vim.fs.joinpath(dir, "node_modules", "typescript")) then
            local tsserver = vim.fs.joinpath(dir, "node_modules", "typescript", "lib", "tsserver.js")
            return dir, vim.uv.fs_stat(tsserver) ~= nil
        end
        if vim.uv.fs_stat(vim.fs.joinpath(dir, ".yarn", "sdks", "typescript", "lib", "tsserver.js")) then
            return dir, true
        end
    end
end

return {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig"
    },
    opts = {
        root_dir = function(bufnr, on_dir)
            local _, has_tsserver = find_ts_install(vim.api.nvim_buf_get_name(bufnr))
            if has_tsserver then
                on_dir(require("typescript-tools.utils").get_root_dir(bufnr))
            end
        end,
        settings = {
            separate_diagnostic_server = false,
            tsserver_file_preferences = {
                importModuleSpecifierPreference = "project-relative",
            },
            -- publish_diagnostic_on = "change",
            tsserver_format_options = {
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
            },
            tsserver_max_memory = 12288
            -- tsserver_logs = "verbose"
        },
        -- on_init = function(client)
        --     client.server_capabilities.semanticTokensProvider = nil
        -- end
    },
    config = function(_, opts)
        require("typescript-tools").setup(opts)

        vim.lsp.config("tsc", {
            root_dir = function(bufnr, on_dir)
                local dir, has_tsserver = find_ts_install(vim.api.nvim_buf_get_name(bufnr))
                if dir and not has_tsserver then
                    on_dir(dir)
                end
            end,
            -- typescript@7 ships the native binary as `tsc`; the older
            -- @typescript/native-preview package ships it as `tsgo`.
            cmd = function(dispatchers, config)
                local cmd = "tsgo"
                for _, name in ipairs { "tsgo", "tsc" } do
                    local bin = vim.fs.joinpath(config.root_dir or "", "node_modules", ".bin", name)
                    if vim.fn.executable(bin) == 1 then
                        cmd = bin
                        break
                    end
                end
                return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
            end,
            -- tsc delegates file watching to the client; Neovim's macOS
            -- FSEvents watcher then fails with EMFILE. Use :LspRestart after
            -- external changes (git checkout, pnpm install).
            capabilities = {
                workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
            },
        })
        vim.lsp.enable("tsc")
    end,
}

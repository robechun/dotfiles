require("typescript-tools").setup {
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
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end
}

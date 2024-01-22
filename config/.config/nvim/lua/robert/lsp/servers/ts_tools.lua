require("typescript-tools").setup {
    settings = {
        tsserver_file_preferences = {
            importModuleSpecifierPreference = "project-relative",
        },
        publish_diagnostic_on = "change",
        tsserver_format_options = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
        }
        -- tsserver_logs = "verbose"
    },
}

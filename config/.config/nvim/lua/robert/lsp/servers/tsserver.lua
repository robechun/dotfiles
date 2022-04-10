local opts = {
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

return opts

require('robert.settings')    -- options + leader key (must load before mappings and plugins)
require('robert.keymappings') -- non-plugin keymaps; plugin keymaps live in their specs
require('robert.diagnostics') -- vim.diagnostic UI config
require('robert.config.lazy') -- plugin manager; loads everything in lua/robert/plugins/

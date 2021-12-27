
-- Global settings (must load before plugins)
require('robert.settings')
require('robert.keymappings')

-- Load packer.nvim files
require('robert.plugins')

-- Colorscheme
require('robert.colorscheme')

-- LSP
require('robert.lsp')
require('robert.lsp.js-ts')
require('robert.lsp.docker')
require('robert.lsp.efm')
-- require('robert.lsp.status')

-- Plugins
require('robert.plugin.gitgutter')
require('robert.plugin.vista')
require('robert.plugin.lsp_saga');
require('robert.plugin.telescope')
require('robert.plugin.completion')
require('robert.plugin.colorizer')
require('robert.plugin.galaxyline')
require('robert.plugin.nvim_tree')
require('robert.plugin.scrollbar')
require('robert.plugin.prettier')
require('robert.plugin.nvim-autopairs')
require('robert.plugin.indent-blankline')
require('robert.plugin.harpoon')
require('robert.plugin.dap')
require('robert.plugin.neogit')

-- require('robert.plugin.bufferline')

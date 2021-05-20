
-- Global settings (must load before plugins)
require('robert.settings')
require('robert.keymappings')

-- Load packer.nvim files
require('robert.plugins')

-- Colorscheme
require('robert.colorscheme')

-- LSP
require('robert.lsp')
-- require('robert.lsp.status')
require('robert.lsp.js-ts')
require('robert.lsp.docker')
require('robert.lsp.efm')

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

-- require('robert.plugin.bufferline')

-- Global settings (must load before plugins)
require('robert.settings')
require('robert.keymappings')

-- Load packer.nvim files
require('robert.plugins')

-- Colorscheme
require('robert.colorscheme')

-- LSP
require('robert.lsp')

-- Plugins
require('robert.plugin.alpha')
require('robert.plugin.gitsigns')
require('robert.plugin.telescope')
require('robert.plugin.cmp')
require('robert.plugin.colorizer')
require('robert.plugin.feline-status')
require('robert.plugin.nvim_tree')
require('robert.plugin.scrollbar')
require('robert.plugin.prettier')
require('robert.plugin.nvim-autopairs')
require('robert.plugin.indent-blankline')
require('robert.plugin.harpoon')
require('robert.plugin.dap')
require('robert.plugin.neogit')
require('robert.plugin.toggleterm')
require('robert.plugin.dap-virtualtext')
require('robert.plugin.diffview')
require('robert.plugin.dap-ui')
require('robert.plugin.smoothie');
require('robert.plugin.comment');
require('robert.plugin.nvim-treesitter');

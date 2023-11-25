
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath('data') .. '/site/pack/packer/opt/'

    local plugin_path = plugin_prefix .. plugin .. '/'
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    if ok then
        vim.cmd('packadd ' .. plugin)
    end
    return ok, err, code
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- NOTE: Everything is marked optional so that when we have a clean install, we don't error out
-- and we actually download all the plugins.
return require('packer').startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use 'wbthomason/packer.nvim'

        -- Github copilot
        use {'zbirenbaum/copilot.lua', opt = true}

        -- Git Stuff
        use {'TimUntersberger/neogit', opt = true}
        use {'lewis6991/gitsigns.nvim', opt = true}
        use {'sindrets/diffview.nvim', opt = true}
        use {'tpope/vim-fugitive', opt = true}

        -- Vim Surround
        use {'tpope/vim-surround', opt = true}

        -- Vim repeat
        use {'tpope/vim-repeat', opt = true}

        -- Commenting
        use {'numToStr/Comment.nvim', opt = true}
        use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}

        -- Better Targeting of text objects
        use {'wellle/targets.vim', opt = true}

        -- Editor theme
        use {'sainnhe/gruvbox-material', opt = true}

        -- Icons for stuff
        use {'ryanoasis/vim-devicons', opt = true}

        -- LSP
        use {'neovim/nvim-lspconfig', opt = true}
        use {'tami5/lspsaga.nvim', opt = true }
        use {'kabouzeid/nvim-lspinstall', opt = true}
        use {'nvim-lua/lsp-status.nvim', opt = true}
        use {'onsails/lspkind-nvim', opt = true}
        use {'williamboman/mason.nvim', opt = true} -- LSP package manager
        use {'williamboman/mason-lspconfig.nvim', opt = true} -- LSP package manager
        use {"b0o/schemastore.nvim", opt = true}
        use {"nvimtools/none-ls.nvim", opt = true} -- null-ls replacement for now
        use {"j-hui/fidget.nvim", opt = true} -- gives status for LSP as virtual text

        -- Telescope
        use {'nvim-lua/popup.nvim', opt = true}
        use {'nvim-lua/plenary.nvim', opt = true}
        use {'nvim-telescope/telescope.nvim', opt = true}
        -- use {'nvim-telescope/telescope-fzy-native.nvim', opt = true}
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' , opt = true}

        -- AutoPairs
        use {'windwp/nvim-autopairs', opt = true}

        -- Debugging
        use {'mfussenegger/nvim-dap', opt = true}
        use {'nvim-telescope/telescope-dap.nvim', opt = true}
        use {'theHamsta/nvim-dap-virtual-text', opt = true}
        use {'rcarriga/nvim-dap-ui', opt = true}

        -- Autocomplete
        use {'hrsh7th/nvim-cmp', opt = true}
        use {'hrsh7th/cmp-nvim-lsp', opt = true}
        use {'hrsh7th/cmp-buffer', opt = true}
        use {'hrsh7th/cmp-path', opt = true}
        use {'zbirenbaum/copilot-cmp', opt = true}

        -- Snippets
        use { 'L3MON4D3/LuaSnip' , opt = true}
        use {'hrsh7th/vim-vsnip', opt = true}
        use {'hrsh7th/vim-vsnip-integ', opt = true}
        use {'rafamadriz/friendly-snippets', opt = true}
        use {'saadparwaiz1/cmp_luasnip', opt = true}

        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

        -- Spelling
        use {'lewis6991/spellsitter.nvim', opt = true}

        -- Explorer
        use {'kyazdani42/nvim-tree.lua', opt = true}

        -- Shows what keys are available
        use {'folke/which-key.nvim', opt = true}

        -- Status Line and Bufferline
        use {'kyazdani42/nvim-web-devicons', opt = true}
        use {'feline-nvim/feline.nvim', opt = true}

        -- Fancy start screen
        use {'goolord/alpha-nvim', opt = true}

        -- Colorize within vim
        use {'norcalli/nvim-colorizer.lua', opt = true}

        -- Shows scrollbar on the side
        use {'dstein64/nvim-scrollview', opt = true}

        --  Prettier
        use {'prettier/vim-prettier', opt = true}

        -- Indentation
        use {'lukas-reineke/indent-blankline.nvim', opt = true}

        -- Pretty List of problems
        use {'folke/trouble.nvim', opt = true}

        -- Smooth Scrolling
        use {'psliwka/vim-smoothie', opt = true}

        -- Solidity Support
        use {'TovarishFin/vim-solidity', opt = true}

        -- Harpoon
        use {'ThePrimeagen/harpoon', opt = true}

        -- Vim test
        use {'vim-test/vim-test', opt = true}

        -- Toggle neovim terminal
        use {'akinsho/toggleterm.nvim', opt = true}

        -- Folding
        use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

        -- Python formatting
        use {'averms/black-nvim', run = ':UpdateRemotePlugins'}

        -- !! NOTE: ORDERING MATTERS !!
        -- This "require" part is used to make sure that you're loading dependencies in order.
        -- For example, in order to make diffview.nvim work, you need to load the plenary.nvim plugin first.
        require_plugin('copilot.lua')
        require_plugin('lspkind-nvim')
        require_plugin('gruvbox-material')
        require_plugin('plenary.nvim')
        require_plugin('nvim-autopairs')
        require_plugin('nvim-dap')
        require_plugin('telescope-dap.nvim')
        require_plugin('nvim-dap-virtual-text')
        require_plugin('nvim-dap-ui')
        require_plugin('diffview.nvim')
        require_plugin('neogit')
        require_plugin('gitsigns.nvim')
        require_plugin('vim-fugitive')
        require_plugin('vim-surround')
        require_plugin('Comment.nvim')
        require_plugin('nvim-ts-context-commentstring')
        require_plugin('targets.vim')
        require_plugin('vim-devicons')
        require_plugin('nvim-lspconfig')
        require_plugin('mason.nvim')
        require_plugin('mason-lspconfig.nvim')
        require_plugin('lspsaga.nvim')
        require_plugin('nvim-lspinstall')
        require_plugin('lsp-status.nvim')
        require_plugin('popup.nvim')
        require_plugin('nvim-cmp')
        require_plugin('cmp-nvim-lsp')
        require_plugin('copilot-cmp')
        require_plugin('cmp-buffer')
        require_plugin('cmp-path')
        require_plugin('schemastore.nvim')
        require_plugin('none-ls')
        require_plugin('fidget.nvim')
        require_plugin('telescope.nvim')
        require_plugin('telescope-fzf-native.nvim')
        require_plugin('spellsitter.nvim')
        require_plugin('nvim-treesitter')
        require_plugin('nvim-tree.lua')
        require_plugin('which-key.nvim')
        require_plugin('feline.nvim')
        require_plugin('nvim-web-devicons')
        require_plugin('alpha-nvim')
        require_plugin('nvim-colorizer.lua')
        require_plugin('nvim-scrollview')
        require_plugin('vim-prettier')
        require_plugin('LuaSnip')
        require_plugin('vim-vsnip')
        require_plugin('vim-vsnip-integ')
        require_plugin('friendly-snippets')
        require_plugin('cmp_luasnip')
        require_plugin('indent-blankline.nvim')
        require_plugin('trouble.nvim')
        require_plugin('vim-smoothie')
        require_plugin('vim-solidity')
        require_plugin('harpoon')
        require_plugin('vim-test')
        require_plugin('toggleterm.nvim')
        require_plugin('vim-repeat')
        require_plugin('nvim-ufo')
    end
)

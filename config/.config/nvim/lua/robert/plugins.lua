
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
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
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

        -- Git Stuff
        use {'tpope/vim-fugitive', opt = true}
        use {'airblade/vim-gitgutter', opt = true}

        -- Vim Surround
        use {'tpope/vim-surround', opt = true}

        -- Commenting
        use {'tpope/vim-commentary', opt = true}

        -- Better Targeting of text objects
        use {'wellle/targets.vim', opt = true}

        -- Editor theme
        use {'sainnhe/gruvbox-material', opt = true}

        -- Icons for stuff
        use {'ryanoasis/vim-devicons', opt = true}

        -- LSP 
        use {'neovim/nvim-lspconfig', opt = true}
        use {'glepnir/lspsaga.nvim', opt = true}
        use {'kabouzeid/nvim-lspinstall', opt = true}
        use {'nvim-lua/lsp-status.nvim', opt = true}
        use {'onsails/lspkind-nvim', opt = true}

        -- Telescope
        use {'nvim-lua/popup.nvim', opt = true}
        use {'nvim-lua/plenary.nvim', opt = true}
        use {'nvim-telescope/telescope.nvim', opt = true}
        use {'nvim-telescope/telescope-fzy-native.nvim', opt = true}

        -- AutoPairs
        use {'windwp/nvim-autopairs', opt = true}

        -- Debugging 
        -- TODO look into this
        -- use {'mfussenegger/nvim-dap', opt = true}

        -- Autocomplete
        use {'hrsh7th/nvim-compe', opt = true}
        -- TODO snippets later when needed
        -- use {'hrsh7th/vim-vsnip', opt = true}
        -- use {'rafamadriz/friendly-snippets', opt = true}

        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

        -- Explorer
        use {'kyazdani42/nvim-tree.lua', opt = true}

        -- Get help with function stuff on side
        use {'liuchengxu/vista.vim', opt = true}

        -- Shows what keys are available
        use {'folke/which-key.nvim', opt = true}

        -- Status Line and Bufferline
        use {'glepnir/galaxyline.nvim', opt = true}
        use {'kyazdani42/nvim-web-devicons', opt = true}
        use {'romgrk/barbar.nvim', opt = true}

        -- Fancy start screen
        use {'mhinz/vim-startify', opt = true}

        -- Colorize within vim
        use {'norcalli/nvim-colorizer.lua', opt = true}

        -- Scroll within vim
        use {'dstein64/nvim-scrollview', opt = true}

        --  Prettier
        use {'prettier/vim-prettier', opt = true}


        require_plugin('nvim-autopairs')
        require_plugin('vim-fugitive')
        require_plugin('vim-gitgutter')
        require_plugin('vim-surround')
        require_plugin('vim-commentary')
        require_plugin('targets.vim')
        require_plugin('gruvbox-material')
        require_plugin('vim-devicons')
        require_plugin('nvim-lspconfig')
        require_plugin('lspsaga.nvim')
        require_plugin('nvim-lspinstall')
        require_plugin('lsp-status.nvim')
        require_plugin('lspkind-nvim')
        require_plugin('popup.nvim')
        require_plugin('plenary.nvim')
        require_plugin('nvim-compe')
        require_plugin('telescope.nvim')
        require_plugin('telescope-fzy-native.nvim')
        require_plugin('nvim-treesitter')
        require_plugin('nvim-tree.lua')
        require_plugin('vista.vim')
        require_plugin('which-key.nvim')
        require_plugin('galaxyline.nvim')
        require_plugin('nvim-web-devicons')
        require_plugin('barbar.nvim')
        require_plugin('vim-startify')
        require_plugin('nvim-colorizer.lua')
        require_plugin('nvim-scrollview')
        require_plugin('vim-prettier')
    end
)


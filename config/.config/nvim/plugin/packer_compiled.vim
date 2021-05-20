" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/robertchung/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/robertchung/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/robertchung/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/robertchung/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/robertchung/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gruvbox-material"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["lsp-status.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["scrollbar.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/scrollbar.nvim"
  },
  ["targets.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-gitgutter"
  },
  ["vim-startify"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-startify"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vista.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/robertchung/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

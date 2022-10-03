local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = '> ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-l>"] = actions.select_vertical,
                ["<C-h>"] = actions.select_horizontal,
                ["<C-q>"] = actions.send_to_qflist,
                ["<esc>"] = actions.close
            },
        }
    },
    -- extensions = {
    --     fzf = {
    --         override_generic_sorter = false,
    --         override_file_sorter = true,
    --     }
    -- }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')

local M = {}
M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.config/nvim/",
    })
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

return M


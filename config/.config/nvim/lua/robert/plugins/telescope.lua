local project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, opts)
    if not ok then require "telescope.builtin".find_files(opts) end
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
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
                file_sorter       = require('telescope.sorters').get_fzy_sorter,
                prompt_prefix     = '> ',
                color_devicons    = true,

                file_previewer    = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer    = require('telescope.previewers').vim_buffer_vimgrep.new,
                qflist_previewer  = require('telescope.previewers').vim_buffer_qflist.new,

                mappings          = {
                    i = {
                        ["<C-l>"] = actions.select_vertical,
                        ["<C-h>"] = actions.select_horizontal,
                        ["<C-q>"] = actions.send_to_qflist,
                        ["<esc>"] = actions.close
                    },
                }
            },
        }

        require('telescope').load_extension('fzf')
    end,
    keys = {
        { '<C-p>',      project_files,                                                                                mode = 'n', silent = true, noremap = true },
        { '<C-f>',      ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>', mode = 'n', silent = true, noremap = true },
        { '<leader>pw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',   mode = 'n', silent = true, noremap = true },
        { '<leader>pb', ':Telescope buffers()<CR>',                                                                   mode = 'n', silent = true, noremap = true },


    }

}

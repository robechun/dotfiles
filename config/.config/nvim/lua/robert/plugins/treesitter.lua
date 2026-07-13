return {
    'nvim-treesitter/nvim-treesitter',
    -- Pin the branch explicitly: upstream's default branch is now `main`, so an
    -- unpinned spec silently drifts between the two incompatible APIs on update.
    branch = 'main',
    -- The main branch does not support lazy-loading.
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local ts = require('nvim-treesitter')

        ts.install({
            'lua',
            'vim',
            'vimdoc',
            'markdown',
            'markdown_inline',
            'javascript',
            'typescript',
            'python',
            'comment',
        })

        -- main drops the `highlight` and `auto_install` options: highlighting is
        -- started per-buffer, and missing parsers are fetched on demand.
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                if not lang then
                    return
                end

                if vim.tbl_contains(ts.get_installed('parsers'), lang) then
                    pcall(vim.treesitter.start, ev.buf, lang)
                elseif vim.tbl_contains(ts.get_available(), lang) then
                    ts.install({ lang }):await(function()
                        if vim.api.nvim_buf_is_valid(ev.buf) then
                            pcall(vim.treesitter.start, ev.buf, lang)
                        end
                    end)
                end
            end,
        })
    end,
}

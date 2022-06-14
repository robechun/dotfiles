require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = false,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false, -- Needed for Comment.nvim.
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },

      typescript = {
        __default = '// %s',
        __multiline = '/* %s */'
      }
    }
  }
}

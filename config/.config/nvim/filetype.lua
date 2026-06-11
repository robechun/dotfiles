-- nvim has no built-in mdx detection; without this, .mdx files open as ft=conf
vim.filetype.add({
    extension = {
        mdx = 'mdx',
    },
})

-- Use the markdown treesitter parser for mdx buffers
vim.treesitter.language.register('markdown', 'mdx')

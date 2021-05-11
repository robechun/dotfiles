
vim.cmd('set background=dark')
-- Set contrast.
-- This configuration option should be placed before `colorscheme gruvbox-material`.
-- Available values: 'hard', 'medium'(default), 'soft'
vim.cmd('let g:gruvbox_material_background = \'medium\'')
vim.cmd('let g:gruvbox_material_palette = \'mix\'')
vim.cmd('colorscheme gruvbox-material')

vim.cmd('set background=dark')
-- Set contrast.
-- This configuration option should be placed before `colorscheme gruvbox-material`.
-- Available values: 'hard', 'medium'(default), 'soft'
vim.cmd('let g:gruvbox_material_background = \'medium\'')
vim.cmd('let g:gruvbox_material_palette = \'mix\'')
vim.cmd('let g:gruvbox_material_diagnostic_virtual_text = \'colored\'')
vim.cmd('let g:gruvbox_material_enable_bold = 1')
vim.cmd('let g:gruvbox_material_transparent_background = 1')
-- This needs to be set last
vim.cmd('colorscheme gruvbox-material')

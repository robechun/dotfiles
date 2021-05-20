vim.g.scrollview_excluded_filetypes = {'NvimTree'}
vim.api.nvim_command(
  "au BufEnter * if &background=='dark' | hi ScrollView guibg=#ffffff | else | hi ScrollView guibg=#bbbbbb | endif"
)

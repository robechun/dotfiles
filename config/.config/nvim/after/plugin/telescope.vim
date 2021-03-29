lua require("robert")

nnoremap <silent><C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <silent><C-f> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><leader>pl :lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <silent><leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <silent><leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent><leader>vc :lua require('robert.telescope').search_dotfiles()<CR>

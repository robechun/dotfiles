vim.api.nvim_command([[
augroup fmt
    autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx Prettier
augroup END
]])

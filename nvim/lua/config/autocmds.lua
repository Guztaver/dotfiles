-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_exec(
  [[
  augroup SwayConfig
    autocmd!
    autocmd BufRead,BufNewFile *.swconf set filetype=swayconfig
  augroup END
]],
  false
)

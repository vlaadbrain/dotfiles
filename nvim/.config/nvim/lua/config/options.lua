-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true
vim.opt.numberwidth = 1
-- vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.updatetime = 50
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 90
vim.g.autoformat = true

-- vim: ts=2 sts=2 sw=2 et

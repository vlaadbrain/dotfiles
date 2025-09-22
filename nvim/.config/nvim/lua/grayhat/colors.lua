--[[ require('nord').setup({
  borders = true
})
]]
require('solarized').setup({})
local config = require 'solarized.config'
local palette = require 'solarized.palette'
local colors = palette[config.palette]

vim.o.termguicolors = true
--vim.cmd.colorscheme 'moonlight'
vim.cmd.colorscheme 'solarized'
--vim.cmd.colorscheme 'solarized-osaka'
vim.opt.termguicolors = true
vim.o.background = 'dark'
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.red, bold = true })
--vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.cyan })
--vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.blue })


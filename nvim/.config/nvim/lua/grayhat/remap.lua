vim.g.mapleader = ' '

local wk = require('which-key')
local telescopebuiltin = require('telescope.builtin')
local harpoon = require("harpoon"); harpoon:setup()

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')

-- TODO move mappings over to which-key
vim.keymap.set("n", "<leader>ff", telescopebuiltin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", telescopebuiltin.live_grep, { desc = "Find Grep" })
vim.keymap.set("n", "<leader>fG", telescopebuiltin.git_files, { desc = "Find Git" })
vim.keymap.set("n", "<leader>fh", telescopebuiltin.help_tags, { desc = "Search help" })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon" })

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "show 1st Harpoon Buffer" })
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "show 1st Harpoon Buffer" })
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "show 1st Harpoon Buffer" })
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "show 1st Harpoon Buffer" })

vim.keymap.set("n", "<C-l>", vim.cmd.Lazy, { desc = "Lazy Boyyyy" })
vim.keymap.set("n", "<C-s>", "<cmd>Lazy sync<cr>", { desc = "Lazy Boyyyy" })

vim.keymap.set("n", "<f1>", "<cmd>Neotree toggle=true<cr>", { desc = "NeoTree!"})

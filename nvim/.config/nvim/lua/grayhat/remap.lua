vim.g.mapleader = " "

local harpoon = require("harpoon")
harpoon:setup()
local telescope = require("telescope.builtin")
local tt = require("telescope.themes")
local conform = require("conform")

vim.keymap.set({ "n", "v" }, "<leader>=", function()
	conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format file or range (in visual mode)" })

--vim.keymap.set("n", "<leader>fb", "<cmd>Neotree source=filesystem position=float<cr>", { desc = "File Browser"})
vim.keymap.set(
	"n",
	"<leader>b",
	"<cmd>Neotree source=filesystem position=float toggle<cr>",
	{ desc = "Toggle File Browser" }
)
vim.keymap.set("n", "<leader>nf", "<cmd> ene <BAR> startinsert<cr>", { desc = "New File Insert" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "yank to eol" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "yank from ^ to $" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "paste from clipboard after cursor" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "paste from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "paste from clipboard after cursor" })

vim.keymap.set("n", "<leader>ff", function()
	telescope.find_files(tt.get_ivy({}))
end, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	telescope.live_grep(tt.get_ivy({}))
end, { desc = "Telescope Find Grep" })
vim.keymap.set("n", "<leader>fh", function()
	telescope.help_tags()
end, { desc = "Telescope Search help" })

vim.keymap.set("n", "<leader>vk", function()
	telescope.keymaps()
end, { desc = "NVIM keymaps" })
vim.keymap.set("n", "<leader>vc", function()
	telescope.find_files({ cwd = "~/.config/nvim/" })
end, { desc = "NVIM config" })

vim.keymap.set("n", "<leader>pf", function()
	telescope.git_files(tt.get_dropdown({ winblend = 10 }))
end, { desc = "Project (git) search" })
vim.keymap.set("n", "<leader>ps", function()
	telescope.git_status()
end, { desc = "Project (git) status" })

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon window" })
vim.keymap.set("n", "<C-1>", function()
	harpoon:list():select(1)
end, { desc = "Harpoon show 1st Buffer" })
vim.keymap.set("n", "<C-2>", function()
	harpoon:list():select(2)
end, { desc = "Harpoon show 2nd Buffer" })
vim.keymap.set("n", "<C-3>", function()
	harpoon:list():select(3)
end, { desc = "Harpoon show 3rd Buffer" })
vim.keymap.set("n", "<C-4>", function()
	harpoon:list():select(4)
end, { desc = "Harpoon show 4th Buffer" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy window" })
vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Lazy sync" })
vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Lazy update" })

vim.keymap.set("n", "<leader>FS", ":FlutterRun <CR>", { desc = "Flutter Run" })
vim.keymap.set("n", "<leader>FQ", ":FlutterQuit <CR>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>FR", ":FlutterRestart <CR>", { desc = "Flutter Restart" })
vim.keymap.set("n", "<leader>LR", ":FlutterLspRestart <CR>", { desc = "Flutter LspRestart" })
vim.keymap.set("n", "<leader>FL", ":FlutterDevTools <CR>", { desc = "Flutter Log" })

require("grayhat.java")
require("grayhat.colors")
require("grayhat.loading")
require("grayhat.remap")
require("grayhat.set")
require("grayhat.status")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})
